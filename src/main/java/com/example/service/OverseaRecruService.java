package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.dao.RecruDAO;
import com.example.model.MemberVO;
import com.example.model.RecruVO;


public interface OverseaRecruService {
	
	// 글 등록
	void insertOverseaRecru(RecruVO vo);

	// 글 수정
	void updateOverseaRecru(RecruVO vo);

	// 글 삭제
	void deleteOverseaRecru(RecruVO vo);

	// 글 상세 조회
	RecruVO getOverseaRecru(RecruVO vo);
	
	// 글 목록 조회
	List<RecruVO> getOverseaRecruList(HashMap map);

	// 다른 공고 조회
	List<RecruVO> getOtherOverseaRecruList(HashMap map);
	
	//글 개수 조회
	int getOverseaRecruCount();
	
	//글 서치 필터 적용
	List<RecruVO> filterOverseaRecruitments(Map<String, Object> params);
}
