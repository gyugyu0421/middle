package com.example.model;

import lombok.Data;
import java.util.Date;

@Data
public class CommentVO {
    private Long cmtId;      // 댓글 PK
    private Long fbkey;      // 게시글 외래키 (postId 역할)
    private Long mkey;       // 회원 mkey (user PK)
    private String writer;   // 닉네임
    private String content;
    private String regdate;    // 등록일
}