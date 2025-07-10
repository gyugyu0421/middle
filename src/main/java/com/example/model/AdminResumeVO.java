package com.example.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminResumeVO {
    private Long rskey;           // 이력서 고유키
    private Long mkey;            // 회원 고유키 (외래키)
    private String id;            // 회원 아이디
    private String rsname;        // 이름
    private String rscontect;     // 연락처
    private String rsemail;       // 이메일
    private String rsadd;         // 주소
    private String rshistory;     // 학력 사항
    private String rspart;        // 지원 분야
    private Date rshstart;        // 고등학교 시작일
    private Date rshend;          // 고등학교 종료일
    private String rsedu;         // 대학교 이름
    private String rsmajor;       // 전공
    private Date rsestart;        // 대학교 시작일
    private Date rseend;          // 대학교 종료일
    private String rsskname;      // 스킬 이름
    private String rsskcontent;   // 스킬 설명
    private String rscletter;     // 자기소개서 (CLOB → String 처리 가능)
}