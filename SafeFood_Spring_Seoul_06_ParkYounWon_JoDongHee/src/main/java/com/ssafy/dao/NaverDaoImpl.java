package com.ssafy.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ssafy.vo.Naver;

@Component
public class NaverDaoImpl implements NaverDao{
	String url = "mybatis.foodMapper.";
	
	@Autowired
	SqlSession session;
	
	public void insert(Naver naver) {
		session.selectOne(url+"insertNaver",naver);
	}

	public Naver selectOne(int num) {
		return session.selectOne(url+"selectOneN",num);
	}
	
	public List<Naver> selectAll() {
		return session.selectList(url+"selectAllN");
	}
	
	public void delete(int num) {
		session.delete(url+"deleteNaver",num);
	}

	@Override
	public void update(Naver naver) {
		session.update(url+"updateNaver",naver);
	}
	
	public List<Integer> bestfood() {
		List<String> list = session.selectList(url+"bestfood");
		String s = "";
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i)==null) continue;
			s += list.get(i);
		}
		StringTokenizer st = new StringTokenizer(s, " ");
		int[][] count = new int[21][2];
		for (int i = 1; i < count.length; i++) {
			count[i][0]= i;
		}
		while(st.hasMoreTokens()) {
			count[Integer.parseInt(st.nextToken())][1]++;
		}
		Arrays.sort(count,new Comparator<int[]>() {
			@Override
			public int compare(int[] o1, int[] o2) {
				return o2[1]-o1[1];
			}
		});
//		int[] result = new int[21];
		ArrayList<Integer> result = new ArrayList<Integer>();
		for (int i = 0; i < count.length; i++) {
			if(count[i][1] ==0 ) continue;
			result.add(count[i][0]);
		}
		
		return result;
		
	}
	
	
	// Gongji
	public void insertG(Naver naver) {
		session.selectOne(url+"insertGongji",naver);
	}

	public Naver selectOneG(int num) {
		return session.selectOne(url+"selectOneG",num);
	}
	
	public List<Naver> selectAllG() {
		return session.selectList(url+"selectAllG");
	}
	
	public void deleteG(int num) {
		session.delete(url+"deleteGongji",num);
	}

	public void updateG(Naver naver) {
		session.update(url+"updateGongji",naver);
	}
}
