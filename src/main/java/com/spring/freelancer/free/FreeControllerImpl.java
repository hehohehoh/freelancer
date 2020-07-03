package com.spring.freelancer.free;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.freelancer.common.file.Upload;



@Controller("freeController")
public class FreeControllerImpl implements FreeController {

	@Autowired
	private FreeService freeService;
	@Autowired
	FreeVO freeVO;
	
	@Override
	@RequestMapping(value = "/free/listFreelancers.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listFreelancers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<FreeVO> freelancersList = freeService.listFreelancers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("freelancersList", freelancersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/free/loginForm.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String loginForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String goPage = (String)request.getAttribute("viewName");
		return goPage;
	}
	
	@Override
	@RequestMapping(value = "/free/form.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String freeForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {	
		String goPage = (String)request.getAttribute("viewName");
		return goPage;
	}
	
	@Override
	@RequestMapping(value = "/free/addFree.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addFree(@ModelAttribute("free") FreeVO freeVO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {	

		String free_email = request.getParameter("free_email1") + "@" + request.getParameter("free_email2");
		freeVO.setFree_email(free_email);
		freeService.addFree(freeVO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("free_id", freeVO.getFree_id());
		mav.addObject("career_cnt", freeVO.getFree_career());
		mav.addObject("status", "first");
		mav.setViewName("free/detailForm");
		
		return mav;
	}
	
	@RequestMapping(value = "/free/detailForm.do")
	public String gogo() {
		
		return "free/detailForm";
	}
	
	
	@Override
	@RequestMapping(value="/free/overlap.do", method= { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") FreeVO freeVO , Model model) throws Exception{
		int result = freeService.freeIdCheck(freeVO.getFree_id());
		return String.valueOf(result);
	}
	
	
	
	@Override
	@RequestMapping(value="/free/login.do", method= { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(@ModelAttribute("free") FreeVO free, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		freeVO = freeService.loginById(free);
		if(freeVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("free", freeVO);
			mav.setViewName("free/login");
			
		}else {
			
			mav.addObject("result", "fail");
			mav.setViewName("free/loginForm");
		}
		return mav;
	}
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Override
	@RequestMapping(value = "/free/updateInfo.do",  method= { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateDetailInfo(@ModelAttribute("free") FreeVO free,
			@RequestParam(value = "free_pic", required = false) MultipartFile file,
			@RequestParam(value = "career_cnt") int career_cnt ) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		String id = free.getFree_id();
		System.out.println(id);
		String namePath = File.separator + id;
		System.out.println(namePath);
		
		System.out.println(file);
		System.out.println(file.isEmpty());
		System.out.println(file.getOriginalFilename());
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			String fileName = file.getOriginalFilename();
			Upload.imageUpload(uploadPath, fileName, file.getBytes(), namePath);
			free.setFree_picture(uploadPath + namePath + fileName );
			free.setFree_picture_thumb(uploadPath + namePath + File.separator + "s" + fileName);
			
		}else {
			String fileName = uploadPath + File.separator + "profileImage" + File.separator + "none.png";
			free.setFree_picture(fileName);
			free.setFree_picture_thumb(fileName);
		}
		
		freeService.updateFree(free);
		
		mav.addObject("free_id", free.getFree_id());
		mav.addObject("career_cnt", career_cnt);
		mav.addObject("status", "second");
		
		mav.setViewName("free/detailForm");
		return mav;
	}
	
	
	@RequestMapping(value = "/free/addCareer.do",  method= { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addCareer(@ModelAttribute(value="carList") CareerList carList ) throws Exception{
		
		System.out.println(carList.getCarList());
		
		for(int i=0; i<carList.getCarList().size(); i++) {
			FreeCareerVO cvo = carList.getCarList().get(i);
			freeService.addCareer(cvo);
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("free_id", carList.getCarList().get(0).getFree_id());
		mav.addObject("career_cnt", carList.getCarList().size());
		mav.addObject("status", "third");
		
		mav.setViewName("free/detailForm");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/free/findid.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView findid(HttpServletRequest request,
	                           HttpServletResponse response) throws Exception {
	   String viewName = (String) request.getAttribute("viewName");
	   ModelAndView mav = new ModelAndView(viewName);
	   return mav;
	}
	
	@Override
	@RequestMapping(value = "/free/findiddo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView findiddo(@ModelAttribute("info") FreeVO freeVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
			String free_email = request.getParameter("free_email1") + "@" + request.getParameter("free_email2");
			freeVO.setFree_email(free_email);
			System.out.println(freeVO);
			String id = freeService.findid(freeVO);
			ModelAndView mav = new ModelAndView();
			if(id==""||id==null) {
				mav.setViewName("/free/findid");
				mav.addObject("result", "findidFailed");
			}else{
				mav.setViewName("/free/findidresult");
				mav.addObject("id",id);
			}
			return mav;
	}
	
	@Override
	@RequestMapping(value = "/free/findpw.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView findpw(HttpServletRequest request,
	                           HttpServletResponse response) throws Exception {
	   String viewName = (String) request.getAttribute("viewName");
	   ModelAndView mav = new ModelAndView(viewName);
	   return mav;
	}
	
	@Override
	@RequestMapping(value = "/free/findpwdo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView findpwdo(@ModelAttribute("info") FreeVO freeVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
					
			String comp_memail = request.getParameter("free_email1") + "@" + request.getParameter("free_email2");
			freeVO.setFree_email(comp_memail);
			System.out.println(freeVO);
		    String id = freeService.findpw(freeVO);
		    
		    ModelAndView mav = new ModelAndView();
		    if(id==""||id==null) {
			      mav.setViewName("/free/findpw");
			      mav.addObject("result", "findpwFailed");
		    }else{
		         mav.setViewName("/free/findpwresult");
		         mav.addObject("id",id);
		    }
		      return mav;
	}
	
	   @Override
	   @RequestMapping(value="/free/pwreset.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	   public ModelAndView pwreset(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      String free_id = request.getParameter("free_id");
	      String free_pw = request.getParameter("free_pw");
	      
	      
	      freeVO.setFree_id(free_id);
	      freeVO.setFree_pw(free_pw);
	      System.out.println(freeVO);
	      freeService.pwreset(freeVO);
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("/free/pwreset");
	      mav.addObject("id",freeVO.getFree_id());
	      return mav;
	   }
	
}
