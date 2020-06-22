package com.spring.freelancer.free;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface FreeService {

	public List<FreeVO> listFreelancers() throws Exception;

	int addFree(FreeVO free) throws DataAccessException;

}
