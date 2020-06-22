package com.spring.freelancer.free;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.freelancer.mappers.FreeMapper;

@Service("freeService")
@Transactional(propagation = Propagation.REQUIRED)
public class FreeServiceImpl implements FreeService {
	
	@Autowired 
	private FreeMapper freeMapper;
	@Autowired
	FreeVO freeVO;
	
	@Override
	public List<FreeVO> listFreelancers() throws Exception {
		return freeMapper.selectAllFreelancersList();
		
	}

	@Override
	public int addFree(FreeVO free) throws DataAccessException {
		
		return freeMapper.insertFree(free);
	}
	
	

}