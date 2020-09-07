package com.spring.freelancer.company;

import java.sql.Date;


import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("careerVO")
public class CareerVO {
	private String comp_id;
	private int comp_cnum;
	private String comp_pname;
	private String comp_pwork;
	private Date comp_startdate;
	private Date comp_finishdate;
}
