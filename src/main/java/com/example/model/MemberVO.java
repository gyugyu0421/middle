package com.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
    private Long mkey;            // 회원 고유키 (시퀀스)
    private String id;            // 아이디
    private String pw;            // 비밀번호
    private String username;      // 이름
    private String email;         // 이메일
    private String phone;         // 전화번호
    private String regdate;       // 가입일자
    private String status;        // 상태 (정상/정지 등)
    private String add1;         // 주소1
    private String add2;         // 주소2
    private String birth;        // 생년월일
    private String cnum;         // 기업 번호 (nullable)
    private String cscale;        // 기업 규모
    private String type;         // 일반/기업
    
}