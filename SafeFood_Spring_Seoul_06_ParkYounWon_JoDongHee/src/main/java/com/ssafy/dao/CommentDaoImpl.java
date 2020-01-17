package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ssafy.vo.Comment;

@Component
public class CommentDaoImpl implements CommentDAO{
	String url = "mybatis.foodMapper.";
	
	@Autowired
	SqlSession session;
	
	public List<Comment> SelectAllC() {
		return session.selectList(url+"SelectAllC");
	}

	public Comment SelectOneC(int c_num) {
		return session.selectOne(url+"SelectOneC",c_num);
	}

	public void insertC(Comment comment) {
		session.insert(url+"insertC",comment);
	}

	public void updateC(Comment comment) {
		session.update(url+"updateC",comment);
	}

	public void deleteC(int c_num) {
		session.delete(url+"deleteC",c_num);
	}

}
