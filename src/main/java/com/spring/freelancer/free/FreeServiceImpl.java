package com.spring.freelancer.free;

import java.util.HashMap;
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
	
	//프리 정지
	@Override
	public void freelancerStop(String free_id) throws Exception {
		freeMapper.stopFree(free_id);
		
	}
	
	@Override
	public void freelancerRelease(String free_id) throws Exception{
		freeMapper.releaseFree(free_id);
	}

	@Override
	public void addFree(FreeVO free) throws DataAccessException {
		
		freeMapper.insertFree(free);
	}
	
	@Override
	public int freeIdCheck(String free_id) throws Exception{
		
		return freeMapper.checkOverId(free_id);
	}
	
	@Override
	public FreeVO loginById(FreeVO freeVO) throws Exception{
		return freeMapper.loginById(freeVO);
	}
	
	@Override
	public void addFreePic(String free_picture, String free_id) throws Exception{
		freeMapper.addFreePic(free_picture, free_id);
	}
		
	@Override
	public void addCareer(FreeCareerVO careerVO) throws Exception{
		freeMapper.addCareer(careerVO);
	}
	
	@Override
	public void addFreeFile(String free_file, String free_id) throws Exception{
		
		freeMapper.addFreeFile(free_file, free_id);
	}
	
	@Override
	public void addFreeSkill(String free_id, String skill) throws Exception{
		
		freeMapper.addFreeSkill(free_id, skill);
	}
	
	@Override
	public String findid(FreeVO freeVO) throws Exception{
		return freeMapper.findid(freeVO);
	}
	
	@Override
	public String findpw(FreeVO freeVO) throws Exception{
		return freeMapper.findpw(freeVO);
	}
	
	@Override
	public void pwreset(FreeVO freeVO) throws Exception {
		freeMapper.pwreset(freeVO);
	}
   
   @Override
   public int numOfCareer(String free_id) throws Exception{
	   return freeMapper.numOfCareer(free_id);
   }
   
   @Override
   public int numOfSkill(String free_id) throws Exception{
	   return freeMapper.numOfSkill(free_id);
	  
   }
   
   @Override
   public List<FreeCareerVO> selectCarList(String free_id) throws Exception{
	   return freeMapper.selectCarList(free_id);
   }
   
   @Override
   public String[] selectSkill(String free_id) throws Exception{
	   return freeMapper.selectSkill(free_id);
   }
	
   
   @Override
   public List<FreeVO> listFreeSearch(List<String> lanList, String free_level, String free_addr, int startCount) throws Exception {
   
     System.out.println("ser lanList:" +lanList);

     HashMap<String, Object> lanMap = new HashMap<String, Object>();
      lanMap.put("lanList", lanList);
      lanMap.put("free_level", free_level);
      lanMap.put("free_addr", free_addr);
      lanMap.put("startCount", startCount);
     
      System.out.println("ser lanMap: "+lanMap);
      return freeMapper.SearchFree(lanMap);
  }
  
  @Override
  public List<FreeVO> listFreeSkill() throws Exception {

     return freeMapper.freeSkill();
  }
  
  @Override
  public int freeCnt(List<String> lanList, String free_level, String free_addr, int startCount) throws Exception {
     System.out.println("ser lanList:" +lanList);

     HashMap<String, Object> lanMap = new HashMap<String, Object>();
     lanMap.put("lanList",lanList);
     lanMap.put("free_level", free_level);
     lanMap.put("free_addr", free_addr);
     lanMap.put("startCount", startCount);
    
     //System.out.println("ser lanMap: "+lanMap);
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
  public void modFree(FreeVO freeVO) throws Exception{
	  freeMapper.modFree(freeVO);
  }
  
  @Override
  public int stopFreeSelf(String free_id) throws Exception{
	  return freeMapper.stopFreeSelf(free_id);
  }
  
  @Override
  public int startFreeSelf(String free_id) throws Exception{
	  return freeMapper.startFreeSelf(free_id);
  }
  
  @Override
  public void dropFree(String free_id) throws Exception{
	  freeMapper.dropFree(free_id);
  }
}
