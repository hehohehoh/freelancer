package com.spring.freelancer.company;

import java.util.List;

public interface CompanyService {
	//기업 가입 정보 추가
	public void addCompanyInfo(CompanyVO companyVO) throws Exception;
	
	//아이디 중복체크
	public int compIdCheck(String comp_id) throws Exception;
	
	//기업 승인할 리스트
	public List<CompanyVO> listCompAppro() throws Exception;
	
	//가입 승인
	public void updateComp(String comp_id) throws Exception;
	
	//기업 로그인
	public CompanyVO login(CompanyVO companyVO) throws Exception;
	
	public String findid(CompanyVO companyVO) throws Exception;
	   
	String findpw(CompanyVO companyVO) throws Exception;
	   
	void pwreset(CompanyVO companyVO) throws Exception;
}
