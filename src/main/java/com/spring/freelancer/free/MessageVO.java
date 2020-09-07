package com.spring.freelancer.free;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("messageVO")
public class MessageVO {
	private int msg_num;
	private String comp_id;
	private String free_id;
	private Timestamp msg_time;
	private String msg_content;
	private String comp_name;
	private String msg_title;
}
