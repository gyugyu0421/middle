package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CommentDAO;
import com.example.model.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

    private final CommentDAO commentdao;

    @Autowired
    public CommentServiceImpl(CommentDAO commentdao) {
        this.commentdao = commentdao;
    }

    @Override
    public List<CommentVO> getCommentsByFbkey(Long fbkey) {
        return commentdao.selectCommentsByFbkey(fbkey);
    }

    @Override
    public int addComment(CommentVO comment) {
        return commentdao.insertComment(comment);
    }
}