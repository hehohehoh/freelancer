package com.spring.freelancer.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.freelancer.company.CompanyVO;

@Mapper()
public interface CompMapper {
	
	void insertCompInfo(CompanyVO companyVO) throws Exception;
	
	int checkOverId(String comp_id) throws Exception;
	
	List<CompanyVO> compApproList() throws Exception;
	
	void compAppro(String comp_id) throws Exception;
	
	String resultid(CompanyVO companyVO) throws Exception;
}
