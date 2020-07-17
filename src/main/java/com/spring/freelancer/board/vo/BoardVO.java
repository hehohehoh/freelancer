package com.spring.freelancer.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("boardVO")
public class BoardVO {
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int hit;
}
