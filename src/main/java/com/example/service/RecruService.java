package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.dao.RecruDAO;
import com.example.model.MemberVO;
import com.example.model.RecruVO;


public interface RecruService {
	
	// 글 등록
	void insertKRecru(RecruVO vo);

	// 글 수정
	void updateKRecru(RecruVO vo);

	// 글 삭제
	void deleteKRecru(RecruVO vo);

	// 글 상세 조회
	RecruVO getKRecru(RecruVO vo);

	// 다른 공고 조회
	List<RecruVO> getOtherKRecruList(HashMap map);
	
	
	// 글 목록 조회
	List<RecruVO> getKRecruList(HashMap map);
	
	//글 개수 조회
	int getRecruCount();
	
	//글 서치 필터 적용
	List<RecruVO> filterRecruitments(Map<String, Object> params);
}
