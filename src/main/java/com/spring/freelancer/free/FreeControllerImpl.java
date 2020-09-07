package com.spring.freelancer.free;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.freelancer.common.file.Upload;
import com.spring.freelancer.common.sha256.Sha256;
import com.spring.freelancer.company.CareerVO;
import com.spring.freelancer.company.CompanyVO;
import com.spring.freelancer.company.ProjectVO;

@Controller("freeController")
public class FreeControllerImpl implements FreeController {

	@Autowired
	private FreeService freeService;
	@Autowired
	FreeVO freeVO;

	// --.xml에 지정된 uploadPath 가져오기
	@Resource(name = "uploadPath")
	private String uploadPath;

	@Override
	@GetMapping(value = "/admin/listFreelancers.do")
	public ModelAndView listFreelancers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<FreeVO> freelancersList = freeService.listFreelancers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("freelancersList", freelancersList);
		return mav;
	}

	@Override
	@PostMapping(value = "/admin/freeStop.do")
	public ModelAndView freeStop(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		int free_stop = Integer.parseInt(request.getParameter("free_stop"));

		if (free_stop == 0)
			freeService.freelancerStop(free_id);
		else if (free_stop == 1)
			freeService.freelancerRelease(free_id);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin/listFreelancers.do");
		mav.addObject("free_id", free_id);
		mav.addObject("free_stop", free_stop);
		return mav;

	}

	@Override
	@GetMapping(value = "/free/loginForm.do")
	public String loginForm(@RequestParam(value = "status", required = false) String status, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setAttribute("status", status);
		String goPage = (String) request.getAttribute("viewName");
		return goPage;
	}

	// 각종 Form
	@RequestMapping(value = "/free/*Form.do", method = { RequestMethod.GET, RequestMethod.POST })
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
	@PostMapping(value = "/free/addFree.do")
	public ModelAndView addFree(@ModelAttribute("free") FreeVO free, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String free_email = request.getParameter("free_email1") + "@" + request.getParameter("free_email2");
		free.setFree_email(free_email);

		String encryPW = Sha256.encrypt(free.getFree_pw());
		free.setFree_pw(encryPW);

		String free_pay = request.getParameter("free_pay");

		if (free_pay == null || free_pay == "") {
			free_pay = "협의 후 결정";
			free.setFree_pay(free_pay);
		} else {
			free_pay = free_pay.replace(",", "");
			free.setFree_pay(free_pay);
			free.setFree_pay(free_pay);
		}

		freeService.addFree(free);
		ModelAndView mav = new ModelAndView();

		mav.addObject("free_id", free.getFree_id());
		mav.addObject("career_cnt", free.getFree_career());
		mav.addObject("status", "finish");
		mav.setViewName("free/loginForm");

		return mav;
	}

	@Override
	@PostMapping(value = "/free/overlap.do")
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") FreeVO freeVO, Model model) throws Exception {
		int result = freeService.freeIdCheck(freeVO.getFree_id());
		return String.valueOf(result);
	}

	@Override
	@PostMapping(value = "/free/login.do")
	public ModelAndView login(@ModelAttribute("free") FreeVO free, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String encryPW = Sha256.encrypt(free.getFree_pw());

		free.setFree_pw(encryPW);

		freeVO = freeService.loginById(free);

		ModelAndView mav = new ModelAndView();

		if (freeVO != null) {

			String free_id = freeVO.getFree_id();
			int free_stop = freeVO.getFree_stop();

			if (free_id.equals("admin")) {
				HttpSession session = request.getSession();
				session.setAttribute("free", freeVO);

				String str = "[['Category' , 'Count'] , ";
				str += "['정상 회원수', ";
				str += freeService.normalFreeCnt();
				str += "] ,";
				str += "['정지 회원수', ";
				str += freeService.stopFreeCnt();
				str += "] ,";
				str += "['탈퇴 회원수', ";
				str += freeService.leaveFreeCnt();
				str += "]]";

				String str2 = "[['Category', 'Count'] ,";
				str2 += "['정상 기업수', ";
				str2 += freeService.normalCompCnt();
				str2 += "] ,";
				str2 += "['탈퇴 기업수', ";
				str2 += freeService.leaveCompCnt();
				str2 += "] ,";
				str2 += "['대기 기업수', ";
				str2 += freeService.waitCompCnt();
				str2 += "]]";

				mav.addObject("str", str);
				mav.addObject("str2", str2);

				String str3 = "[['연도.월' , '프리랜서 가입자', '기업 가입자'] , ";
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;

				for (int i = 1; i <= month; i++) {

					if (i < 10) {

						String ymonth = String.valueOf(year) + ".0" + String.valueOf(i);
						String ymonth2 = ymonth + "월";
						int freeMonth = freeService.monthFreeCnt(ymonth);
						int compMonth = freeService.monthCompCnt(ymonth);
						str3 += "[ '" + ymonth2 + "' , " + freeMonth + " , " + compMonth + " ] ";

					} else {

						String ymonth = String.valueOf(year) + "." + String.valueOf(i);
						String ymonth2 = ymonth + "월";
						int freeMonth = freeService.monthFreeCnt(ymonth);
						int compMonth = freeService.monthCompCnt(ymonth);
						str3 += "[ " + ymonth2 + " , " + freeMonth + " , " + compMonth + " ] ";
					}

					if (i < month)
						str3 += ", ";
				}

				str3 += "]";

				mav.addObject("str3", str3);

				mav.setViewName("admin/adminForm");
			} else if (free_stop == 1 || free_stop == 2) {
				mav.addObject("freeID", free_id);
				mav.setViewName("free/loginForm");
			} else {

				HttpSession session = request.getSession();
				session.setAttribute("free", freeVO);

				int checkNum = freeService.checkMsg(free_id);
				session.setAttribute("checkNum", checkNum);

				mav.setViewName("redirect:/free/freeMain.do");
			}
		} else {

			mav.addObject("result", "fail");
			mav.setViewName("free/loginForm");
		}
		return mav;
	}

	@RequestMapping(value = "/admin/adminForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		String str = "[['Category' , 'Count'] , ";
		str += "['정상 회원수', ";
		str += freeService.normalFreeCnt();
		str += "] ,";
		str += "['정지 회원수', ";
		str += freeService.stopFreeCnt();
		str += "] ,";
		str += "['탈퇴 회원수', ";
		str += freeService.leaveFreeCnt();
		str += "]]";

		String str2 = "[['Category', 'Count'] ,";
		str2 += "['정상 기업수', ";
		str2 += freeService.normalCompCnt();
		str2 += "] ,";
		str2 += "['탈퇴 기업수', ";
		str2 += freeService.leaveCompCnt();
		str2 += "] ,";
		str2 += "['대기 기업수', ";
		str2 += freeService.waitCompCnt();
		str2 += "]]";

		mav.addObject("str", str);
		mav.addObject("str2", str2);

		String str3 = "[['연도.월' , '프리랜서 가입자', '기업 가입자'] , ";
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;

		for (int i = 1; i <= month; i++) {

			if (i < 10) {

				String ymonth = String.valueOf(year) + ".0" + String.valueOf(i);
				String ymonth2 = ymonth + "월";
				int freeMonth = freeService.monthFreeCnt(ymonth);
				int compMonth = freeService.monthCompCnt(ymonth);
				str3 += "[ '" + ymonth2 + "' , " + freeMonth + " , " + compMonth + " ] ";

			} else {

				String ymonth = String.valueOf(year) + "." + String.valueOf(i);
				String ymonth2 = ymonth + "월";
				int freeMonth = freeService.monthFreeCnt(ymonth);
				int compMonth = freeService.monthCompCnt(ymonth);
				str3 += "[ " + ymonth2 + " , " + freeMonth + " , " + compMonth + " ] ";
			}

			if (i < month)
				str3 += ", ";
		}

		str3 += "]";

		mav.addObject("str3", str3);

		mav.setViewName("admin/adminForm");

		return mav;
	}

	@RequestMapping(value = "/free/freeMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView freeMain(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		int totalFreeCnt = freeService.totalFreeCnt();
		int totalCompCnt = freeService.totalCompCnt();
		int totalProjectCnt = freeService.totalProjectCnt();
		int curProjectCnt = freeService.currentProjectCnt();

		mav.addObject("totalFreeCnt", totalFreeCnt);
		mav.addObject("totalCompCnt", totalCompCnt);
		mav.addObject("totalProjectCnt", totalProjectCnt);
		mav.addObject("curProjectCnt", curProjectCnt);

		List<ChartCompVO> chartList = freeService.selectChart();
		mav.addObject("chartList", chartList);

		String str = "[";
		str += "['연도.월' , '프로젝트 수'] ,";
		int n = 0;
		for (ChartCompVO c : chartList) {

			str += "['";
			str += c.getPdate();
			str += "월' , ";
			str += c.getCnt();
			str += " ]";

			n++;
			if (n < chartList.size()) {
				str += " , ";
			}
		}
		str += "]";

		mav.addObject("str", str);

		mav.setViewName("free/freeMain");
		
		
		HttpSession session = request.getSession();
		freeVO = (FreeVO)session.getAttribute("free");
		int checkNum = freeService.checkMsg(freeVO.getFree_id());
		session.setAttribute("checkNum", checkNum);

		return mav;
	}

	@Override
	@GetMapping(value = "/free/findid.do")
	public ModelAndView findid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@PostMapping(value = "/free/findiddo.do")
	public ModelAndView findiddo(@ModelAttribute("info") FreeVO freeVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String free_email = request.getParameter("free_email1") + "@" + request.getParameter("free_email2");
		freeVO.setFree_email(free_email);
		System.out.println(freeVO);
		String id = freeService.findid(freeVO);
		ModelAndView mav = new ModelAndView();
		if (id == "" || id == null) {
			mav.setViewName("free/findid");
			mav.addObject("result", "findidFailed");
		} else {
			mav.setViewName("free/findidresult");
			mav.addObject("id", id);
		}
		return mav;
	}

	@Override
	@GetMapping(value = "/free/findpw.do")
	public ModelAndView findpw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@PostMapping(value = "/free/findpwdo.do")
	public ModelAndView findpwdo(@ModelAttribute("info") FreeVO freeVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String comp_memail = request.getParameter("free_email1") + "@" + request.getParameter("free_email2");
		freeVO.setFree_email(comp_memail);

		String id = freeService.findpw(freeVO);

		ModelAndView mav = new ModelAndView();
		if (id == "" || id == null) {
			mav.setViewName("free/findpw");
			mav.addObject("result", "findpwFailed");
		} else {
			mav.setViewName("free/findpwresult");
			mav.addObject("id", id);
		}
		return mav;
	}

	@Override
	@PostMapping(value = "/free/pwreset.do")
	public ModelAndView pwreset(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		String free_pw = request.getParameter("free_pw");

		String encryPW = Sha256.encrypt(free_pw);

		freeVO.setFree_id(free_id);
		freeVO.setFree_pw(encryPW);

		freeService.pwreset(freeVO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("free/pwreset");
		mav.addObject("id", freeVO.getFree_id());
		return mav;
	}

	@RequestMapping(value = "/free/goMypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goMypage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		freeVO = (FreeVO) session.getAttribute("free");

		String free_id = freeVO.getFree_id();

		String filePath = "";
		String imagePath = "";

		String str = freeVO.getFree_file();

		if (str != null && str != "") {
			int i1 = str.lastIndexOf("/");
			filePath = str.substring(i1 + 1, str.length());
		}

		String str2 = freeVO.getFree_picture();

		if (str2 != null && str2 != "") {
			int i2 = str2.lastIndexOf("\\");
			imagePath = str2.substring(i2 + 1, str2.length());
		}

		if (filePath == null || filePath == "") {
			session.setAttribute("filePath", null);
		} else {
			session.setAttribute("filePath", filePath);
		}

		if (imagePath == null || imagePath == "") {
			session.setAttribute("imagePath", null);
		} else {
			session.setAttribute("imagePath", imagePath);
		}

		int career_cnt = freeService.numOfCareer(free_id);

		int skill_cnt = freeService.numOfSkill(free_id);

		if (career_cnt == 0) {
			session.setAttribute("career_cnt", 0);
			session.setAttribute("career_num", freeVO.getFree_career());
		} else {
			session.setAttribute("career_cnt", career_cnt);
			List<FreeCareerVO> carList = freeService.selectCarList(free_id);
			session.setAttribute("carList", carList);
		}

		if (skill_cnt == 0) {
			session.setAttribute("skill_cnt", 0);
		} else {
			session.setAttribute("skill_cnt", skill_cnt);
			String[] skill = freeService.selectSkill(free_id);

			session.setAttribute("skill", skill);
		}
		
		
		int checkNum = freeService.checkMsg(freeVO.getFree_id());
		session.setAttribute("checkNum", checkNum);

		return mav;
	}

	@Override
	@ResponseBody
	@PostMapping(value = "/free/updateInfo.do")
	public HashMap<String, Object> updateDetailInfo(HttpSession session, MultipartHttpServletRequest request)
			throws Exception {

		freeVO = (FreeVO) session.getAttribute("free");

		String id = freeVO.getFree_id();
		String namePath = File.separator + id + File.separator;

		String str = "";

		MultipartFile file_pic = request.getFile("free_pic");
		
		if(file_pic != null) {
			if (freeVO.getFree_picture() == null || freeVO.getFree_picture() == "") {
	
				if (file_pic.getOriginalFilename() != null && file_pic.getOriginalFilename() != "") {
					String imageName = file_pic.getOriginalFilename();
					str = Upload.imageUpload(uploadPath, imageName, file_pic.getBytes(), namePath);
	
					freeVO.setFree_picture(str);
	
				}
	
				freeService.addFreePic(str, id);
	
			} else {
	
				String filePath = uploadPath + namePath + freeVO.getFree_picture();
				System.out.println(filePath);
				File prev = new File(filePath);
				if (prev.exists())
					prev.delete();
	
				if (file_pic.getOriginalFilename() != null && file_pic.getOriginalFilename() != "") {
					String imageName = file_pic.getOriginalFilename();
					str = Upload.imageUpload(uploadPath, imageName, file_pic.getBytes(), namePath);
	
					freeVO.setFree_picture(str);
				}
	
				freeService.addFreePic(str, id);
			}
		}

		MultipartFile free_file = request.getFile("free_file");
		
		if(free_file != null) {
			String fileName = free_file.getOriginalFilename();
	
			if (freeVO.getFree_file() == null || freeVO.getFree_file() == "") {
	
				if (fileName != null && fileName != "") {
					Upload.fileUpload(uploadPath, fileName, free_file.getBytes(), namePath);
					freeService.addFreeFile(fileName, freeVO.getFree_id());
					freeVO.setFree_file(fileName);
				}
	
			} else {
	
				String filePath = uploadPath + namePath + freeVO.getFree_file();
				File prev = new File(filePath);
				if (prev.exists())
					prev.delete();
	
				if (fileName != null && fileName != "") {
					Upload.fileUpload(uploadPath, fileName, free_file.getBytes(), namePath);
					freeService.addFreeFile(fileName, freeVO.getFree_id());
					freeVO.setFree_file(fileName);
				}
	
			}
		}

		HashMap<String, Object> map = new HashMap<>();
		map.put("free", freeVO);
		return map;
	}

	@RequestMapping(value = "/free/addCareer.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addCareer(CareerList carList, HttpServletRequest request) throws Exception {

		for (int i = 0; i < carList.getCarList().size(); i++) {
			FreeCareerVO cvo = carList.getCarList().get(i);
			freeService.addCareer(cvo);
		}

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();

		session.setAttribute("career_cnt", carList.getCarList().size());
		session.setAttribute("carList", carList.getCarList());

		mav.addObject("status", "freeCareerFin");

		mav.setViewName("free/goMypage");
		return mav;

	}

	@PostMapping(value = "/free/addFreeFile.do")
	public ModelAndView fileUp(HttpSession session,
			@RequestParam(value = "free_file", required = false) MultipartFile free_file) throws Exception {

		freeVO = (FreeVO) session.getAttribute("free");

		String fileName = free_file.getOriginalFilename();
		String namePath = File.separator + freeVO.getFree_id() + File.separator;

		if (freeVO.getFree_file() == null || freeVO.getFree_file() == "") {

			if (fileName != null && fileName != "") {
				Upload.fileUpload(uploadPath, fileName, free_file.getBytes(), namePath);
				freeService.addFreeFile(fileName, freeVO.getFree_id());
				freeVO.setFree_file(fileName);
			}

		} else {

			String filePath = uploadPath + namePath + freeVO.getFree_file();
			File prev = new File(filePath);
			if (prev.exists())
				prev.delete();

			if (fileName != null && fileName != "") {
				Upload.fileUpload(uploadPath, fileName, free_file.getBytes(), namePath);
				freeService.addFreeFile(fileName, freeVO.getFree_id());
				freeVO.setFree_file(fileName);
			}

		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("status", "freeFileFin");
		mav.setViewName("free/goMypage");

		return mav;
	}

	@RequestMapping(value = "/free/fileDown.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void fileDown(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		freeVO = (FreeVO) session.getAttribute("free");
		String path;

		if (freeVO != null)
			path = uploadPath + File.separator + freeVO.getFree_id() + File.separator + freeVO.getFree_file();
		else
			path = uploadPath + File.separator + request.getParameter("free_id") + File.separator
					+ request.getParameter("free_file");

		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(path));
		// org.apache.commons.io.FileUtils 클래스의 메소드 readFileToByteArray를 사용하여
		// 저장된 경로에서 #{bno} 값으로 첨부파일을 읽어 Byte[]형식으로 변환.

		// MIME: Multipurpose Internet Mail Extensions의 약자로 파일 변환을 의미.
		// response로 파일정보들을 담아 JSP화면으로 응답
		response.setContentType("application/octet-stream");// application/octet-stream :MIME 타입을 8비트 바이너리 배열로 지정(디코딩)
		response.setContentLength(fileByte.length);
		if (freeVO != null)
			response.setHeader("Content-Disposition",
					"attachment; fileName=\"" + URLEncoder.encode(freeVO.getFree_file(), "UTF-8") + "\";");
		else
			response.setHeader("Content-Disposition",
					"attachment; fileName=\"" + URLEncoder.encode(request.getParameter("free_file"), "UTF-8") + "\";");
		// setHeader : ("Content-Disposition","attachment;
		// fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+")
		// 괄호 안의 헤더가 이미 존재 한다면 그것 대신 "\";" 으로 대체

		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	@PostMapping(value = "/free/addSkill.do")
	public ModelAndView addSkill(@RequestParam(value = "lan", required = false) List<String> lan,
			@RequestParam(value = "free_id") String free_id, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		System.out.println(free_id);
		System.out.println(lan);

		int skill_cnt = (Integer) session.getAttribute("skill_cnt");

		if (skill_cnt != 0) {

			// 세션에 걸린 skill Array 받아오기
			String[] existArr = (String[]) session.getAttribute("skill");

			// Array to List
			ArrayList<String> arrayList = new ArrayList<>(Arrays.asList(existArr));

			for (int i = 0; i < lan.size(); i++) {
				String skill = lan.get(i);

				// 기존 기술 Arr(List)에 선택한 skill이 없는거면 추가 있는거면 아무작업 안함
				if (!arrayList.contains(skill))
					freeService.addFreeSkill(free_id, skill);
			}

		} else if (skill_cnt == 0) {
			for (int i = 0; i < lan.size(); i++) {
				String skill = lan.get(i);
				freeService.addFreeSkill(free_id, skill);
			}

		}
		
		ModelAndView mav = new ModelAndView();

		String[] skill = freeService.selectSkill(free_id);

		skill_cnt = freeService.numOfSkill(free_id);
		System.out.println(skill_cnt);


		session.setAttribute("skill_cnt", skill_cnt);
		session.setAttribute("skill", skill);

		mav.setViewName("redirect:/free/goMypage.do");

		return mav;

	}

	@PostMapping(value = "/free/modFreeInfo.do")
	public String modFree(FreeVO free, HttpSession session) throws Exception {

		freeService.modFree(free);

		freeVO = (FreeVO) session.getAttribute("free");
		freeVO.setFree_hp(free.getFree_hp());
		freeVO.setFree_email(free.getFree_email());
		freeVO.setFree_pay(free.getFree_pay());
		freeVO.setFree_level(free.getFree_level());
		freeVO.setFree_addr(free.getFree_addr());

		session.setAttribute("free", freeVO);
		return "free/goMypage";
	}

	@PostMapping(value = "/free/stopFree.do")
	public @ResponseBody String stopFreeBySelf(String free_id, HttpSession session) throws Exception {

		int res = freeService.stopFreeSelf(free_id);

		freeVO = (FreeVO) session.getAttribute("free");
		freeVO.setFree_state(1);
		session.setAttribute("free", freeVO);
		return String.valueOf(res);

	}

	@PostMapping(value = "/free/startFree.do")
	public @ResponseBody String startFreeBySelf(String free_id, HttpSession session) throws Exception {

		int res = freeService.startFreeSelf(free_id);

		freeVO = (FreeVO) session.getAttribute("free");
		freeVO.setFree_state(0);
		session.setAttribute("free", freeVO);
		return String.valueOf(res);

	}

	@PostMapping(value = "/free/drop.do")
	public String dropFree(String free_id, HttpSession session) throws Exception {

		freeService.dropFree(free_id);
		session.invalidate();
		return "main";
	}

	// 프리랜서 검색
	@Override
	@PostMapping(value = "/free/freeSearch.do")
	public ModelAndView freeSearchList(@RequestParam(value = "lan") List<String> lanList,
			@RequestParam(value = "free_level") String free_level, @RequestParam(value = "free_addr") String free_addr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		int startCount = Integer.parseInt(request.getParameter("startCount"));
		if (!(free_addr.equals("무관"))) {
			free_addr = free_addr + "%";
		}

		List<FreeVO> freeList = freeService.listFreeSearch(lanList, free_level, free_addr, startCount);

		List<FreeVO> freeLanList = freeService.listFreeSkill();

		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		ModelAndView mav = new ModelAndView("free/freeSearchForm");
		mav.addObject("freeList", freeList);
		mav.addObject("freeLanList", freeLanList);
		mav.addObject("year", year);
		mav.addObject("free_level", free_level);
		mav.addObject("free_addr", free_addr);
		mav.addObject("lanList", lanList);
		return mav;
	}

	// 더 보기
	@Override
	@PostMapping(value = "/free/more.do")
	public @ResponseBody Map<String, Object> More(@RequestParam(value = "lan") List<String> lanList,
			@RequestParam(value = "free_level") String free_level, @RequestParam(value = "free_addr") String free_addr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		int startCnt = Integer.parseInt(request.getParameter("startCount")) + 1;

		if (!(free_addr.equals("무관"))) {
			free_addr = free_addr + "%";
		}

		List<FreeVO> freeList = freeService.listFreeSearch(lanList, free_level, free_addr, startCnt);

		List<FreeVO> freeLanList = freeService.listFreeSkill();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);

		int freeCnt = freeService.freeCnt(lanList, free_level, free_addr, startCnt);

		int fCnt = freeCnt - startCnt;

		HashMap<String, Object> freeMap = new HashMap<String, Object>();
		freeMap.put("freeList", freeList);
		freeMap.put("freeLanList", freeLanList);
		freeMap.put("year", year);
		freeMap.put("fCnt", fCnt);

		return freeMap;
	}

	@Override
	@GetMapping(value = "/free/freeDetail.do")
	public String freeDetail(@RequestParam(value = "free_id") String free_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		freeVO = freeService.freeInfo(free_id);
		List<FreeCareerVO> careerList = freeService.listFreeCareer(free_id);
		String[] skillList = freeService.selectSkill(free_id);
		HttpSession session = request.getSession();
		session.setAttribute("free_id", free_id);
		CompanyVO comp = (CompanyVO) session.getAttribute("company");
		FreeZzimVO zzimvo = new FreeZzimVO();
		zzimvo.setComp_id(comp.getComp_id());
		zzimvo.setFree_id(free_id);

		int zzim = freeService.getzziminfo(zzimvo);

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		request.setAttribute("zzim", zzim);
		request.setAttribute("free", freeVO);
		request.setAttribute("careerList", careerList);
		request.setAttribute("skillList", skillList);
		request.setAttribute("year", year);

		return "free/freeDetail";
	}

	@Override
	@PostMapping(value = "/free/InsertMsg.do")
	public String InsertMsg(@ModelAttribute("info") MessageVO messageVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		freeService.insertMsg(messageVO);
		request.setAttribute("close", "close");
		return "free/msgForm";
	}

	@Override
	@GetMapping(value = "/free/message.do")
	public String message(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		freeService.updateMsg(free_id);
		List<MessageVO> msg = freeService.compMsg(free_id);
		request.setAttribute("msg", msg);

		HttpSession session = request.getSession();
		session.removeAttribute("checkNum");
		return "free/message";
	}

	@Override
	@GetMapping(value = "/free/msgDetail.do")
	public String msgDetail(@RequestParam(value = "comp_id") String comp_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		int msg_num = Integer.parseInt(request.getParameter("msg_num"));
		List<CompanyVO> company = freeService.compInfo(comp_id);
		List<MessageVO> msg = freeService.compMsg(free_id, msg_num);
		List<CareerVO> career = freeService.compCareer(comp_id);
		List<ProjectVO> project = freeService.compProject(comp_id);

		request.setAttribute("project", project);
		request.setAttribute("msg", msg);
		request.setAttribute("company", company);
		request.setAttribute("career", career);
		return "free/msgDetail";
	}

	@PostMapping(value = "/free/modCareer.do")
	public @ResponseBody String modCareer(FreeCareerVO freeCareerVO, HttpSession session) throws Exception {

		int res = freeService.modCareer(freeCareerVO);

		List<FreeCareerVO> carList = freeService.selectCarList(freeCareerVO.getFree_id());

		session.setAttribute("carList", carList);

		return String.valueOf(res);
	}

	@PostMapping(value = "/free/insertCareer.do")
	public @ResponseBody void insertCareer(FreeCareerVO freeCareerVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		freeService.insertCareer(freeCareerVO);
		String free_id = freeCareerVO.getFree_id();
		int career_cnt = freeService.numOfCareer(free_id);
		HttpSession session = request.getSession();
		session.setAttribute("career_cnt", career_cnt);
	}

	@PostMapping(value = "/free/delSkill.do")
	public @ResponseBody void deleteSkill(String free_id, String free_skill, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		freeService.delSkill(free_id, free_skill);
		String[] skill = freeService.selectSkill(free_id);
		
		HttpSession session = request.getSession();
		session.setAttribute("skill", skill);
		session.setAttribute("skill_cnt", skill.length);

	}

	@Override
	@PostMapping(value = "/free/zzimchange.do")
	public void zzimchange(@RequestParam(value = "zzim") int zzim, @RequestParam(value = "comp_id") String comp_id,
			@RequestParam(value = "free_id") String free_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(zzim);
		FreeZzimVO zzimVO = new FreeZzimVO();
		zzimVO.setComp_id(comp_id);
		zzimVO.setFree_id(free_id);
		if (zzim == 1) {
			freeService.deletezzim(zzimVO);
		} else {
			freeService.insertzzim(zzimVO);
		}

	}

	@Override
	@RequestMapping(value = "/free/zzimlist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView zzimlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		CompanyVO companyVO = (CompanyVO) session.getAttribute("company");
		List<FreeVO> listfree = freeService.getzzimlistfree(companyVO.getComp_id());
		List<FreeVO> freeLanList = freeService.listFreeSkill();
		System.out.println(listfree);
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		request.setAttribute("year", year);
		mav.addObject("freeList", listfree);
		mav.addObject("freeLanList", freeLanList);
		mav.setViewName("/free/zzimlist");
		return mav;

	}

	@Override
	@RequestMapping(value = "/free/removezzim.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removezzim(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		String comp_id = request.getParameter("comp_id");
		FreeZzimVO zzimVO = new FreeZzimVO();
		zzimVO.setComp_id(comp_id);
		zzimVO.setFree_id(free_id);
		freeService.deletezzim(zzimVO);
		System.out.println(free_id + comp_id);
		ModelAndView mav = new ModelAndView("redirect:/free/zzimlist.do");
		return mav;

	}

	@Override
	@GetMapping(value = "/free/removeMsg.do")
	public String removeMsg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		String comp_id = request.getParameter("comp_id");
		int msg_num = Integer.parseInt(request.getParameter("msg_num"));

		MessageVO messageVO = new MessageVO();
		messageVO.setComp_id(comp_id);
		messageVO.setFree_id(free_id);
		messageVO.setMsg_num(msg_num);
		freeService.deleteMsg(messageVO);
		List<MessageVO> msg = freeService.compMsg(free_id);
		request.setAttribute("msg", msg);

		return "free/message";

	}

	@Override
	@PostMapping(value = "/admin/searchFree.do")
	public ModelAndView searchFree(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		free_id = "%" + free_id + "%";
		List<FreeVO> freelancersList = freeService.freesearch(free_id);
		ModelAndView mav = new ModelAndView("admin/listFreelancers");
		mav.addObject("freelancersList", freelancersList);

		return mav;
	}
}
