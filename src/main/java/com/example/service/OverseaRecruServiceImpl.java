package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.OverseaRecruDAO;
import com.example.model.RecruVO;

@Service
public class OverseaRecruServiceImpl implements OverseaRecruService {

    @Autowired
    private OverseaRecruDAO overseaRecruDAO;
    


    @Override
	public void insertOverseaRecru(RecruVO vo) {

    	overseaRecruDAO.insertOverseaRecru(vo);
	}

	@Override
	public void updateOverseaRecru(RecruVO vo) {
		overseaRecruDAO.updateOverseaRecru(vo);
		
	}

	@Override
	public void deleteOverseaRecru(RecruVO vo) {
		overseaRecruDAO.deleteOverseaRecru(vo);
		
	}

	@Override
	public RecruVO getOverseaRecru(RecruVO vo) {
		// TODO Auto-generated method stub
     System.out.println("서비스에서 getKRecru진입");
		return overseaRecruDAO.getOverseaRecru(vo);
	}

    @Override
    public List<RecruVO> getOtherOverseaRecruList(HashMap map) {
        System.out.println("서비스에서 getOtherKRecruList(HashMap) 진입");
        return overseaRecruDAO.getOtherOverseaRecruList(map);
    }
    
    
    @Override
    public List<RecruVO> getOverseaRecruList(HashMap map) {
    	System.out.println("서비스에서 getKRecruList(HashMap) 진입");
    	return overseaRecruDAO.getOverseaRecruList(map);
    }
    
    @Override
    public int getOverseaRecruCount() {
    	System.out.println("서비스에서 getRecruCount 진입");
        return overseaRecruDAO.getOverseaRecruCount(); // Mapper와 연결
    }

    @Override
    public List<RecruVO> filterOverseaRecruitments(Map<String, Object> params){
    	System.out.println("서비스에서 filterRecruitments 진입");
    	return overseaRecruDAO.filterOverseaRecruitments(params); // 인자 넘김
		
	}
    

}