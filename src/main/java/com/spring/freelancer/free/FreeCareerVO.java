package com.spring.freelancer.free;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("freeCareerVO")
public class FreeCareerVO {

	private String free_id;
	private int free_cnum;
	private Date free_startdate;
	private Date free_finishdate;
	private String free_pname;
	private String free_pwork;
	private String free_company;
	
}
