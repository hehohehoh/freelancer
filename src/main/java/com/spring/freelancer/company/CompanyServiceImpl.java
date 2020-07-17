
package com.spring.freelancer.company;



import java.util.List;


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
	
	//기업 가입 정보 추가
	@Override
	public void addCompanyInfo(CompanyVO companyVO) throws Exception {
		compMapper.insertCompInfo(companyVO);
		
	}
	
	//기업 아이디 중복체크
	@Override
	public int compIdCheck(String comp_id) throws Exception {
		return compMapper.checkOverId(comp_id);
	}
	
	//기업 회원가입 승인할 리스트
	@Override
	public List<CompanyVO> listCompAppro() throws Exception {
		return compMapper.compApproList();
	}
	
	//기업 가입 승인
	@Override
	public void updateComp(String comp_id) throws Exception {
		compMapper.compAppro(comp_id);
	}
	
	//기업 로그인
	@Override
	public CompanyVO login(CompanyVO companyVO) throws Exception{    
		System.out.println("service: "+companyVO);
		return compMapper.loginById(companyVO);
	}
	
	@Override
	   public String findid(CompanyVO companyVO) throws Exception {
	      return compMapper.resultid(companyVO);
	   }
	   
	   @Override
	   public String findpw(CompanyVO companyVO) throws Exception {
	      return compMapper.resultpw(companyVO);
	   }
	   
	   @Override
	   public void pwreset(CompanyVO companyVO) throws Exception {
	      compMapper.pwreset(companyVO);
	   }
	   
	   
	   @Override
      public void mypage(CompanyVO companyVO) throws Exception {
        compMapper.mypageInfo(companyVO);
      }
      
      @Override
      public List<CompanyVO> career(CompanyVO companyVO) throws Exception{
         return compMapper.compCareer(companyVO);
      }
      
      @Override
      public void incareer(CompanyVO companyVO) throws Exception{
         compMapper.inCareer(companyVO);
      }
      
      @Override
      public void recareer(CompanyVO companyVO) throws Exception {
        compMapper.reCareer(companyVO);
      }
	   
	   

}
