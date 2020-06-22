package com.spring.freelancer.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.spring.freelancer.free.FreeVO;

@Mapper
public interface FreeMapper {
	
	List<FreeVO> selectAllFreelancersList() throws Exception;

	int insertFree(FreeVO freeVO) throws DataAccessException;
	
	

	
	/*
	 * MemberVO selectMemberById(String id) throws Exception; int
	 * insertMember(MemberVO memberVO)throws DataAccessException; int
	 * deleteMember(String id)throws DataAccessException; MemberVO
	 * loginById(MemberVO memberVO) throws DataAccessException ; List<FreeVO>
	 * selectAllFreeLancersList();
	 */

}
