package com.spring.freelancer.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component("replyVO")
public class ReplyVO {
	
	private int bno;
	private int rno;
	private String content;
	private String writer;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date regdate;
	
	
	
	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" +rno + ", content=" 
	+ content + ", writer=" + writer + ", regdate=" + regdate + "]";
		
	}
	
}
