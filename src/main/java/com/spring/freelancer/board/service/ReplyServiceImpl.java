package com.spring.freelancer.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.freelancer.board.vo.ReplyVO;
import com.spring.freelancer.mappers.ReplyMapper;

@Service("replyService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private  ReplyMapper replyMapper;
	@Autowired
	ReplyVO replyVO;

	//AJAX처리
	@Override
	public List<ReplyVO> replyRead(int bno) throws Exception {
		return replyMapper.replyRead(bno);
	}
	@Override
	public int replyInsert(ReplyVO vo) throws Exception {
		return replyMapper.insertReply(vo);
	}
	@Override
	public int replyUpdate(ReplyVO vo)throws Exception{
		return replyMapper.replyUpdate(vo);
	}
	@Override
	public int replyDelete(int rno)throws Exception{
		return replyMapper.replyDelete(rno);
		
	}
}
