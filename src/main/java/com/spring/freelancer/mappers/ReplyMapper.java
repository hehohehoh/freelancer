package com.spring.freelancer.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.freelancer.board.vo.ReplyVO;

@Mapper
public interface ReplyMapper {
	
	//AJAX처리.
	public List<ReplyVO> replyRead(int bno) throws Exception; 	// 댓글 목록
	public int insertReply(ReplyVO vo)throws Exception;			// 댓글 입력
	public int replyUpdate(ReplyVO vo)throws Exception;			// 댓글 수정
	public int replyDelete(int rno)throws Exception;
	
}
