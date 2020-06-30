package com.spring.freelancer.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.freelancer.board.vo.ReplyVO;

@Mapper
public interface ReplyMapper {
	
	public List<ReplyVO> readReply(int bno) throws Exception;
	public void writeReply(ReplyVO vo) throws Exception;
	public void updateReply(ReplyVO vo) throws Exception;
	public void deleteReply(ReplyVO vo) throws Exception;
	public ReplyVO selectReply(int rno) throws Exception;
}
