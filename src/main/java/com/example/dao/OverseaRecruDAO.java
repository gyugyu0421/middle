package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.MemberVO;
import com.example.model.RecruVO;


@Mapper
public interface OverseaRecruDAO {

	public void insertOverseaRecru(RecruVO vo);

	public void updateOverseaRecru(RecruVO vo) ;

	public void deleteOverseaRecru(RecruVO vo);

	public RecruVO getOverseaRecru(RecruVO vo) ;

	public List<RecruVO> getOtherOverseaRecruList(HashMap map) ;
	
	public List<RecruVO> getOverseaRecruList(HashMap map) ; 
	
	int getOverseaRecruCount();
	
	List<RecruVO> filterOverseaRecruitments(Map<String, Object> params);
	
}
