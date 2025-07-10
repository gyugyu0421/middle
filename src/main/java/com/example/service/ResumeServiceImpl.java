package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RecruDAO;
import com.example.dao.ResumeDAO;
import com.example.model.RecruVO;
import com.example.model.ResumeVO;

@Service
public class ResumeServiceImpl implements ResumeService{
	 
		@Autowired
	    private ResumeDAO resumeDAO;
	
		// 글 등록
		@Override
		public void insertResume(ResumeVO vo) {
			resumeDAO.insertResume(vo);
		};

		// 글 수정
		@Override
		public void updateResume(ResumeVO vo) {
			resumeDAO.updateResume(vo);
		};

		// 글 삭제
		@Override
		public void deleteResume(ResumeVO vo) {
			resumeDAO.deleteResume(vo);
		};

		// 글 상세 조회
		@Override
		public ResumeVO getResume(ResumeVO vo) {
		 System.out.println("서비스에서 getResume진입");
			return resumeDAO.getResume(vo);
		};

		// 다른 공고 조회
		@Override
		public List<ResumeVO> getOtherResumeList(HashMap map){
			System.out.println("서비스에서 getOtherResumeList진입");
			return resumeDAO.getOtherResumeList(map);

		};
		
		
		// 글 목록 조회
		@Override
		public List<ResumeVO> getResumeList(Map<String, Object> map){
			System.out.println("서비스에서 getResumeList진입");
			return resumeDAO.getResumeList(map);
			
		};
		
		
		  //글 개수 조회
		  @Override public int getResumeCount(){
		  System.out.println("서비스에서 getResumeCount진입"); return
		  resumeDAO.getResumeCount();
		  
		  };
		 
		

}
