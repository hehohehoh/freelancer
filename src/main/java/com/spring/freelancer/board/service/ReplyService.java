package com.spring.freelancer.board.service;

import java.util.List;

import com.spring.freelancer.board.vo.ReplyVO;

public interface ReplyService {
	
	//AJAX 처리
	public List<ReplyVO> replyRead(int bno) throws Exception;
	int replyInsert(ReplyVO vo) throws Exception;
	int replyUpdate(ReplyVO vo) throws Exception;
	int replyDelete(int rno) throws Exception;
}
