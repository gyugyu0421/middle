package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.dao.RecruDAO;
import com.example.model.ResumeVO;


public interface ResumeService {
	
	// 글 등록
	void insertResume(ResumeVO vo);

	// 글 수정
	void updateResume(ResumeVO vo);

	// 글 삭제
	void deleteResume(ResumeVO vo);

	// 글 상세 조회
	ResumeVO getResume(ResumeVO vo);

	// 다른 공고 조회
	List<ResumeVO> getOtherResumeList(HashMap map);
		
	// 글 목록 조회
	List<ResumeVO> getResumeList(Map<String, Object> map);
	
	
	 //글 개수 조회 int getResumeCount();
	 int getResumeCount();
	 

}
