package com.spring.freelancer.company;

import java.util.List;

public interface CompanyService {
	public void addCompanyInfo(CompanyVO companyVO) throws Exception;
	
	public int compIdCheck(String comp_id) throws Exception;
	
	public List<CompanyVO> listCompAppro() throws Exception;
	
	public void updateComp(String comp_id) throws Exception;
}
