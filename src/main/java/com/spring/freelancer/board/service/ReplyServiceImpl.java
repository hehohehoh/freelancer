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
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return replyMapper.readReply(bno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		replyMapper.writeReply(vo);
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		replyMapper.updateReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		replyMapper.deleteReply(vo);
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		return replyMapper.selectReply(rno);
	}
}
