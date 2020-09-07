package com.spring.freelancer.free;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.freelancer.company.CareerVO;
import com.spring.freelancer.company.CompanyVO;
import com.spring.freelancer.company.ProjectVO;
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

	// 프리 정지
	@Override
	public void freelancerStop(String free_id) throws Exception {
		freeMapper.stopFree(free_id);

	}

	@Override
	public void freelancerRelease(String free_id) throws Exception {
		freeMapper.releaseFree(free_id);
	}

	@Override
	public void addFree(FreeVO free) throws DataAccessException {

		freeMapper.insertFree(free);
	}

	@Override
	public int freeIdCheck(String free_id) throws Exception {

		return freeMapper.checkOverId(free_id);
	}

	@Override
	public FreeVO loginById(FreeVO freeVO) throws Exception {
		return freeMapper.loginById(freeVO);
	}

	@Override
	public void addFreePic(String free_picture, String free_id) throws Exception {
		freeMapper.addFreePic(free_picture, free_id);
	}

	@Override
	public void addCareer(FreeCareerVO careerVO) throws Exception {
		freeMapper.addCareer(careerVO);
	}

	@Override
	public void addFreeFile(String free_file, String free_id) throws Exception {

		freeMapper.addFreeFile(free_file, free_id);
	}

	@Override
	public void addFreeSkill(String free_id, String skill) throws Exception {

		freeMapper.addFreeSkill(free_id, skill);
	}

	@Override
	public String findid(FreeVO freeVO) throws Exception {
		return freeMapper.findid(freeVO);
	}

	@Override
	public String findpw(FreeVO freeVO) throws Exception {
		return freeMapper.findpw(freeVO);
	}

	@Override
	public void pwreset(FreeVO freeVO) throws Exception {
		freeMapper.pwreset(freeVO);
	}

	@Override
	public int numOfCareer(String free_id) throws Exception {
		return freeMapper.numOfCareer(free_id);
	}

	@Override
	public int numOfSkill(String free_id) throws Exception {
		return freeMapper.numOfSkill(free_id);

	}

	@Override
	public List<FreeCareerVO> selectCarList(String free_id) throws Exception {
		return freeMapper.selectCarList(free_id);
	}

	@Override
	public String[] selectSkill(String free_id) throws Exception {
		return freeMapper.selectSkill(free_id);
	}

	@Override
	public List<FreeVO> listFreeSearch(List<String> lanList, String free_level, String free_addr, int startCount)
			throws Exception {

		System.out.println("ser lanList:" + lanList);

		HashMap<String, Object> lanMap = new HashMap<String, Object>();
		lanMap.put("lanList", lanList);
		lanMap.put("free_level", free_level);
		lanMap.put("free_addr", free_addr);
		lanMap.put("startCount", startCount);

		System.out.println("ser lanMap: " + lanMap);
		return freeMapper.SearchFree(lanMap);
	}

	@Override
	public List<FreeVO> listFreeSkill() throws Exception {

		return freeMapper.freeSkill();
	}

	@Override
	public int freeCnt(List<String> lanList, String free_level, String free_addr, int startCount) throws Exception {

		HashMap<String, Object> lanMap = new HashMap<String, Object>();
		lanMap.put("lanList", lanList);
		lanMap.put("free_level", free_level);
		lanMap.put("free_addr", free_addr);
		lanMap.put("startCount", startCount);

		// System.out.println("ser lanMap: "+lanMap);
		return freeMapper.freeCount(lanMap);
	}

	@Override
	public FreeVO freeInfo(String free_id) throws Exception {
		return freeMapper.freeInfo(free_id);
	}

	@Override
	public List<FreeCareerVO> listFreeCareer(String free_id) throws Exception {
		return freeMapper.freeCareerList(free_id);
	}

	@Override
	public void modFree(FreeVO freeVO) throws Exception {
		freeMapper.modFree(freeVO);
	}

	@Override
	public int stopFreeSelf(String free_id) throws Exception {
		return freeMapper.stopFreeSelf(free_id);
	}

	@Override
	public int startFreeSelf(String free_id) throws Exception {
		return freeMapper.startFreeSelf(free_id);
	}

	@Override
	public void dropFree(String free_id) throws Exception {
		freeMapper.dropFree(free_id);
	}

	@Override
	public void insertMsg(MessageVO messageVO) throws Exception {
		freeMapper.messageInsert(messageVO);
	}

	@Override
	public int checkMsg(String free_id) throws Exception {
		return freeMapper.msgCheckCount(free_id);
	}

	@Override
	public void updateMsg(String free_id) throws Exception {
		freeMapper.msgCheck(free_id);
	}

	@Override
	public List<MessageVO> compMsg(String free_id) throws Exception {
		return freeMapper.compMessage(free_id);
	}

	@Override
	public List<CompanyVO> compInfo(String comp_id) throws Exception {
		return freeMapper.companyInfo(comp_id);
	}

	@Override
	public List<MessageVO> compMsg(String free_id, int msg_num) throws Exception {
		HashMap<String, Object> msg = new HashMap<String, Object>();
		msg.put("free_id", free_id);
		msg.put("msg_num", msg_num);
		return freeMapper.compMsg(msg);
	}

	@Override
	public List<CareerVO> compCareer(String comp_id) throws Exception {
		return freeMapper.selectCareer(comp_id);
	}

	@Override
	public int modCareer(FreeCareerVO freeCareerVO) throws Exception {
		return freeMapper.modCareer(freeCareerVO);
	}

	@Override
	public void insertCareer(FreeCareerVO freeCareerVO) throws Exception {
		freeMapper.insertCareer(freeCareerVO);
	}

	@Override
	public void delSkill(String free_id, String free_skill) throws Exception {
		freeMapper.delSkill(free_id, free_skill);
	}

	@Override
	public int getzziminfo(FreeZzimVO zzimvo) throws Exception {
		return freeMapper.getzziminfo(zzimvo);
	}

	@Override
	public void deletezzim(FreeZzimVO zzimvo) throws Exception {
		freeMapper.deletezzim(zzimvo);
	}

	@Override
	public void insertzzim(FreeZzimVO zzimvo) throws Exception {
		freeMapper.insertzzim(zzimvo);
	}

	@Override
	public List<FreeVO> getzzimlistfree(String comp_id) throws Exception {
		List<FreeVO> listfreevo = freeMapper.getzzimlistfree(comp_id);
		return listfreevo;
	}

	@Override
	public List<ProjectVO> compProject(String comp_id) throws Exception {
		return freeMapper.projectComp(comp_id);
	}

	@Override
	public List<ChartCompVO> selectChart() throws Exception {
		return freeMapper.selectChart();
	}

	@Override
	public int totalFreeCnt() throws Exception {
		return freeMapper.totalFreeCnt();
	}

	@Override
	public int totalCompCnt() throws Exception {
		return freeMapper.totalCompCnt();
	}

	@Override
	public int totalProjectCnt() throws Exception {
		return freeMapper.totalProjectCnt();
	}

	@Override
	public int currentProjectCnt() throws Exception {
		return freeMapper.currentProjectCnt();
	}

	@Override
	public int normalFreeCnt() throws Exception {
		return freeMapper.normalFreeCnt();
	}

	@Override
	public int stopFreeCnt() throws Exception {
		return freeMapper.stopFreeCnt();
	}

	@Override
	public int leaveFreeCnt() throws Exception {
		return freeMapper.leaveFreeCnt();
	}

	@Override
	public int normalCompCnt() throws Exception {
		return freeMapper.normalCompCnt();
	}

	@Override
	public int leaveCompCnt() throws Exception {
		return freeMapper.leaveCompCnt();
	}

	@Override
	public int waitCompCnt() throws Exception {
		return freeMapper.waitCompCnt();
	}

	@Override
	public int monthFreeCnt(String ymonth) throws Exception {
		return freeMapper.monthFreeCnt(ymonth);
	}

	@Override
	public int monthCompCnt(String ymonth) throws Exception {
		return freeMapper.monthCompCnt(ymonth);
	}
	
	@Override
	public void deleteMsg(MessageVO messageVO) throws Exception {
		freeMapper.delMessage(messageVO);
	}
	
	@Override
	public List<FreeVO> freesearch(String free_id) throws Exception {
		return freeMapper.searchfree(free_id);
	}
}
