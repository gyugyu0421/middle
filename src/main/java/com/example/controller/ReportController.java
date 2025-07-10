package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.ReportVO;
import com.example.model.ReportedPostVO;
import com.example.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;

	// 신고 목록 페이지 (JSP 반환)
	@GetMapping("/reportList")
	public String reportList(Model model) {
		List<ReportVO> reports = reportService.getAllReports();
		model.addAttribute("reportList", reports);
		return "reportList"; // /WEB-INF/views/reportList.jsp
	}

	// 신고 상세 페이지 (JSP 반환) + 상태 처리 통합
	@GetMapping("/report/detail/{reportId}")
	public String reportDetail(@PathVariable int reportId, Model model) {
		ReportVO report = reportService.getReportById(reportId);
		if (report == null) {
			return "redirect:/reportList"; // 상세 데이터 없으면 목록으로 리다이렉트
		}

		// 상태가 '처리대기'면 '처리중'으로 변경
		if ("처리대기".equals(report.getStatus())) {
			reportService.updateReportStatus(reportId, "처리중"); // 서비스 메서드명에 맞게 수정
			report.setStatus("처리중"); // 화면에 바로 반영
		}

		model.addAttribute("report", report);

		// 신고된 게시글 상세 정보 가져오기
		ReportedPostVO reportedPost = reportService.getReportedPost(report.getBoardType(), report.getBoardId());
		model.addAttribute("reportedPost", reportedPost);

		return "reportDetail"; // /WEB-INF/views/reportDetail.jsp
	}

	@PostMapping("/report/complete/{reportId}")
	public String completeReport(@PathVariable int reportId, RedirectAttributes redirectAttrs) {
		try {
			reportService.updateReportStatus(reportId, "처리완료");
			redirectAttrs.addFlashAttribute("message", "처리완료 상태로 변경되었습니다.");
		} catch (Exception e) {
			redirectAttrs.addFlashAttribute("error", "처리완료 상태 변경에 실패했습니다.");
		}
		return "redirect:/reportList";
	}

	// 신고 삭제 (GET 방식 사용, 리다이렉트)
	@GetMapping("/report/delete/{reportId}")
	public String deleteReport(@PathVariable int reportId, RedirectAttributes redirectAttrs) {
		try {
			reportService.deleteReport(reportId);
			redirectAttrs.addFlashAttribute("message", "신고가 삭제되었습니다.");
		} catch (Exception e) {
			redirectAttrs.addFlashAttribute("error", "삭제에 실패했습니다.");
		}
		return "redirect:/reportList";
	}

	// 신고 대상 글 상세 보기
	@GetMapping("/reportedPost")
	public String getReportedPost(@RequestParam("boardType") String boardType, @RequestParam("boardId") int boardId,
			Model model) {
		ReportedPostVO reportedPost = reportService.getReportedPost(boardType, boardId);
		model.addAttribute("reportedPost", reportedPost);
		return "reportedPostDetail"; // JSP 파일명 (예: reportedPostDetail.jsp)
	}

	@GetMapping("/report/updateStatus")
	public String updateReportStatus(@RequestParam int reportId, @RequestParam String status) {
		// 상태값이 처리중 또는 처리완료인지 체크 (보안용)
		if ("처리중".equals(status) || "처리완료".equals(status)) {
			reportService.updateReportStatus(reportId, status);
		}
		// 다시 신고 리스트 페이지로 이동
		return "redirect:/reportList";
	}
	
	@GetMapping("/report/list")
	public String reportList(@RequestParam(required = false) String boardType, Model model) {
	    List<ReportVO> reportList;

	    if (boardType == null || boardType.equals("all")) {
	        reportList = reportService.getAllReports();
	    } else {
	        reportList = reportService.getReportsByBoardType(boardType);
	    }

	    model.addAttribute("reportList", reportList);
	    model.addAttribute("selectedBoardType", boardType);

	    return "reportList"; // JSP 경로
	}



}