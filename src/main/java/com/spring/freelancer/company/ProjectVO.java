package com.spring.freelancer.company;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("projectVO")
public class ProjectVO {
	private String comp_id;
	private int proj_num;
	private String proj_name;
	private String proj_work;
	private Date proj_startdate;
	private Date proj_finishdate;
}
