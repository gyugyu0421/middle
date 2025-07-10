package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.CommentVO;
import com.example.service.CommentService;

@RestController
@RequestMapping("/comments")  // 여기서 댓글 관련 요청은 모두 /comments/** 경로로 처리됨
public class CommentController {

    @Autowired
    private CommentService commentService;

    // GET /comments?fbkey=123 형태로 호출
    @GetMapping
    public List<CommentVO> getComments(@RequestParam Long fbkey) {
        return commentService.getCommentsByFbkey(fbkey);
    }

    // POST /comments 형태로 호출
    @PostMapping
    public int addComment(@RequestBody CommentVO comment) {
        return commentService.addComment(comment);
    }
}