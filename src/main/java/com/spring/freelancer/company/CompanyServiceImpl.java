
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

	// 기업 가입 정보 추가
	@Override
	public void addCompanyInfo(CompanyVO companyVO) throws Exception {
		compMapper.insertCompInfo(companyVO);

	}

	// 기업 아이디 중복체크
	@Override
	public int compIdCheck(String comp_id) throws Exception {
		return compMapper.checkOverId(comp_id);
	}

	// 기업 회원가입 승인할 리스트
	@Override
	public List<CompanyVO> listCompAppro() throws Exception {
		return compMapper.compApproList();
	}

	// 기업 가입 승인
	@Override
	public void updateComp(String comp_id) throws Exception {
		compMapper.compAppro(comp_id);
	}

	// 기업 로그인
	@Override
	public CompanyVO login(CompanyVO companyVO) throws Exception {
		System.out.println("service: " + companyVO);
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
	public List<CompanyVO> career(CompanyVO companyVO) throws Exception {
		return compMapper.compCareer(companyVO);
	}

	@Override
	public List<ProjectVO> project(CompanyVO companyVO) throws Exception {
		return compMapper.compProject(companyVO);
	}

	@Override
	public void incareer(CompanyVO companyVO) throws Exception {
		compMapper.inCareer(companyVO);
	}

	@Override
	public void inproject(ProjectVO projectVO) throws Exception {
		compMapper.inProject(projectVO);
	}

	@Override
	public void recareer(CompanyVO companyVO) throws Exception {
		compMapper.reCareer(companyVO);
	}

	@Override
	public void projecter(ProjectVO projectVO) throws Exception {
		compMapper.reproject(projectVO);
	}

	@Override
	public void Compout(CompanyVO companyVO) throws Exception {
		compMapper.outComp(companyVO);
	}

	@Override
	public List<CompanyVO> compList() throws Exception {
		return compMapper.listComps();
	}

	@Override
	public void compStop(String comp_id) throws Exception {
		compMapper.companyStop(comp_id);
	}

	@Override
	public void compRelease(String comp_id) throws Exception {
		compMapper.companyRelease(comp_id);
	}

	@Override
	public void updateCareer(String comp_id) throws Exception {
		compMapper.updatecareer(comp_id);
	}

	@Override
	public void delproj(ProjectVO projectVO) throws Exception {
		compMapper.deleteProj(projectVO);
	}

	@Override
	public List<ChartFreeVO> selectChart() throws Exception {
		return compMapper.selectChart();
	}

	@Override
	public int totalFreeCnt() throws Exception {
		return compMapper.totalFreeCnt();
	}

	@Override
	public int totalCompCnt() throws Exception {
		return compMapper.totalCompCnt();
	}

	@Override
	public int totalProjectCnt() throws Exception {
		return compMapper.totalProjectCnt();
	}

	@Override
	public int currentProjectCnt() throws Exception {
		return compMapper.currentProjectCnt();
	}

	@Override
	public int normalFreeCnt() throws Exception {
		return compMapper.normalFreeCnt();
	}

	@Override
	public int stopFreeCnt() throws Exception {
		return compMapper.stopFreeCnt();
	}

	@Override
	public int leaveFreeCnt() throws Exception {
		return compMapper.leaveFreeCnt();
	}

	@Override
	public int normalCompCnt() throws Exception {
		return compMapper.normalCompCnt();
	}

	@Override
	public int leaveCompCnt() throws Exception {
		return compMapper.leaveCompCnt();
	}

	@Override
	public int waitCompCnt() throws Exception {
		return compMapper.waitCompCnt();
	}

	@Override
	public int monthFreeCnt(String ymonth) throws Exception {
		return compMapper.monthFreeCnt(ymonth);
	}

	@Override
	public int monthCompCnt(String ymonth) throws Exception {
		return compMapper.monthCompCnt(ymonth);
	}
	
	@Override
	public List<CompanyVO> compsearch(String comp_id) throws Exception {
		return compMapper.searchList(comp_id);
	}
}
