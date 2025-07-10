package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.model.CommentVO;

@Mapper
public interface CommentDAO {

    List<CommentVO> selectCommentsByFbkey(@Param("fbkey") Long fbkey);

    int insertComment(CommentVO comment);
}