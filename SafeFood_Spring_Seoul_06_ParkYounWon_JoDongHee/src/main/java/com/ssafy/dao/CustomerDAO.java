package com.ssafy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.StringTokenizer;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ssafy.vo.Customer;

@Component
public class CustomerDAO {
	private Connection conn;
	String url = "mybatis.foodMapper.";
	
	@Autowired
	SqlSession session;
	
	@PostConstruct
	public void init() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			String dbName="yddb";
			String url="jdbc:mysql://127.0.0.1/"+dbName;// 데이터베이스명
			url += "?characterEncoding=UTF-8&serverTimezone=UTC";
			String user = "root";
			String password = "tiger";
			
			conn = DriverManager.getConnection(url, user, password);
			System.out.println(!conn.isClosed()+" : DB 연결");
			
		}catch(Exception e) {
			
		}
	}
	public void close(Connection connection) {
		try {
			connection.close();
		}catch(Exception e) {
			
		}
	}
	public void close(PreparedStatement statement) {
		try {
			statement.close();
		}catch(Exception e) {
			
		}
	}
	public void close(ResultSet resultSet) {
		try {
			resultSet.close();
		}catch(Exception e) {
			
		}
	}
	
	public void insertCustomer(Customer c) {
		String s ="";
		for (int i = 0; i < c.getAllergys().size(); i++) {
			s += c.getAllergys().get(i)+" ";
		}
		c.setAllergy(s);
		session.insert(url + "insertCustomer",c);
		
	}
	
	public Customer One(String id) {
		Customer c = session.selectOne(url + "One",id);
		System.out.println(c.getFoodcode());
		StringTokenizer st = new StringTokenizer(c.getAllergy(), " ");
		while(st.hasMoreTokens()) {
			c.setAllergys(st.nextToken());
		}
		st = new StringTokenizer(c.getFoodcode(), " ");
		while(st.hasMoreTokens()) {
			c.setFoodcodes(Integer.parseInt(st.nextToken()));
		}
		return c;
	}
	
	public boolean findID(String id, String pass) {
		Customer c = new Customer();
		c.setId(id);
		c.setPass(pass);
		System.out.println(c.getId());
		System.out.println(c.getPass());
		String userid = session.selectOne(url+"findID",c);
		System.out.println(userid);
		if(userid == null || userid.equals("")) {
			return false;
		}else {
			return true;
		}
	}
	
	public void update(Customer c) {
		String s = "";
		for (int i = 0; i < c.getAllergys().size(); i++) {
			s += c.getAllergys().get(i)+" ";
		}
		c.setAllergy(s);
		session.update(url+"update",c);
	}
	
	public void updateCode(Customer c) {
		String code = "";
		for (int i = 0; i < c.getFoodcodes().size(); i++) {
			code += c.getFoodcodes().get(i)+" ";
		}
		c.setFoodcode(code);
		session.update(url+"updateCode",c);
	}
	
	public void delete(Customer c) {
		session.delete(url+"delete",c);
	}
	
	
	
}
