package com.spring.freelancer.company;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;



@Data
@Component("companyVO")
public class CompanyVO {
	private String comp_id;
	private String comp_pw;
	private String comp_mname;
	private String comp_mhp;
	private String comp_memail;
	private String comp_bnum;
	private int comp_career;
	private String comp_name;
	private int comp_stop;
	private Timestamp comp_joindate;
	

	private int comp_cnum;
	private String comp_pname;
	private String comp_pwork;
	private Date comp_startdate;
	private Date comp_finishdate;
	
	
}
