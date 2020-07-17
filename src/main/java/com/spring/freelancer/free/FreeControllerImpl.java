package com.spring.freelancer.free;

import java.io.File;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework
.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.freelancer.common.file.Upload;
import com.spring.freelancer.common.sha256.Sha256;

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
	@RequestMapping(value = "/admin/listFreelancers.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listFreelancers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<FreeVO> freelancersList = freeService.listFreelancers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("freelancersList", freelancersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/admin/freeStop.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView freeStop(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		int free_stop = Integer.parseInt(request.getParameter("free_stop"));
		
		if(free_stop == 0)
			freeService.freelancerStop(free_id);
		else if(free_stop == 1)
			freeService.freelancerRelease(free_id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin/listFreelancers.do");
		mav.addObject("free_id", free_id);
		mav.addObject("free_stop", free_stop);
		return mav;
		
	}

	@Override
	@RequestMapping(value = "/free/loginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
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

	/*
	 * // File이름 return = uploadPath + namePath(사용자ID) + file이름 public String
	 * getFileName(MultipartHttpServletRequest req, String id) throws IOException,
	 * Exception {
	 * 
	 * String namePath = File.separator + id + File.separator;
	 * System.out.println(namePath);
	 * 
	 * MultipartFile file = req.getFile("free_file");
	 * 
	 * String fileName = file.getOriginalFilename();
	 * 
	 * System.out.println(file); System.out.println(file.isEmpty());
	 * System.out.println(fileName);
	 * 
	 * if (fileName != null && fileName != "") { Upload.fileUpload(uploadPath,
	 * fileName, file.getBytes(), namePath); }
	 * 
	 * return uploadPath + namePath + fileName; }
	 */

	@Override
	@RequestMapping(value = "/free/addFree.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addFree(@ModelAttribute("free") FreeVO free, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String free_email = request.getParameter("free_email1") + "@" + request.getParameter("free_email2");
		free.setFree_email(free_email);

		System.out.println("첫번째:" + free.getFree_pw());

		String encryPW = Sha256.encrypt(free.getFree_pw());
		free.setFree_pw(encryPW);
		System.out.println("암호화 후: " + encryPW);

		freeService.addFree(free);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("free_id", free.getFree_id());
		mav.addObject("career_cnt", free.getFree_career());
		mav.addObject("status", "finish");
		mav.setViewName("free/loginForm");

		return mav;
	}

	@Override
	@RequestMapping(value = "/free/overlap.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") FreeVO freeVO, Model model) throws Exception {
		int result = freeService.freeIdCheck(freeVO.getFree_id());
		return String.valueOf(result);
	}

	@Override
	@RequestMapping(value = "/free/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(@ModelAttribute("free") FreeVO free, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		System.out.println("before Encryption: " + free.getFree_pw());
		String encryPW = Sha256.encrypt(free.getFree_pw());
		System.out.println("After Encryption: " + encryPW);

		free.setFree_pw(encryPW);

		freeVO = freeService.loginById(free);

		
		if (freeVO != null) {

			String freeID = freeVO.getFree_id();
			int free_stop = freeVO.getFree_stop();
			
			if (freeID.equals("admin")) {
				mav.setViewName("admin/adminForm");
			}else if(free_stop == 1 || free_stop==2) {
				mav.addObject("freeID", freeID);
				mav.setViewName("free/loginForm");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("free", freeVO);
				mav.setViewName("free/login");
			}
		} else {

			mav.addObject("result", "fail");
			mav.setViewName("free/loginForm");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/free/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "free/loginForm";
	}

	@Override
	@RequestMapping(value = "/free/findid.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/free/findiddo.do", method = { RequestMethod.GET, RequestMethod.POST })
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
	@RequestMapping(value = "/free/findpw.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findpw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/free/findpwdo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findpwdo(@ModelAttribute("info") FreeVO freeVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String comp_memail = request.getParameter("free_email1") + "@" + request.getParameter("free_email2");
		freeVO.setFree_email(comp_memail);
		System.out.println(freeVO);
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
	@RequestMapping(value = "/free/pwreset.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView pwreset(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String free_id = request.getParameter("free_id");
		String free_pw = request.getParameter("free_pw");

		String encryPW = Sha256.encrypt(free_pw);

		freeVO.setFree_id(free_id);
		freeVO.setFree_pw(encryPW);
		System.out.println(freeVO);
		freeService.pwreset(freeVO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("free/pwreset");
		mav.addObject("id", freeVO.getFree_id());
		return mav;
	}

	
	@RequestMapping(value = "/free/goMypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView goMypage(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		freeVO = (FreeVO) session.getAttribute("free");
		
		String free_id = freeVO.getFree_id();

		String filePath = "";
		String imagePath = "";
		
		String str = freeVO.getFree_file();
		
		System.out.println(str);
		  
		if(str != null && str != "") { 
			int i1 = str.lastIndexOf("/"); 
			filePath = str.substring(i1+1, str.length());
		}
		
		String str2 = freeVO.getFree_picture();
		
		if(str2 != null && str2 != "") { 
			int i2 = str2.lastIndexOf("\\");
			imagePath = str2.substring(i2+1, str2.length());
		}
		
		
		System.out.println(filePath);
		System.out.println(imagePath);
		
		if(filePath == null || filePath == "") {
			session.setAttribute("filePath", null);
		}else {
			session.setAttribute("filePath", filePath);
		}
		
		if(imagePath == null || imagePath == "") {
			session.setAttribute("imagePath", null); 
		}else {
			session.setAttribute("imagePath", imagePath);
		}
		
		int career_cnt = freeService.numOfCareer(free_id);
		System.out.println("career_cnt  " + career_cnt);
		
		int skill_cnt = freeService.numOfSkill(free_id);
		System.out.println("skill_cnt  " + skill_cnt);
		
		if(career_cnt == 0) {
			session.setAttribute("career_cnt", 0);
			session.setAttribute("career_num", freeVO.getFree_career());
		}else {
			session.setAttribute("career_cnt", career_cnt);
			List<FreeCareerVO> carList = freeService.selectCarList(free_id);
			session.setAttribute("carList", carList);
		}
		
		if(skill_cnt == 0) {
			session.setAttribute("skill_cnt", 0);
		}else {
			session.setAttribute("skill_cnt", skill_cnt);
			String[] skill = freeService.selectSkill(free_id);
			
			session.setAttribute("skill", skill);
		}
		
		
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/free/updateInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateDetailInfo(HttpSession session,
			@RequestParam(value = "free_pic", required = false) MultipartFile file) throws Exception {

		ModelAndView mav = new ModelAndView();

		freeVO = (FreeVO) session.getAttribute("free");
		
		String id = freeVO.getFree_id();
		System.out.println(id);
		String namePath = File.separator + id + File.separator;
		System.out.println(namePath);

		System.out.println(file);
		System.out.println(file.isEmpty());
		System.out.println(file.getOriginalFilename());

		String str = "";
		
		if(freeVO.getFree_picture() == null || freeVO.getFree_picture() == "") {
		
			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				String imageName = file.getOriginalFilename();
				str = Upload.imageUpload(uploadPath, imageName, file.getBytes(), namePath);
				System.out.println(str);
				System.out.println(imageName);
				
				freeVO.setFree_picture(str);
	
			} 
	
			freeService.addFreePic(str, id);

		}else {
			
			String filePath = uploadPath + namePath + freeVO.getFree_picture();
			System.out.println(filePath);
			File prev = new File(filePath);
			if(prev.exists())
				prev.delete();
			
			
			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				String imageName = file.getOriginalFilename();
				str = Upload.imageUpload(uploadPath, imageName, file.getBytes(), namePath);
				System.out.println(str);
				System.out.println(imageName);
				
				freeVO.setFree_picture(str);
			}
			
			freeService.addFreePic(str, id);
		}
		
		mav.addObject("status", "freeInfoFin");

		mav.setViewName("free/goMypage");
		return mav;
	}

	@RequestMapping(value = "/free/addCareer.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addCareer(CareerList carList, HttpServletRequest request ) throws Exception {

		System.out.println(carList.getCarList());

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

	@RequestMapping(value = "/free/addFreeFile.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fileUp(HttpSession session, @RequestParam(value = "free_file", required = false) MultipartFile free_file)
			throws Exception {
		
		freeVO = (FreeVO) session.getAttribute("free");

		String fileName = free_file.getOriginalFilename();
		String namePath = File.separator + freeVO.getFree_id() + File.separator;

		System.out.println(free_file);
		System.out.println(free_file.isEmpty());
		System.out.println(fileName);

		if(freeVO.getFree_file() == null || freeVO.getFree_file() == "") {
		
			if (fileName != null && fileName != "") {
				Upload.fileUpload(uploadPath, fileName, free_file.getBytes(), namePath);
				freeService.addFreeFile(fileName, freeVO.getFree_id());
				freeVO.setFree_file(fileName);
			}

		}else {
			
			String filePath = uploadPath + namePath + freeVO.getFree_file();
			File prev = new File(filePath);
			if(prev.exists())
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
	
	@RequestMapping(value="/free/fileDown.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void fileDown(HttpSession session, HttpServletResponse response) throws Exception{
		
		
		freeVO = (FreeVO) session.getAttribute("free");
		
		String path = uploadPath + File.separator + freeVO.getFree_id() + File.separator + freeVO.getFree_file();
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(path));
		//org.apache.commons.io.FileUtils 클래스의 메소드 readFileToByteArray를 사용하여
		//저장된 경로에서 #{bno} 값으로   첨부파일을 읽어 Byte[]형식으로 변환.
		System.out.println(fileByte);
		
		//MIME:  Multipurpose Internet Mail Extensions의 약자로 파일 변환을 의미.
		//response로 파일정보들을 담아 JSP화면으로 응답
		response.setContentType("application/octet-stream");//application/octet-stream :MIME 타입을 8비트 바이너리 배열로 지정(디코딩)
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(freeVO.getFree_file(), "UTF-8")+"\";");
		//setHeader : ("Content-Disposition","attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+")
		//괄호 안의 헤더가 이미 존재 한다면 그것 대신 "\";" 으로 대체
					
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();		
	}

	@RequestMapping(value = "/free/addSkill.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addSkill(@RequestParam(value = "lan", required = false) List<String> lan,
			@RequestParam(value = "free_id") String free_id, HttpServletRequest request) 
			throws Exception {

		System.out.println(free_id);
		System.out.println(lan);
		int skill_cnt = lan.size(); 
		System.out.println(lan.size());

		for (int i = 0; i < lan.size(); i++) {
			String skill = lan.get(i);
			freeService.addFreeSkill(free_id, skill);
		}

		ModelAndView mav = new ModelAndView();

		mav.addObject("status", "freeSkillFin");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("skill_cnt", skill_cnt);
		session.setAttribute("skill", lan);
		
		mav.setViewName("free/goMypage");

		return mav;

	}
	
	@PostMapping(value="/free/modFreeInfo.do")
	public String modFree(FreeVO freeVO ) throws Exception{
		
		freeService.modFree(freeVO);
		
		return "free/goMypage";
	}
	
	@PostMapping(value="/free/stopFree.do")
	public @ResponseBody String stopFreeBySelf(String free_id, HttpSession session) throws Exception{
		
		System.out.println(free_id);
		
		int res = freeService.stopFreeSelf(free_id);
		
		freeVO = (FreeVO) session.getAttribute("free");
		freeVO.setFree_state(1);
		session.setAttribute("free", freeVO);
		System.out.println(res);
		return String.valueOf(res);
				
	}
	
	@PostMapping(value="/free/startFree.do")
	public @ResponseBody String startFreeBySelf(String free_id, HttpSession session) throws Exception{
		
		System.out.println(free_id);
		
		int res = freeService.startFreeSelf(free_id);
		
		freeVO = (FreeVO) session.getAttribute("free");
		freeVO.setFree_state(0);
		session.setAttribute("free", freeVO);
		System.out.println(res);
		return String.valueOf(res);
				
	}
	
	@PostMapping(value = "/free/drop.do")
	public String dropFree(String free_id, HttpSession session) throws Exception{
		
		freeService.dropFree(free_id);
		session.invalidate();
		return "main";
	}
	
	
	
	//프리랜서 검색
   @Override
   @RequestMapping(value = "/free/freeSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView freeSearchList(@RequestParam(value = "lan") List<String> lanList,
         @RequestParam(value = "free_level") String free_level, @RequestParam(value = "free_addr") String free_addr,
         HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      int startCount = Integer.parseInt(request.getParameter("startCount"));
      if(!(free_addr.equals("무관"))) {
    	  free_addr = free_addr +"%";
      }
    		 
      List<FreeVO> freeList = freeService.listFreeSearch(lanList, free_level, free_addr, startCount);
      System.out.println("freeList: " + freeList);

      List<FreeVO> freeLanList = freeService.listFreeSkill();
      System.out.println("freeLanList: " + freeLanList);
      
      Calendar cal = Calendar.getInstance();
      
      int year = cal.get(Calendar.YEAR);
      System.out.println("year: " + year);
      ModelAndView mav = new ModelAndView("free/freeSearchForm");
      mav.addObject("freeList", freeList);
      mav.addObject("freeLanList", freeLanList);
      mav.addObject("year", year);
      mav.addObject("free_level", free_level);
      mav.addObject("free_addr", free_addr);
      mav.addObject("lanList", lanList);
      return mav;
   }
   
   //더 보기
   @Override
   @RequestMapping(value = "/free/more.do", method = { RequestMethod.GET, RequestMethod.POST })
   public @ResponseBody Map<String, Object> More(@RequestParam(value = "lan") List<String> lanList,
         @RequestParam(value = "free_level") String free_level, @RequestParam(value = "free_addr") String free_addr,
         HttpServletRequest request, HttpServletResponse response) throws Exception {
      int startCnt = Integer.parseInt(request.getParameter("startCount")) + 1;
      
      if(!(free_addr.equals("무관"))) {
    	  free_addr = free_addr +"%";
      }
      
      List<FreeVO> freeList = freeService.listFreeSearch(lanList, free_level, free_addr, startCnt);
      System.out.println("freeList: " + freeList);

      List<FreeVO> freeLanList = freeService.listFreeSkill();
      System.out.println("freeLanList: " + freeLanList);
      
      Calendar cal = Calendar.getInstance();
      int year = cal.get(Calendar.YEAR);
      
      int freeCnt = freeService.freeCnt(lanList, free_level, free_addr, startCnt);
      System.out.println("freeCnt: "+freeCnt);
      int fCnt = freeCnt - startCnt;
      
      HashMap<String, Object> freeMap = new HashMap<String, Object>();
      freeMap.put("freeList",freeList);
      freeMap.put("freeLanList",freeLanList);
      freeMap.put("year",year);
      freeMap.put("fCnt",fCnt);
      
      System.out.println(freeMap);
      return freeMap;
   }
   
   @Override
   @RequestMapping(value = "/free/freeDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String freeDetail(@RequestParam(value = "free_id") String free_id,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
      
	  freeVO = freeService.freeInfo(free_id);
      List<FreeCareerVO> careerList = freeService.listFreeCareer(free_id);
      String[] skillList = freeService.selectSkill(free_id);
      
      System.out.println("free" + freeVO);
      System.out.println("careerList" + careerList);
      System.out.println("skillList" + skillList);

      Calendar cal = Calendar.getInstance();
      int year = cal.get(Calendar.YEAR);
      
      request.setAttribute("free", freeVO);
      request.setAttribute("careerList", careerList);
      request.setAttribute("skillList", skillList);
      request.setAttribute("year", year);
      
      return "free/freeDetail";
   }

	

}
