package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.MemberVO;
import com.example.model.RecruVO;
import com.example.model.ResumeVO;


@Mapper
public interface ResumeDAO {

	public void insertResume(ResumeVO vo);

	public void updateResume(ResumeVO vo) ;

	public void deleteResume(ResumeVO vo);

	public ResumeVO getResume(ResumeVO vo) ;

	public List<ResumeVO> getOtherResumeList(HashMap map) ;
	
	public List<ResumeVO> getResumeList(Map<String, Object> map) ; 
	
	int getResumeCount();
	
	List<RecruVO> filterRecruitments(Map<String, Object> params);
	
}
