package com.spring.freelancer.free;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.freelancer.company.CareerVO;
import com.spring.freelancer.company.CompanyVO;
import com.spring.freelancer.company.ProjectVO;

public interface FreeService {

	public List<FreeVO> listFreelancers() throws Exception;

	public void freelancerStop(String free_id) throws Exception;

	public void freelancerRelease(String free_id) throws Exception;

	public void addFree(FreeVO free) throws DataAccessException;

	public int freeIdCheck(String free_id) throws Exception;

	public FreeVO loginById(FreeVO freeVO) throws Exception;

	public void addFreePic(String free_picture, String free_id) throws Exception;

	public void addCareer(FreeCareerVO careerVO) throws Exception;

	public void addFreeFile(String free_file, String free_id) throws Exception;

	public void addFreeSkill(String free_id, String skill) throws Exception;

	public String findid(FreeVO freeVO) throws Exception;

	public String findpw(FreeVO freeVO) throws Exception;

	public void pwreset(FreeVO freeVO) throws Exception;

	public int numOfCareer(String free_id) throws Exception;

	public int numOfSkill(String free_id) throws Exception;

	public List<FreeCareerVO> selectCarList(String free_id) throws Exception;

	public String[] selectSkill(String free_id) throws Exception;

	public List<FreeVO> listFreeSearch(List<String> lanList, String free_level, String free_addr, int startCount)
			throws Exception;

	public List<FreeVO> listFreeSkill() throws Exception;

	public int freeCnt(List<String> lanList, String free_level, String free_addr, int startCount) throws Exception;

	public FreeVO freeInfo(String free_id) throws Exception;

	public List<FreeCareerVO> listFreeCareer(String free_id) throws Exception;

	public void modFree(FreeVO freeVO) throws Exception;

	public int stopFreeSelf(String free_id) throws Exception;

	public int startFreeSelf(String free_id) throws Exception;

	public void dropFree(String free_id) throws Exception;

	public void insertMsg(MessageVO messageVO) throws Exception;

	public int checkMsg(String free_id) throws Exception;

	public void updateMsg(String free_id) throws Exception;

	public List<MessageVO> compMsg(String free_id) throws Exception;

	public List<CompanyVO> compInfo(String comp_id) throws Exception;

	public List<MessageVO> compMsg(String free_id, int msg_num) throws Exception;

	public List<CareerVO> compCareer(String comp_id) throws Exception;

	public int modCareer(FreeCareerVO freeCareerVO) throws Exception;

	public void insertCareer(FreeCareerVO freeCareerVO) throws Exception;

	public void delSkill(String free_id, String free_skill) throws Exception;

	int getzziminfo(FreeZzimVO zzimvo) throws Exception;

	void deletezzim(FreeZzimVO zzimvo) throws Exception;

	void insertzzim(FreeZzimVO zzimvo) throws Exception;

	List<FreeVO> getzzimlistfree(String comp_id) throws Exception;

	public List<ProjectVO> compProject(String comp_id) throws Exception;

	public List<ChartCompVO> selectChart() throws Exception;

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
	
	public void deleteMsg(MessageVO messageVO) throws Exception;
	
	public List<FreeVO> freesearch(String free_id) throws Exception;
}
