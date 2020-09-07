package com.spring.freelancer.company;

import java.util.List;

public interface CompanyService {
	// 기업 가입 정보 추가
	public void addCompanyInfo(CompanyVO companyVO) throws Exception;

	// 아이디 중복체크
	public int compIdCheck(String comp_id) throws Exception;

	// 기업 승인할 리스트
	public List<CompanyVO> listCompAppro() throws Exception;

	// 가입 승인
	public void updateComp(String comp_id) throws Exception;

	// 기업 로그인
	public CompanyVO login(CompanyVO companyVO) throws Exception;

	public String findid(CompanyVO companyVO) throws Exception;

	String findpw(CompanyVO companyVO) throws Exception;

	void pwreset(CompanyVO companyVO) throws Exception;

	public void mypage(CompanyVO companyVO) throws Exception;

	public List<CompanyVO> career(CompanyVO companyVO) throws Exception;

	public List<ProjectVO> project(CompanyVO companyVO) throws Exception;

	public void incareer(CompanyVO companyVO) throws Exception;

	public void inproject(ProjectVO projectVO) throws Exception;

	public void recareer(CompanyVO companyVO) throws Exception;

	public void projecter(ProjectVO projectVO) throws Exception;

	public void Compout(CompanyVO companyVO) throws Exception;

	public List<CompanyVO> compList() throws Exception;

	public void compStop(String comp_id) throws Exception;

	public void compRelease(String comp_id) throws Exception;

	public void updateCareer(String comp_id) throws Exception;

	public void delproj(ProjectVO projectVO) throws Exception;

	public List<ChartFreeVO> selectChart() throws Exception;

	public int totalFreeCnt() throws Exception;

	public int totalCompCnt() throws Exception;

	public int totalProjectCnt() throws Exception;

	public int currentProjectCnt() throws Exception;

	public int normalFreeCnt() throws Exception;

	public int stopFreeCnt() throws Exception;

	public int leaveFreeCnt() throws Exception;

	public int normalCompCnt() throws Exception;

	public int leaveCompCnt() throws Exception;

	public int waitCompCnt() throws Exception;

	public int monthFreeCnt(String ymonth) throws Exception;

	public int monthCompCnt(String ymonth) throws Exception;
	
	public List<CompanyVO> compsearch(String comp_id) throws Exception;
}
