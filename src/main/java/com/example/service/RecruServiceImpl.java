package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RecruDAO;
import com.example.model.RecruVO;


@Service 
public class RecruServiceImpl implements RecruService {

    @Autowired
    private RecruDAO recruDAO;
    
    @Override
	public void insertKRecru(RecruVO vo) {

		recruDAO.insertKRecru(vo);
	}

	@Override
	public void updateKRecru(RecruVO vo) {
		recruDAO.updateKRecru(vo);
		
	}

	@Override
	public void deleteKRecru(RecruVO vo) {
		recruDAO.deleteKRecru(vo);
		
	}

	@Override
	public RecruVO getKRecru(RecruVO vo) {
		// TODO Auto-generated method stub
     System.out.println("서비스에서 getKRecru진입");
		return recruDAO.getKRecru(vo);
	}

    @Override
    public List<RecruVO> getOtherKRecruList(HashMap map) {
        System.out.println("서비스에서 getOtherKRecruList(HashMap) 진입");
        return recruDAO.getOtherKRecruList(map);
    }
    
    
    @Override
    public List<RecruVO> getKRecruList(HashMap map) {
    	System.out.println("서비스에서 getKRecruList(HashMap) 진입");
    	return recruDAO.getKRecruList(map);
    }
    
    @Override
    public int getRecruCount() {
    	System.out.println("서비스에서 getRecruCount 진입");
        return recruDAO.getRecruCount(); // Mapper와 연결
    }

    @Override
    public List<RecruVO> filterRecruitments(Map<String, Object> params){
    	System.out.println("서비스에서 filterRecruitments 진입");
    	return recruDAO.filterRecruitments(params); // 인자 넘김
		
	}
    

}
