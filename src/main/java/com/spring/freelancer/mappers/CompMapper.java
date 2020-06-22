package com.spring.freelancer.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.spring.freelancer.company.CompanyVO;

@Mapper()
public interface CompMapper {
	
	void insertCompInfo(CompanyVO companyVO) throws Exception;
	
	int checkOverId(String comp_id) throws Exception;
}
