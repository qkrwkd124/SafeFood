package com.ssafy.dao;

import java.util.List;

import com.ssafy.vo.Comment;

public interface CommentDAO {
	List<Comment> SelectAllC();
	Comment SelectOneC(int c_num);
	void insertC(Comment comment);
	void updateC(Comment comment);
	void deleteC(int c_num);
	
}
