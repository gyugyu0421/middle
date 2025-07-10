package com.example.model;

import lombok.Data;

@Data
public class ResumeVO {
    private int rskey;         // 글 키 값
    private int mkey;           // 회원 키값
    private String id;          // 아이디
    private String rsname;    // 이름
    private String rscontect; // 연락처
    private String rsemail;       // 이메일
    private String rsadd;  // 주소
    private String rshistory;    // 경력회사명
    private String rspart;  //경력 직무
    private String rshstart;  //입사일
    private String rshend;  //퇴사일
    private String rsedu;  //최종학교명
    private String rsmajor;  //전공
    private String rsestart;  //입학일
    private String rseend;  //졸업일
    private String rsskname;  //기술명
    private String rsskcontent;  //기술상세
    private String rscletter;  //자기소개서
    private String rstitle;  //이력서 제목
    private String rsapplied;  //지원 직무
    private String rsawards;  //수상
       
    
    
    
}
