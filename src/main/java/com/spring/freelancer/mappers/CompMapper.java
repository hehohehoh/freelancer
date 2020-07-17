package com.spring.freelancer.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.freelancer.company.CompanyVO;

@Mapper()
public interface CompMapper {
	
	//기업 가입
	void insertCompInfo(CompanyVO companyVO) throws Exception;
	
	//기업 아이디 중복체크
	int checkOverId(String comp_id) throws Exception;
	
	//기업 승인할 리스트
	List<CompanyVO> compApproList() throws Exception;
	
	//기업 승인
	void compAppro(String comp_id) throws Exception;
	
	//기업 로그인
	CompanyVO loginById(CompanyVO companyVO) throws Exception;
	
	String resultid(CompanyVO companyVO) throws Exception;
	   
	String resultpw(CompanyVO companyVO) throws Exception;
	   
	void pwreset(CompanyVO companyVO) throws Exception;
	
	
	void mypageInfo(CompanyVO companyVO) throws Exception;
	   
	List<CompanyVO> compCareer(CompanyVO companyVO) throws Exception;
	   
	void inCareer(CompanyVO companyVO) throws Exception;
	   
	void reCareer(CompanyVO companyVO) throws Exception;	
	
}
