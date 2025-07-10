package com.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportVO {
    private int reportId;         // 신고번호 (PK)
    private String boardType;     // 게시판 구분 ("freeboard", "recruitment" 등)
    private int boardId;          // 게시글 번호 (fbkey 또는 rckey)
    private Long reporterMkey;    // 신고자 회원번호
    private String reason;        // 신고사유
    private String status;        // 처리상태 ("처리대기", "처리완료" ,"처리중")
    private String reportDate;    // 신고일 (문자열 또는 Date)
    private String username;    // 신고자 이름
}