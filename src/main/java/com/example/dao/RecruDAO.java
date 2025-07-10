package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.MemberVO;
import com.example.model.RecruVO;


@Mapper
public interface RecruDAO {

	public void insertKRecru(RecruVO vo);

	public void updateKRecru(RecruVO vo) ;

	public void deleteKRecru(RecruVO vo);

	public RecruVO getKRecru(RecruVO vo) ;

	public List<RecruVO> getOtherKRecruList(HashMap map) ;
	
	public List<RecruVO> getKRecruList(HashMap map) ; 
	
	int getRecruCount();
	
	List<RecruVO> filterRecruitments(Map<String, Object> params);
	
}
