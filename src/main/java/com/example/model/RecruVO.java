package com.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecruVO {

    private int rckey; //키값
    private String username; //기업명
    private String rctitle; //채용공고명
    private String rcwtype; //근무형태
    private String rcsal;	//연봉
    private String rcdeadline; //마감
    private String rchist; //경력
    private String rcedu;	//학력
    private String rcrank;	//직급
    private String rcpreffer;	//우대사항
    private String rccontent;	//채용공고내용
    private String rcloca;	//국가/해외
    private String rcimg;	//채용공고 이미지 파일
    private int rccount;  //사원수
    private String rccestab;	//설립일
    private String rccform;	//기업형태
    private String rccweb;	//홈페이지
    private String rcstatus;	//상태
    private String rregion; //근무지역 컬럼
    private Double latitude; //위도
    private Double longitude; //경도
    

	
}
