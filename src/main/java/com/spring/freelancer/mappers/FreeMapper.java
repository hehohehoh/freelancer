package com.spring.freelancer.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.spring.freelancer.free.FreeCareerVO;
import com.spring.freelancer.free.FreeVO;

@Mapper
public interface FreeMapper {
	
	List<FreeVO> selectAllFreelancersList() throws Exception;
	
	//프리 정지
	void stopFree(String free_id) throws DataAccessException;
	
	void releaseFree(String free_id) throws DataAccessException;

	void insertFree(FreeVO freeVO) throws DataAccessException;
	
	int checkOverId(String free_id) throws DataAccessException;
	
	FreeVO loginById(FreeVO freeVO) throws DataAccessException;
	
	void addFreePic(@Param("free_picture") String free_picture, @Param("free_id") String free_id) throws DataAccessException;

	void addCareer(FreeCareerVO careerVO) throws DataAccessException;
	
	void addFreeFile(@Param("free_file") String free_file, @Param("free_id") String free_id) throws DataAccessException;
	/*
	 * MemberVO selectMemberById(String id) throws Exception; int
	 * insertMember(MemberVO memberVO)throws DataAccessException; int
	 * deleteMember(String id)throws DataAccessException; MemberVO
	 * loginById(MemberVO memberVO) throws DataAccessException ; List<FreeVO>
	 * selectAllFreeLancersList();
	 */

	void addFreeSkill(@Param("free_id") String free_id, @Param("free_skill") String free_skill) throws DataAccessException;

	String findid(FreeVO freeVO) throws DataAccessException;
	
	String findpw(FreeVO freeVO) throws DataAccessException;
	
	void pwreset(FreeVO freeVO) throws DataAccessException;
	
	//프리 검색 리스트
	List<FreeVO> SearchFree(Map<String, Object> lanMap) throws Exception;
	      
	//사용언어 리스트
	List<FreeVO> freeSkill() throws Exception;
	
	int numOfCareer(String free_id) throws DataAccessException;
	
	int numOfSkill(String free_id) throws DataAccessException;
	
	List<FreeCareerVO> selectCarList(String free_id) throws DataAccessException;
	
	String[] selectSkill(String free_id) throws DataAccessException;
	
	//전체 항 갯수
    int freeCount(Map<String, Object> lanMap);
   
    FreeVO freeInfo(String free_id) throws Exception;
   
    List<FreeCareerVO> freeCareerList(String free_id) throws Exception;
   
    void modFree(FreeVO freeVO) throws DataAccessException;
    
    int stopFreeSelf(String free_id) throws DataAccessException;
    
    int startFreeSelf(String free_id) throws DataAccessException;
    
    void dropFree(String free_id) throws DataAccessException;
}
