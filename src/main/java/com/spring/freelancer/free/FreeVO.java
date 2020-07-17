package com.spring.freelancer.free;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component("freeVO")
public class FreeVO {

	private String free_id;
	private String free_pw;
	private String free_firstName;
	private String free_lastName;
	private String free_hp;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date free_bir;
	private int free_gender;
	private String free_email;
	private Timestamp free_joinDate;
	private String free_picture;
	private int free_career;
	private int free_state;
	private int free_stop;
	private String free_pay;
	private String free_level;
	private String free_intro;
	private String free_file;
	private String free_addr;
	

	
}
