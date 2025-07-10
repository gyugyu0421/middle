package com.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportedPostVO {
    private String boardType; // "freeboard" 또는 "recruitment"
    private AdminFreeboardVO freeboard; // 자유게시판 게시글
    private RecruitmentVO recruitment;  // 채용공고 게시글
}