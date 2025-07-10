package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.dao.AdminFreeboardDAO;
import com.example.dao.RecruitmentDAO;
import com.example.dao.ReportDAO;
import com.example.model.AdminFreeboardVO;
import com.example.model.RecruitmentVO;
import com.example.model.ReportVO;
import com.example.model.ReportedPostVO;

@Service
public class ReportServiceImpl implements ReportService {

    private final ReportDAO reportDAO;
    private final AdminFreeboardDAO freeboardDAO;
    private final RecruitmentDAO recruitmentDAO;

    public ReportServiceImpl(ReportDAO reportDAO, AdminFreeboardDAO freeboardDAO, RecruitmentDAO recruitmentDAO) {
        this.reportDAO = reportDAO;
        this.freeboardDAO = freeboardDAO;
        this.recruitmentDAO = recruitmentDAO;
    }

    @Override
    public void insertReport(ReportVO report) {
    	reportDAO.insertReport(report);
    }

    @Override
    public List<ReportVO> getReportsByBoardType(String boardType) {
        return reportDAO.selectReportsByBoardType(boardType);
    }

    @Override
    public ReportVO getReportById(int reportId) {
        return reportDAO.selectReportById(reportId);
    }

    @Override
    public void updateReportStatus(int reportId, String status) {
    	reportDAO.updateReportStatus(reportId, status);
    }

    @Override
    public void deleteReport(int reportId) {
    	reportDAO.deleteReport(reportId);
    }
    
    @Override
    public List<ReportVO> getAllReports() {
        return reportDAO.getAllReports();
    }
    
    @Override
    public ReportedPostVO getReportedPost(String boardType, int boardId) {
        ReportedPostVO vo = new ReportedPostVO();
        vo.setBoardType(boardType);

        if ("freeboard".equalsIgnoreCase(boardType)) {
            AdminFreeboardVO freeboard = freeboardDAO.getFreeboardDetail(boardId);
            vo.setFreeboard(freeboard);
        } else if ("recruitment".equalsIgnoreCase(boardType)) {
            RecruitmentVO recruitment = recruitmentDAO.selectRecruitmentById(boardId);
            vo.setRecruitment(recruitment);
        }

        return vo;
    }
    
    @Override
    public int countReportsByStatus(String status) {
        return reportDAO.countReportsByStatus(status);
    }

    @Override
    public List<ReportVO> getRecentReports() {
        // MyBatis 매퍼에 limit 파라미터 처리 추가 안 했으면 직접 처리하거나 고정값 써도 됨.
        // 여기서는 고정 5건으로 처리하니 limit 무시.
        return reportDAO.selectRecentReports();
    }
}
