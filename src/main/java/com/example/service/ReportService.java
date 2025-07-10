package com.example.service;

import java.util.List;

import com.example.model.ReportVO;
import com.example.model.ReportedPostVO;

public interface ReportService {
    void insertReport(ReportVO report);
    List<ReportVO> getReportsByBoardType(String boardType);
    ReportVO getReportById(int reportId);
    void updateReportStatus(int reportId, String status);
    void deleteReport(int reportId);
	List<ReportVO> getAllReports();
	
	ReportedPostVO getReportedPost(String boardType, int boardId);
	
	
	
	int countReportsByStatus(String status);
	List<ReportVO> getRecentReports();
}