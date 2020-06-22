package com.spring.freelancer.company;

public interface CompanyService {
	public void addCompanyInfo(CompanyVO companyVO) throws Exception;
	
	public int compIdCheck(String comp_id) throws Exception;
}
