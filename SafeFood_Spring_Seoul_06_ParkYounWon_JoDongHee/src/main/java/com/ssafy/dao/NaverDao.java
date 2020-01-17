package com.ssafy.dao;

import java.util.List;

import com.ssafy.vo.Naver;

public interface NaverDao {
	public void insert(Naver naver);
	public Naver selectOne(int num);
	public List<Naver> selectAll();
	public void delete(int num);
	public void update(Naver naver);
	
	//public List<Integer> bestfood();
}
