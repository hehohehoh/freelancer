package com.spring.freelancer.company;

import java.sql.Date;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.freelancer.common.sha256.Sha256;
import com.spring.freelancer.free.FreeVO;

@Controller("companyController")
public class CompanyControllerImpl implements CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	CompanyVO companyVO;
	@Autowired
	ProjectVO projectVO;

	// 기업 회원가입
	@Override
	@PostMapping(value = "/comp/addCompany.do")
	public ModelAndView addCompany(@ModelAttribute("info") CompanyVO companyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String comp_memail = request.getParameter("comp_memail1") + "@" + request.getParameter("comp_memail2");
		companyVO.setComp_memail(comp_memail);

		// 비밀번호 암호화 (sha256
		String encryPassword = Sha256.encrypt(companyVO.getComp_pw());
		companyVO.setComp_pw(encryPassword);

		companyService.addCompanyInfo(companyVO);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		mav.addObject("result", "addcomp");
		return mav;
	}

	// 아이디 중복체크
	@Override
	@ResponseBody
	@PostMapping(value = "/comp/overlap.do")
	public String idDuplChk(@ModelAttribute("vo") CompanyVO companyVO, Model model) throws Exception {
		int result = companyService.compIdCheck(companyVO.getComp_id());
		return String.valueOf(result);
	}

	// 기업 가입 승인할 리스트
	@Override
	@GetMapping(value = "/admin/compAppro.do")
	public ModelAndView compApproList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<CompanyVO> compApproList = companyService.listCompAppro();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("compApproList", compApproList);
		return mav;
	}

	// 기업 가입 승인
	@Override
	@PostMapping(value = "/admin/appro.do")
	public ModelAndView compApprove(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comp_id = request.getParameter("comp_id");
		companyService.updateComp(comp_id);
		ModelAndView mav = new ModelAndView("redirect:/admin/compAppro.do");
		return mav;
	}

	// 기업 로그인
	@PostMapping(value = "/comp/login.do")
	public ModelAndView login(@ModelAttribute("company") CompanyVO company, @ModelAttribute("free") FreeVO free,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 비밀번호 암호화 (sha256)
		String encryPassword = Sha256.encrypt(company.getComp_pw());
		company.setComp_pw(encryPassword);
		companyVO = companyService.login(company);

		ModelAndView mav = new ModelAndView();

		if (companyVO != null) {

			String compID = companyVO.getComp_id();
			int comp_stop = companyVO.getComp_stop();

			if (compID.equals("admin")) {

				FreeVO freeVO = new FreeVO();
				freeVO.setFree_id("admin");
				freeVO.setFree_firstName("리자");
				freeVO.setFree_lastName("관");
				HttpSession session = request.getSession();
				session.setAttribute("free", freeVO);

				String str = "[['Category' , 'Count'] , ";
				str += "['정상 회원수', ";
				str += companyService.normalFreeCnt();
				str += "] ,";
				str += "['정지 회원수', ";
				str += companyService.stopFreeCnt();
				str += "] ,";
				str += "['탈퇴 회원수', ";
				str += companyService.leaveFreeCnt();
				str += "]]";

				String str2 = "[['Category', 'Count'] ,";
				str2 += "['정상 기업수', ";
				str2 += companyService.normalCompCnt();
				str2 += "] ,";
				str2 += "['탈퇴 기업수', ";
				str2 += companyService.leaveCompCnt();
				str2 += "] ,";
				str2 += "['대기 기업수', ";
				str2 += companyService.waitCompCnt();
				str2 += "]]";

				mav.addObject("str", str);
				mav.addObject("str2", str2);

				String str3 = "[['연도.월' , '프리랜서 가입자', '기업 가입자'] , ";
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;

				System.out.println(year + "." + month);

				for (int i = 1; i <= month; i++) {

					if (i < 10) {

						String ymonth = String.valueOf(year) + ".0" + String.valueOf(i);
						String ymonth2 = ymonth + "월";
						int freeMonth = companyService.monthFreeCnt(ymonth);
						int compMonth = companyService.monthCompCnt(ymonth);
						str3 += "[ '" + ymonth2 + "' , " + freeMonth + " , " + compMonth + " ] ";

					} else {

						String ymonth = String.valueOf(year) + "." + String.valueOf(i);
						String ymonth2 = ymonth + "월";
						int freeMonth = companyService.monthFreeCnt(ymonth);
						int compMonth = companyService.monthCompCnt(ymonth);
						str3 += "[ '" + ymonth2 + "' , " + freeMonth + " , " + compMonth + " ] ";
					}

					if (i < month)
						str3 += ", ";
				}

				str3 += "]";

				mav.addObject("str3", str3);
				mav.setViewName("admin/adminForm");
			} else if (comp_stop == 1 || comp_stop == 2 || comp_stop == 3) {
				mav.addObject("compID", compID);
				mav.setViewName("comp/loginForm");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("company", companyVO);

				mav.setViewName("redirect:/comp/compMain.do");
			}
		} else {
			mav.addObject("result", "loginFailed");
			mav.setViewName("redirect:/comp/loginForm.do");
		}

		return mav;
	}

	@RequestMapping(value = "/comp/compMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView compMain(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		int totalFreeCnt = companyService.totalFreeCnt();
		int totalCompCnt = companyService.totalCompCnt();
		int totalProjectCnt = companyService.totalProjectCnt();
		int curProjectCnt = companyService.currentProjectCnt();

		mav.addObject("totalFreeCnt", totalFreeCnt);
		mav.addObject("totalCompCnt", totalCompCnt);
		mav.addObject("totalProjectCnt", totalProjectCnt);
		mav.addObject("curProjectCnt", curProjectCnt);

		List<ChartFreeVO> chartList = companyService.selectChart();
		mav.addObject("chartList", chartList);

		String str = "[";
		str += "['연도.월' , '프로젝트 수'] ,";
		int n = 0;
		for (ChartFreeVO c : chartList) {

			str += "['";
			str += c.getPpdate();
			str += "월' , ";
			str += c.getCcnt();
			str += " ]";

			n++;
			if (n < chartList.size()) {
				str += " , ";
			}
		}
		str += "]";

		mav.addObject("str", str);

		mav.setViewName("comp/compMain");

		return mav;
	}

	// 기업 로그아웃
	@GetMapping(value = "/logout.do")
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "main";
	}

	// 각종 Form
	@RequestMapping(value = "/comp/*Form.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@GetMapping(value = "/comp/findid.do")
	public ModelAndView findid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@PostMapping(value = "/comp/findiddo.do")
	public ModelAndView findiddo(@ModelAttribute("info") CompanyVO companyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String comp_memail = request.getParameter("comp_memail1") + "@" + request.getParameter("comp_memail2");
		companyVO.setComp_memail(comp_memail);
		String id = companyService.findid(companyVO);
		ModelAndView mav = new ModelAndView();
		if (id == "" || id == null) {
			mav.setViewName("comp/findid");
			mav.addObject("result", "findidFailed");
		} else {
			mav.setViewName("comp/findidresult");
			mav.addObject("id", id);
		}
		return mav;
	}

	@Override
	@GetMapping(value = "/comp/findpw.do")
	public ModelAndView findpw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@PostMapping(value = "/comp/findpwdo.do")
	public ModelAndView findpwdo(@ModelAttribute("info") CompanyVO companyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String comp_memail = request.getParameter("comp_memail1") + "@" + request.getParameter("comp_memail2");
		companyVO.setComp_memail(comp_memail);
		String id = companyService.findpw(companyVO);
		ModelAndView mav = new ModelAndView();
		if (id == "" || id == null) {
			mav.setViewName("comp/findpw");
			mav.addObject("result", "findpwFailed");
		} else {
			mav.setViewName("comp/findpwresult");
			mav.addObject("id", id);
		}
		return mav;
	}

	@Override
	@PostMapping(value = "/comp/pwreset.do")
	public ModelAndView pwreset(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comp_id = request.getParameter("comp_id");
		String comp_pw = request.getParameter("comp_pw");

		// 비밀번호 암호화 (sha256
		String encryPassword = Sha256.encrypt(comp_pw);

		companyVO.setComp_id(comp_id);
		companyVO.setComp_pw(encryPassword);
		companyService.pwreset(companyVO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/comp/pwreset");
		mav.addObject("id", companyVO.getComp_id());
		return mav;
	}

	// 마이페이지 비밀번호 입력
	@Override
	@GetMapping(value = "/comp/mypagepw.do")
	public ModelAndView mypagepw(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		return mav;
	}

	// 마이페이지 비밀번호 확인
	@Override
	@PostMapping(value = "/comp/pwcheck.do")
	public ModelAndView mypagePwCheck(@ModelAttribute("info") CompanyVO companyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		companyVO = (CompanyVO) session.getAttribute("company");

		String comp_pw = companyVO.getComp_pw();
		String pwCheck = request.getParameter("pwcheck");

		String pwcheck = "0";

		if (pwCheck != null) {
			pwcheck = Sha256.encrypt(pwCheck);
		}
		if (comp_pw.equals(pwcheck)) {
			mav.setViewName("redirect:/comp/remypage.do");
		} else {
			mav.setViewName("redirect:/comp/mypagepw.do");
			mav.addObject("result", "Failed");
		}

		return mav;
	}

	// 마이페이지 기본정보 수정
	@Override
	@RequestMapping(value = "/comp/remypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		companyVO = (CompanyVO) session.getAttribute("company");

		String comp_mname = companyVO.getComp_mname();
		String comp_mhr = companyVO.getComp_mhp();
		String comp_memail = companyVO.getComp_memail();

		companyVO.setComp_mname(comp_mname);
		companyVO.setComp_mhp(comp_mhr);
		companyVO.setComp_memail(comp_memail);

		String comp_mname_re = request.getParameter("comp_mname");
		String comp_mhp_re = request.getParameter("comp_mhp");
		String comp_memail_re = request.getParameter("comp_memail");

		if (comp_mname_re != null && comp_mhp_re != null && comp_memail_re != null) {

			System.out.println(comp_mname_re);
			System.out.println(comp_mhp_re);
			System.out.println(comp_memail_re);

			companyVO.setComp_mname(comp_mname_re);
			companyVO.setComp_mhp(comp_mhp_re);
			companyVO.setComp_memail(comp_memail_re);

		}

		companyService.mypage(companyVO);

		String viewName = (String) request.getAttribute("viewName");

		List<CompanyVO> careerList = companyService.career(companyVO);
		List<ProjectVO> projectList = companyService.project(companyVO);

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("career", careerList);
		mav.addObject("project", projectList);
		mav.addObject("info", "info");

		session.setAttribute("career", careerList);
		session.setAttribute("project", projectList);

		return mav;

	}

	// 마이페이지 경력 추가
	@Override
	@PostMapping(value = "/comp/careerin.do")
	public ModelAndView mypageCareerin(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		int comp_cnum_in = Integer.valueOf(request.getParameter("comp_cnum"));
		String comp_pname_in = request.getParameter("comp_pname");
		String comp_pwork_in = request.getParameter("comp_pwork");
		Date comp_startdate_in = Date.valueOf(request.getParameter("comp_startdate"));
		Date comp_finishdate_in = Date.valueOf(request.getParameter("comp_finishdate"));

		companyVO.setComp_cnum(comp_cnum_in);
		companyVO.setComp_pname(comp_pname_in);
		companyVO.setComp_pwork(comp_pwork_in);
		companyVO.setComp_startdate(comp_startdate_in);
		companyVO.setComp_finishdate(comp_finishdate_in);

		companyService.incareer(companyVO);
		String comp_id = companyVO.getComp_id();

		companyService.updateCareer(comp_id);
		mav.addObject("addCareer", "add");
		mav.setViewName("redirect:/comp/remypage.do");

		return mav;
	}

	@Override
	@PostMapping(value = "/comp/projectin.do")
	public ModelAndView mypageProjectin(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String comp_id_in = request.getParameter("comp_id");
		int proj_num_in = Integer.valueOf(request.getParameter("proj_num"));
		String proj_name_in = request.getParameter("proj_name");
		String proj_work_in = request.getParameter("proj_work");
		Date proj_startdate_in = Date.valueOf(request.getParameter("proj_startdate"));
		Date proj_finishdate_in = Date.valueOf(request.getParameter("proj_finishdate"));

		projectVO.setComp_id(comp_id_in);
		projectVO.setProj_num(proj_num_in);
		projectVO.setProj_name(proj_name_in);
		projectVO.setProj_work(proj_work_in);
		projectVO.setProj_startdate(proj_startdate_in);
		projectVO.setProj_finishdate(proj_finishdate_in);

		companyService.inproject(projectVO);

		mav.setViewName("redirect:/comp/remypage.do");
		mav.addObject("addProject", "add");
		return mav;
	}

	// 마이페이지 경력 수정
	@Override
	@PostMapping(value = "/comp/careerre.do")
	public ModelAndView mypageCareerre(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		int comp_cnum_re = Integer.valueOf(request.getParameter("comp_cnum"));
		String comp_pname_re = request.getParameter("comp_pname");
		String comp_pwork_re = request.getParameter("comp_pwork");
		Date comp_startdate_re = Date.valueOf(request.getParameter("comp_startdate"));
		Date comp_finishdate_re = Date.valueOf(request.getParameter("comp_finishdate"));

		companyVO.setComp_cnum(comp_cnum_re);
		companyVO.setComp_pname(comp_pname_re);
		companyVO.setComp_pwork(comp_pwork_re);
		companyVO.setComp_startdate(comp_startdate_re);
		companyVO.setComp_finishdate(comp_finishdate_re);

		companyService.recareer(companyVO);

		mav.setViewName("redirect:/comp/remypage.do");
		mav.addObject("addCareer", "add");
		return mav;

	}

	@Override
	@PostMapping(value = "/comp/projecter.do")
	public ModelAndView mypageProjecter(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String comp_id_re = request.getParameter("comp_id");
		int proj_num_re = Integer.valueOf(request.getParameter("proj_num"));
		String proj_name_re = request.getParameter("proj_name");
		String proj_work_re = request.getParameter("proj_work");
		Date proj_startdate_re = Date.valueOf(request.getParameter("proj_startdate"));
		Date proj_finishdate_re = Date.valueOf(request.getParameter("proj_finishdate"));

		projectVO.setComp_id(comp_id_re);
		projectVO.setProj_num(proj_num_re);
		projectVO.setProj_name(proj_name_re);
		projectVO.setProj_work(proj_work_re);
		projectVO.setProj_startdate(proj_startdate_re);
		projectVO.setProj_finishdate(proj_finishdate_re);

		companyService.projecter(projectVO);

		mav.setViewName("redirect:/comp/remypage.do");
		mav.addObject("addProject", "add");
		return mav;

	}

	// 마이페이지 비밀번호 변경
	@Override
	@RequestMapping(value = "/comp/mypwreset.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypwreset(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		companyVO = (CompanyVO) session.getAttribute("company");

		ModelAndView mav = new ModelAndView();

		String pass = companyVO.getComp_pw();

		String my_pw = request.getParameter("my_pw");
		String re_pw = request.getParameter("re_pw");
		String rere_pw = request.getParameter("rere_pw");

		String my = "0";
		String re = "0";
		String rere = "0";

		if (my_pw != null && re_pw != null && rere_pw != null) {

			my = Sha256.encrypt(my_pw);
			re = Sha256.encrypt(re_pw);
			rere = Sha256.encrypt(rere_pw);

			if (!my.equals(pass)) {
				mav.setViewName("redirect:/comp/mypwreset.do");
				mav.addObject("result", "Failed1"); // 현재 비밀번호 다를 때

			} else if (my.equals(re)) {
				mav.setViewName("redirect:/comp/mypwreset.do");
				mav.addObject("result", "Failed2"); // 현재 비밀번호랑 변경 비밀번호 같을 때
			}

			else if (!re.equals(rere)) {
				mav.setViewName("redirect:/comp/mypwreset.do");
				mav.addObject("result", "Failed3"); // 변경 비밀번호랑 비밀번호 확인이 다를 때
			}

			else if (my.equals(pass) && !my.equals(re) && re.equals(rere)) {

				companyVO.setComp_pw(rere);
				companyService.pwreset(companyVO);

				mav.setViewName("redirect:/comp/remypage.do");
				mav.addObject("result", "Ok");
			}
		}

		return mav;

	}

	// 마이페이지 회원 탈퇴
	@Override
	@GetMapping(value = "/comp/compout.do")
	public ModelAndView Compout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		companyVO = (CompanyVO) session.getAttribute("company");

		companyService.Compout(companyVO);

		mav.setViewName("redirect:/main.do");

		return mav;
	}

	@Override
	@GetMapping(value = "/admin/listCompanys.do")
	public String listCompanys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<CompanyVO> compList = companyService.compList();
		request.setAttribute("compList", compList);

		return "admin/listCompanys";
	}

	@Override
	@PostMapping(value = "/admin/compStop.do")
	public String compStop(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comp_id = request.getParameter("comp_id");
		int comp_stop = Integer.parseInt(request.getParameter("comp_stop"));

		if (comp_stop == 0)
			companyService.compStop(comp_id);
		else if (comp_stop == 1)
			companyService.compRelease(comp_id);

		List<CompanyVO> compList = companyService.compList();
		request.setAttribute("compList", compList);
		request.setAttribute("comp_id", comp_id);
		request.setAttribute("comp_stop", comp_stop);
		return "admin/listCompanys";

	}

	@Override
	@GetMapping(value = "/comp/delproject.do")
	public ModelAndView delproject(@ModelAttribute("info") ProjectVO projectVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(projectVO);
		companyService.delproj(projectVO);
		ModelAndView mav = new ModelAndView("redirect:/comp/remypage.do");
		mav.addObject("addProject", "add");

		return mav;

	}

	@Override
	@PostMapping(value = "/admin/searchComp.do")
	public ModelAndView searchComp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comp_id = request.getParameter("comp_id");
		comp_id = "%" + comp_id + "%";
		List<CompanyVO> compList = companyService.compsearch(comp_id);
		ModelAndView mav = new ModelAndView("admin/listCompanys");
		mav.addObject("compList", compList);
		
		return mav;
	}

}