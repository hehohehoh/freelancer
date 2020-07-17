package com.spring.freelancer.board.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.freelancer.board.vo.BoardVO;

@Component("fileUtils")
public class FileUtils {				//파일이 저장될 폴더 경로(폴더가 없으면 생성하는 메소드 존재)
	private static final String filePath = "C:/MyJava/MyWebWorkspace01/freelancer/src/main/webapp/resources/boardFile/";

	public List<Map<String, Object>> parseInsertFileInfo(BoardVO boardVO, MultipartHttpServletRequest mpRequest)throws Exception{
		//MultipartFile 클래스와 MultipartHttpServletRequest로 File 업로드 구현
		
		/*
		 Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		 */
		
		//Iterator는 인터페이스로, hasNext, next, remove라는 메소드가 있다.
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;		//원본 파일 이름
		String originalFileExtension = null;	//확장자 명까지 포함한 원본 파일이름
		String storedFileName = null;		//저장된 파일 이름
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bno = boardVO.getBno();	//insert 시에 게시판 시퀀스로 증가된 bno를 가져와서 게시판 파일 테이블 bno에 반영
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();	
		}	//지정 경로에 폴더가 없으면 폴더 생성
		
		while(iterator.hasNext()) { //메소드는 읽어 올 요소가 남아있는지 확인하는 메소드이다. 있으면 true, 없으면 false를 반환한다.
			multipartFile = mpRequest.getFile(iterator.next());	//mpRequest : jsp에서의 요청 // multipartFile : request에서 받아온 파일에 접근하는 변수 
			if(multipartFile.isEmpty() == false) {	//multipartFile이 비어있지 않으면 = jsp에서 받은 파일이 있으면
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
												// substring : 문자열을 자르기 위해 사용, (".")이후
				storedFileName = getRandomString() + originalFileExtension;
				//저장될 파일이름 = 랜덤문자열 + 확장자 포함 원본파일이름
												
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);	//업로드 한 파일 데이터를 지정한 파일에 저장한다. 
				listMap = new HashMap<String, Object>();
				listMap.put("BNO", bno);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);		
			}			
		}
		return list;

	}
	public List<Map<String, Object>> parseUpdateFileInfo(BoardVO boardVO, String[] files,String[] fileNames, MultipartHttpServletRequest mpRequest)throws Exception{
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		int bno = boardVO.getBno();
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) { //multipartFile이 비어있지 않으면 if문을 탄다(새로운 첨부파일이 등록되었을때)
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				listMap = new HashMap<String, Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("BNO", bno);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		if(files != null&& fileNames != null) { //files와 fileNames가 null이 아니면 
			for(int i =0; i<fileNames.length; i++) {//삭제할 파일의 파일번호와 파일 이름을 받아옴
				listMap = new HashMap<String, Object>();
				listMap.put("IS_NEW", "N");
				listMap.put("FILE_NO", files[i]);
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
