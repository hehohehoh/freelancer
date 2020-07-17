package com.spring.freelancer.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.freelancer.board.util.FileUtils;
import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.SearchCriteria;
import com.spring.freelancer.mappers.BoardMapper;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private  BoardMapper boardMapper;
	@Autowired
	BoardVO boardVO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	public List<BoardVO> notice()throws Exception{
		return boardMapper.notice();
				
	}
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception{
		return boardMapper.listPage(scri);
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return boardMapper.listCount(scri); 		
	}
	
	@Override
	public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		boardMapper.insert(boardVO);
		
		//게시글 작성시 동시에 게시판 파일 테이블에 파일을 업로드 하기위해 파일 업로드 메소드를 동시에 진행
		//게시글 인서트시 시퀀스로 생성된 bno를 받아와 파일 테이블의 bno에 저장
		List<Map<String, Object>> list =  fileUtils.parseInsertFileInfo(boardVO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			boardMapper.insertFile(list.get(i));
		}
	}
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception{
			boardMapper.boardHit(bno);
		return boardMapper.read(bno);
	}
	@Override
	public void update(BoardVO boardVO, 
			   String[] files,
			   String[] fileNames,
			   MultipartHttpServletRequest mpRequest) throws Exception {
		boardMapper.update(boardVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, fileNames, mpRequest);
		//업데이트할 값들을 list에 담는다.
		
		Map<String, Object> tempMap = null;
		int size = list.size();
		
		//fileUtils.parseUpdateFileInfo()의 결과의 size만큼 for문을 돌림
		for(int i=0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) { //IS_NEW 값이 Y면 업데이트, N이면 인서트 실행.
				boardMapper.insertFile(tempMap);		
			} else {
				boardMapper.updateFile(tempMap);
			} //
			
		}
	}
	@Override
	public void delete(int bno) throws Exception {
		boardMapper.delete(bno);
		
	}
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return boardMapper.selectFileList(bno);
	}
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return boardMapper.selectFileInfo(map);
	}

	
	/*
	 * @Override public List<BoardVO> notice(SearchCriteria scri) throws Exception {
	 * return boardMapper.notice(scri); }
	 */
	

	

}
