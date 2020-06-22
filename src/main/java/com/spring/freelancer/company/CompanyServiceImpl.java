
package com.spring.freelancer.company;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.freelancer.mappers.CompMapper;

@Service("companyService")
@Transactional(propagation = Propagation.REQUIRED)
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompMapper compMapper;

	@Override
	public void addCompanyInfo(CompanyVO companyVO) throws Exception {
		compMapper.insertCompInfo(companyVO);
		
	}

	@Override
	public int compIdCheck(String comp_id) throws Exception {
		return compMapper.checkOverId(comp_id);
	}

}
