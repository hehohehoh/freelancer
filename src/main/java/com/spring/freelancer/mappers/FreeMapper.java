package com.spring.freelancer.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.spring.freelancer.free.FreeCareerVO;
import com.spring.freelancer.free.FreeVO;

@Mapper
public interface FreeMapper {
	
	List<FreeVO> selectAllFreelancersList() throws Exception;

	void insertFree(FreeVO freeVO) throws DataAccessException;
	
	int checkOverId(String free_id) throws DataAccessException;
	
	FreeVO loginById(FreeVO freeVO) throws DataAccessException;
	
	void updateFree(FreeVO freeVO) throws DataAccessException;

	void addCareer(FreeCareerVO careerVO) throws DataAccessException;
	
	/*
	 * MemberVO selectMemberById(String id) throws Exception; int
	 * insertMember(MemberVO memberVO)throws DataAccessException; int
	 * deleteMember(String id)throws DataAccessException; MemberVO
	 * loginById(MemberVO memberVO) throws DataAccessException ; List<FreeVO>
	 * selectAllFreeLancersList();
	 */

}
