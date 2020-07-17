package com.spring.freelancer.company;

import java.sql.Date;
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
	    	
		    String compID = companyVO.getComp_id();
		    int comp_stop = companyVO.getComp_stop();
		    
	    	if(compID.equals("admin")) {
	    		HttpSession session = request.getSession();
	    		session.setAttribute("company", companyVO);
	    		mav.setViewName("admin/adminForm");
	    	}else if(comp_stop == 1 || comp_stop==2 || comp_stop==3){
	    		mav.addObject("compID", compID);
	    		mav.setViewName("comp/loginForm");
	    	}
	    	else {
	    		HttpSession session = request.getSession();
	    		session.setAttribute("company", companyVO);
	    		mav.setViewName("redirect:/comp/compSiteForm.do");
	    		session.setAttribute("isLogOn", true);
	    		System.out.println("성공");	
	    	}
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
	      mav.setViewName("/comp/resultidnull");
	   }else{
	      mav.setViewName("/comp/resultidnotnull");
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
	         mav.setViewName("/comp/resultpwnull");
	    }else{
	         mav.setViewName("/comp/resultpwnotnull");
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
	   
	 //마이페이지 비밀번호 입력
	      @Override
	      @RequestMapping(value="/comp/mypagepw.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	      public ModelAndView mypagepw(HttpServletRequest request, HttpServletResponse response) throws Exception {
	         
	         String viewName = (String) request.getAttribute("viewName");
	         ModelAndView mav = new ModelAndView(viewName);
	       
	         return mav;
	      }
	      
	      //마이페이지 비밀번호 확인
	      @Override
	      @RequestMapping(value="/comp/pwcheck.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	      public ModelAndView mypagePwCheck(@ModelAttribute("info") CompanyVO companyVO,
	                                 HttpServletRequest request, HttpServletResponse response) throws Exception {
	         
	         ModelAndView mav = new ModelAndView();
	         
	         HttpSession session = request.getSession();
	         companyVO = (CompanyVO) session.getAttribute("company");
	        
	         System.out.println("주연 : " + companyVO);
	         
	         String comp_pw = companyVO.getComp_pw();
	         
	         System.out.println("주연 비밀번호 : "+comp_pw);
	        
	         String pwCheck = request.getParameter("pwcheck");
	         
	         System.out.println("주연 입력 비밀번호 : "+pwCheck);
	         
	         String pwcheck="0";
	         
	         if(pwCheck != null) {
	                  
	         pwcheck = Sha256.encrypt(pwCheck);
	        
	         System.out.println("주연 입력 비밀번호  암호화 : "+pwcheck);
	         
	         }
	         
	         if(comp_pw.equals(pwcheck)) {
	            mav.setViewName("redirect:/comp/remypage.do");
	            System.out.println("입력한 비밀번호랑 기존 비밀번호랑 같음");
	         }else {
	            mav.setViewName("redirect:/comp/mypagepw.do");
	            System.out.println("입력한 비밀번호랑 기존 비밀번호랑 다름");
	            mav.addObject("result", "Failed");
	         }
	         
	         return mav;
	      }
	       
	      //마이페이지 기본정보 수정
	      @Override
	      @RequestMapping(value="/comp/remypage.do" ,method = {RequestMethod.GET,RequestMethod.POST})
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
	         
	         if(comp_mname_re != null && comp_mhp_re != null && comp_memail_re != null) {
	         
	         System.out.println(comp_mname_re);
	         System.out.println(comp_mhp_re);
	         System.out.println(comp_memail_re);
	         
	         companyVO.setComp_mname(comp_mname_re);
	         companyVO.setComp_mhp(comp_mhp_re);
	         companyVO.setComp_memail(comp_memail_re);
	         
	         }
	         
	         System.out.println("주연 값 저장 확인 : " + companyVO);
	         
	         companyService.mypage(companyVO);
	         
	         ModelAndView mav = new ModelAndView();      
	         
	         return mav;
	         
	      }
	      
	      //마이페이지 경력 보여주기
	      @Override
	      @RequestMapping(value="/comp/recareer.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	      public ModelAndView mypageCareer(HttpServletRequest request, HttpServletResponse response) throws Exception {
	         
	          String viewName = (String) request.getAttribute("viewName");
	          
	          List<CompanyVO> careerList = companyService.career(companyVO);
	          
	          ModelAndView mav = new ModelAndView(viewName);      
	         
	         System.out.println(careerList);
	         
	         mav.addObject("career", careerList);
	         
	         System.out.println(companyVO);
	         
	         HttpSession session = request.getSession();
	         
	           session.setAttribute("career", careerList);
	         
	         return mav;
	        
	      }
	      
	      //마이페이지 경력 추가
	      @Override
	      @RequestMapping(value="/comp/careerin.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	      public ModelAndView mypageCareerin(HttpServletRequest request, HttpServletResponse response) throws Exception{
	         
	          String viewName = (String) request.getAttribute("viewName");
	          
	          List<CompanyVO> careerList = companyService.career(companyVO);
	          
	          ModelAndView mav = new ModelAndView(viewName);      
	         
	         System.out.println(careerList);
	         
	         
	         int comp_cnum_in = Integer.valueOf(request.getParameter("comp_cnum"));
	          String comp_pname_in = request.getParameter("comp_pname");
	         String comp_pwork_in = request.getParameter("comp_pwork");
	         Date comp_startdate_in = Date.valueOf(request.getParameter("comp_startdate"));
	         Date comp_finishdate_in = Date.valueOf(request.getParameter("comp_finishdate"));
	         
	         System.out.println(comp_cnum_in);
	         System.out.println(comp_pname_in);
	         System.out.println(comp_pwork_in);
	         System.out.println(comp_startdate_in);
	         System.out.println(comp_finishdate_in);
	         
	         companyVO.setComp_cnum(comp_cnum_in);
	         companyVO.setComp_pname(comp_pname_in);
	         companyVO.setComp_pwork(comp_pwork_in);
	         companyVO.setComp_startdate(comp_startdate_in);
	         companyVO.setComp_finishdate(comp_finishdate_in);
	         
	         companyService.incareer(companyVO);
	         
	         System.out.println(companyVO);
	         
	         mav.setViewName("redirect:/comp/recareer.do");
	         
	         return mav;
	      }
	      
	      //마이페이지 경력 수정
	      @Override
	      @RequestMapping(value="/comp/careerre.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	      public ModelAndView mypageCareerre(HttpServletRequest request, HttpServletResponse response) throws Exception{
	           
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
	          
	          System.out.println("수정VO : " + companyVO);
	        
	          companyService.recareer(companyVO);
	          
	          System.out.println("수정VO 확인 : " + companyVO);
	         
	          mav.setViewName("redirect:/comp/recareer.do");
	         
	          return mav;
	         
	      }
	      
	      //마이페이지 비밀번호 변경
	      @Override
	      @RequestMapping(value="/comp/mypwreset.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	      public ModelAndView mypwreset(HttpServletRequest request, HttpServletResponse response) throws Exception {
	         
	        HttpSession session = request.getSession();
	        companyVO = (CompanyVO) session.getAttribute("company");
	        
	        ModelAndView mav = new ModelAndView();
	         
	         String my_pw = request.getParameter("my_pw");
	         String re_pw = request.getParameter("re_pw");
	         String rere_pw = request.getParameter("rere_pw");
	         
	         String my="0";
	         String re="0";
	         String rere="0";
	         
	         if(my_pw != null && re_pw != null && rere_pw != null) {
	         
	        my = Sha256.encrypt(my_pw);
	        re = Sha256.encrypt(re_pw);
	        rere = Sha256.encrypt(rere_pw);
	        
	        System.out.println(my);
	        System.out.println(re);
	        System.out.println(rere);
	         
	         }
	         
	        if(!my.equals(re) && re.equals(rere)) {
	           
	         companyVO.setComp_pw(rere);
	         companyService.pwreset(companyVO);
	         
	         System.out.println("성공 : "+rere);
	         
	         mav.addObject("result", "ok");
	         
	        }
	        
	         
	         return mav;
	      }

	
}