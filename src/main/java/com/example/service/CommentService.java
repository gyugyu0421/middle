package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CommentDAO;
import com.example.model.CommentVO;

public interface CommentService {
    List<CommentVO> getCommentsByFbkey(Long fbkey);
    int addComment(CommentVO comment);
}