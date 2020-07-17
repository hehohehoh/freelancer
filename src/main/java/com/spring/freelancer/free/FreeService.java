package com.spring.freelancer.free;

import java.util.List;

import org.springframework.dao.DataAccessException;

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
	
	public List<FreeVO> listFreeSearch(List<String> lanList, String free_level, String free_addr, int startCount) throws Exception;
    
    public List<FreeVO> listFreeSkill() throws Exception;
   
    public int freeCnt(List<String> lanList, String free_level, String free_addr, int startCount) throws Exception;
   
    public FreeVO freeInfo(String free_id) throws Exception;
   
    public List<FreeCareerVO> listFreeCareer(String free_id) throws Exception;
	
    public void modFree(FreeVO freeVO) throws Exception;
    
    public int stopFreeSelf(String free_id) throws Exception;
    
    public int startFreeSelf(String free_id) throws Exception;
    
    public void dropFree(String free_id) throws Exception;
}
