package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.ReportVO;


public interface ReportDAO {

    // 신고 등록
    int insertReport(ReportVO report);

    // 신고 목록 조회 (전체 혹은 특정 게시판)
    List<ReportVO> selectReportsByBoardType(String boardType);

    // 신고 상세 조회 (신고번호로)
    ReportVO selectReportById(int reportId);

    // 신고 처리 상태 업데이트
    int updateReportStatus(@Param("reportId") int reportId, @Param("status") String status);

    // 신고 삭제 (관리자 권한)
    int deleteReport(int reportId);
    
    List<ReportVO> getAllReports();
    
    

    int countReportsByStatus(@Param("status") String status);

    List<ReportVO> selectRecentReports();
}