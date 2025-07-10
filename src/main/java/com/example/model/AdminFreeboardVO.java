package com.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Getter, Setter, toString, equals, hashCode 자동 생성
@NoArgsConstructor // 기본 생성자 자동 생성
@AllArgsConstructor // 모든 필드를 인자로 받는 생성자 자동 생성
public class AdminFreeboardVO {
    private int fbkey;            // 게시글 번호
    private Long mkey;             // 회원 고유 번호
    private String id;            // 작성자 ID
    private String fbtitle;       // 게시글 제목
    private String fbcontent;     // 게시글 내용
    private String fbdate;        // 작성일 (문자열로 처리)
    private int fbview;           // 조회수
    private int fblike;           // 추천수
    private String fbcategory;    // 게시글 카테고리
    private String username;    // 작성자 이름
}