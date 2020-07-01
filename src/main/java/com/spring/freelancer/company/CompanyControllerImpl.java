package com.spring.freelancer.company;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.freelancer.common.sha256.Sha256;






@RestController("companyController")
public class CompanyControllerImpl implements CompanyController {

	@Autowired
	private CompanyService companyService;
	@Autowired
	CompanyVO companyVO;
	
	//기업 회원가입
	@Override
	@RequestMapping(value="/comp/addCompany.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addCompany(@ModelAttribute("info") CompanyVO companyVO,
            				HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comp_memail = request.getParameter("comp_memail1") + "@" + request.getParameter("comp_memail2");
		companyVO.setComp_memail(comp_memail);
		
		// 암호 확인
		System.out.println("첫번째:" + companyVO.getComp_pw());
		// 비밀번호 암호화 (sha256
		String encryPassword = Sha256.encrypt(companyVO.getComp_pw());
		companyVO.setComp_pw(encryPassword);
		System.out.println("두번째:" + companyVO.getComp_pw());
		
		companyService.addCompanyInfo(companyVO);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		mav.addObject("result", "addcomp");
		return mav;
	}
	
	//아이디 중복체크
	@Override
	@RequestMapping(value="/comp/overlap.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public String idDuplChk(@ModelAttribute("vo") CompanyVO companyVO , Model model) throws Exception {
		int result = companyService.compIdCheck(companyVO.getComp_id());
		return String.valueOf(result);
	}
	
	
	//기업 가입 승인할 리스트
	@Override
	@RequestMapping(value="/admin/compAppro.do" ,method = RequestMethod.GET)
	public ModelAndView compApproList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<CompanyVO> compApproList = companyService.listCompAppro();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("compApproList", compApproList);
		return mav;
	}
	
	//기업 가입 승인
	@Override
	@RequestMapping(value="/admin/appro.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView compApprove(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comp_id = request.getParameter("comp_id");
		companyService.updateComp(comp_id);
		ModelAndView mav = new ModelAndView("redirect:/admin/compAppro.do");
		return mav;
	}
	
	//기업 로그인
	@RequestMapping(value = "/comp/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(@ModelAttribute("company") CompanyVO company,
	                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 암호 확인
	    System.out.println("첫번째:" + company.getComp_pw());
	    // 비밀번호 암호화 (sha256)
	    String encryPassword = Sha256.encrypt(company.getComp_pw());
	    company.setComp_pw(encryPassword);
	    System.out.println("두번째:" + company.getComp_pw());
		
	    companyVO =  companyService.login(company);
	    
	    ModelAndView mav = new ModelAndView();
	    
	    System.out.println("controller: "+companyVO);
	    
	    if(companyVO != null) {
	    	HttpSession session = request.getSession();
	        session.setAttribute("company", companyVO);
	        mav.setViewName("redirect:/comp/compSiteForm.do");
	        session.setAttribute("isLogOn", true);
	        System.out.println("성공");
	    }else {
	    	mav.addObject("result", "loginFailed");
	        mav.setViewName("redirect:/comp/loginForm.do");
	        System.out.println("오류");
	    }
	      
	    return mav;  
	}
	
	//기업 로그아웃
	@RequestMapping(value = "/comp/logout.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("company");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView("redirect:/comp/loginForm.do");
		return mav;
	}
	
	//각종 Form
	@RequestMapping(value="/comp/*Form.do", method={RequestMethod.GET, RequestMethod.POST})
	private ModelAndView form(@RequestParam(value="result", required=false) String result,
	                       @RequestParam(value="action", required=false) String action,
	                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	      String viewName = (String)request.getAttribute("viewName");
	      HttpSession session = request.getSession();
	      session.setAttribute("action", action);
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName(viewName);
	      return mav;
	}
	
	@Override
	@RequestMapping(value = "/comp/findid.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView findid(HttpServletRequest request,
	                           HttpServletResponse response) throws Exception {
	   String viewName = (String) request.getAttribute("viewName");
	   ModelAndView mav = new ModelAndView(viewName);
	   return mav;
	}
	@Override
	@RequestMapping(value="/comp/findiddo.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView findiddo(@ModelAttribute("info") CompanyVO companyVO,
	                        HttpServletRequest request, HttpServletResponse response) throws Exception {
	   String comp_memail = request.getParameter("comp_memail1") + "@" + request.getParameter("comp_memail2");
	   companyVO.setComp_memail(comp_memail);
	   String id = companyService.findid(companyVO);
	   ModelAndView mav = new ModelAndView();
	   if(id==""||id==null) {
	      mav.setViewName("/comp/findid");
	      mav.addObject("result", "findidFailed");
	   }else{
	      mav.setViewName("/comp/findidresult");
	      mav.addObject("id",id);
	   }
	      return mav;
	}

	@Override
	@RequestMapping(value = "/comp/findpw.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView findpw(HttpServletRequest request,
	                           HttpServletResponse response) throws Exception {
	   String viewName = (String) request.getAttribute("viewName");
	   ModelAndView mav = new ModelAndView(viewName);
	   return mav;
	}
	   

@Override
@RequestMapping(value="/comp/findpwdo.do" ,method = {RequestMethod.GET,RequestMethod.POST})
public ModelAndView findpwdo(@ModelAttribute("info") CompanyVO companyVO,
                        HttpServletRequest request, HttpServletResponse response) throws Exception {
	String comp_memail = request.getParameter("comp_memail1") + "@" + request.getParameter("comp_memail2");
    companyVO.setComp_memail(comp_memail);
    String id = companyService.findpw(companyVO);
    ModelAndView mav = new ModelAndView();
    if(id==""||id==null) {
	      mav.setViewName("/comp/findpw");
	      mav.addObject("result", "findpwFailed");
    }else{
         mav.setViewName("/comp/findpwresult");
         mav.addObject("id",id);
    }
      return mav;
}

	   
	   
	   
	   @Override
	   @RequestMapping(value="/comp/pwreset.do" ,method = {RequestMethod.GET,RequestMethod.POST})
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
	      mav.addObject("id",companyVO.getComp_id());
	      return mav;
	   }

	
}