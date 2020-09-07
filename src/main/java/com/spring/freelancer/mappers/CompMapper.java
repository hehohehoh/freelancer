package com.spring.freelancer.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.freelancer.company.ChartFreeVO;
import com.spring.freelancer.company.CompanyVO;
import com.spring.freelancer.company.ProjectVO;

@Mapper()
public interface CompMapper {

	// 기업 가입
	void insertCompInfo(CompanyVO companyVO) throws Exception;

	// 기업 아이디 중복체크
	int checkOverId(String comp_id) throws Exception;

	// 기업 승인할 리스트
	List<CompanyVO> compApproList() throws Exception;

	// 기업 승인
	void compAppro(String comp_id) throws Exception;

	// 기업 로그인
	CompanyVO loginById(CompanyVO companyVO) throws Exception;

	String resultid(CompanyVO companyVO) throws Exception;

	String resultpw(CompanyVO companyVO) throws Exception;

	void pwreset(CompanyVO companyVO) throws Exception;

	void mypageInfo(CompanyVO companyVO) throws Exception;

	List<CompanyVO> compCareer(CompanyVO companyVO) throws Exception;

	List<ProjectVO> compProject(CompanyVO companyVO) throws Exception;

	void inCareer(CompanyVO companyVO) throws Exception;

	void inProject(ProjectVO projectVO) throws Exception;

	void reCareer(CompanyVO companyVO) throws Exception;

	void reproject(ProjectVO projectVO) throws Exception;

	void outComp(CompanyVO companyVO) throws Exception;

	List<CompanyVO> listComps() throws Exception;

	void companyStop(String comp_id) throws Exception;

	void companyRelease(String comp_id) throws Exception;

	void updatecareer(String comp_id) throws Exception;

	public void deleteProj(ProjectVO projectVO) throws Exception;

	List<ChartFreeVO> selectChart() throws Exception;

	int totalFreeCnt() throws Exception;

	int totalCompCnt() throws Exception;

	int totalProjectCnt() throws Exception;

	int currentProjectCnt() throws Exception;

	int normalFreeCnt() throws Exception;

	int stopFreeCnt() throws Exception;

	int leaveFreeCnt() throws Exception;

	int normalCompCnt() throws Exception;

	int leaveCompCnt() throws Exception;

	int waitCompCnt() throws Exception;

	int monthFreeCnt(String ymonth) throws Exception;

	int monthCompCnt(String ymonth) throws Exception;
	
	List<CompanyVO> searchList(String comp_id) throws Exception;
	
}
