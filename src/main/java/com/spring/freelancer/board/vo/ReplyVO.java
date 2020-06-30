package com.spring.freelancer.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("replyVO")
public class ReplyVO {
	
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	
	

	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" +rno + ", content=" 
	+ content + ", writer=" + writer + ", regdate=" + regdate + "]";
		
	}
	
}
