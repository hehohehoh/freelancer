package com.spring.freelancer.free;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface FreeService {

	public List<FreeVO> listFreelancers() throws Exception;

	public void addFree(FreeVO free) throws DataAccessException;
	
	public int freeIdCheck(String free_id) throws Exception;
	
	public FreeVO loginById(FreeVO freeVO) throws Exception;
	
	public void updateFree(FreeVO freeVO) throws Exception;

	public void addCareer(FreeCareerVO careerVO) throws Exception;
}
