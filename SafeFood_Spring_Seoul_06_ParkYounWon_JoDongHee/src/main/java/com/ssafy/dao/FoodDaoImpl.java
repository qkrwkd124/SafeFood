package com.ssafy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.ssafy.util.FoodSaxParser;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

@Repository
public class FoodDaoImpl implements FoodDao{
	private List<Food> foods = new LinkedList<Food>();
	public List<Food> getFoods() {
		return foods;
	}
	private Connection conn; // 데이터베이스와 통신하기위한 객체
	
	@PostConstruct
	public void init() {
		foods = new ArrayList<Food>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

			String dbName = "yddb";
			String url = "jdbc:mysql://127.0.0.1/" + dbName + "?characterEncoding=UTF-8&serverTimezone=UTC";
			String user = "root";
			String pass = "tiger";
			conn = DriverManager.getConnection(url, user, pass);
			System.out.println(!conn.isClosed());
		} catch (Exception e) {
			e.printStackTrace();
			// System.out.println("연결 실패!");
			// new BookDAO();
		}

		loadData();
	}
	/**
	 * 식품 영양학 정보와 식품 정보를  xml 파일에서 읽어온다.
	 */
	public void loadData() {
		System.out.println("?핳");
		FoodSaxParser parser = new FoodSaxParser();	
		foods = parser.getFoods(); //  FoodNutritionSaxPaser를 이용하여 Food 데이터들을 가져온다
		addFoodsDB();
		getFoodsDB();
	}
	
	/**
	 * DB의 데이터를 foods에 넣어주기
	 */
	public void getFoodsDB() {
		String sql = "select * from food;";
		PreparedStatement pstmt = null;
		foods.clear();
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Food t = new Food();
				t.setCode(rs.getInt("code"));
				t.setName(rs.getString("name"));
				t.setSupportpereat(rs.getDouble("supportpereat"));
				t.setCalory(rs.getDouble("calory"));
				t.setCarbo(rs.getDouble("carbo"));
				t.setProtein(rs.getDouble("protein"));
				t.setFat(rs.getDouble("fat"));
				t.setSugar(rs.getDouble("sugar"));
				t.setNatrium(rs.getDouble("natrium"));
				t.setChole(rs.getDouble("chole"));
				t.setFattyacid(rs.getDouble("fattyacid"));
				t.setTransfat(rs.getDouble("transfat"));
				t.setMaker(rs.getString("maker"));
				t.setMaterial(rs.getString("material"));
				t.setImg(rs.getString("img"));
				t.setAllergy(rs.getString("allergy"));
				foods.add(t);
			}
		}catch (Exception e) {}
		finally{
			try {
				if(pstmt!=null)
					pstmt.close();
			} catch (Exception e) {
			}
		}
	}
	
	/**
	 * foods 의 데이터를 DB에 집어넣기
	 */
	public void addFoodsDB() {
		String sql = "INSERT INTO food VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(foods.size());
			for(Food t: foods) {
				pstmt.setInt(1, t.getCode());
				pstmt.setString(2, t.getName());
				pstmt.setDouble(3, t.getSupportpereat());
				pstmt.setDouble(4, t.getCalory());
				pstmt.setDouble(5, t.getCarbo());
				pstmt.setDouble(6, t.getProtein());
				pstmt.setDouble(7, t.getFat());
				pstmt.setDouble(8, t.getSugar());
				pstmt.setDouble(9, t.getNatrium());
				pstmt.setDouble(10, t.getChole());
				pstmt.setDouble(11, t.getFattyacid());
				pstmt.setDouble(12, t.getTransfat());
				pstmt.setString(13, t.getMaker());
				pstmt.setString(14, t.getMaterial());
				pstmt.setString(15, t.getImg());
				pstmt.setString(16, t.getAllergy());
				// 쿼리 날리기
				pstmt.executeUpdate();
			}
		}catch (Exception e) {}
		finally{
			try {
				if(pstmt!=null)
					pstmt.close();
			} catch (Exception e) {
			}
		}
	}
	
	
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)의 개수를 반환. 
	 * web에서 구현할 내용. 
	 * web에서 페이징 처리시 필요 
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한  식품 개수
	 */
	public int foodCount(FoodPageBean  bean){
		return foods.size();
	}
	
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<Food> searchAll(FoodPageBean  bean){
		List<Food> finds = new LinkedList<Food>();
			if(bean !=null) {
			String key = bean.getKey();
			String word = bean.getWord();
			if(!key.equals("all") && word!=null && !word.trim().equals("")) {
				finds = new LinkedList<Food>();
				// 이름으로 검색
				if(key.equals("name")) {
					for (Food food : foods) {
						if(food.getName().contains(word)) {
							finds.add(food);
						}
					}
				}
				//제조사 검색  구현
				else if(key.equals("maker")) {
					for (Food food : foods) {
						if(food.getMaker().contains(word)) {
							finds.add(food);
						}
					}
				}				
				// 원재료 검색 구현
				else if(key.equals("material")) {
					for (Food food : foods) {
						if(food.getMaterial().contains(word)) {
							finds.add(food);
						}
					}
				}
			}else {
				finds = foods;
			}
		}else {
			finds = foods;
		}
		return finds;
	}
	
	/**
	 * 식품 코드에 해당하는 식품정보를 검색해서 반환. 
	 * @param code	검색할 식품 코드
	 * @return	식품 코드에 해당하는 식품 정보, 없으면 null이 리턴됨
	 */
	public Food search(int code) {
		// 코드에 맞는 식품 검색하여 리턴
		for (Food food : foods) {
			if(food.getCode() == code) {
				return food;
			}
		}
		return null;
	}

	/**
	 * 가장 많이 검색한 Food  정보 리턴하기 
	 * web에서 구현할 내용.  
	 * @return
	 */
	public List<Food> searchBest() {
		return null;
	}
	
	public List<Food> searchBestIndex() {
		return null;
	}
	
	public static void main(String[] args) {
		FoodDaoImpl dao = new FoodDaoImpl();
		dao.loadData();
		System.out.println(dao.search(1));
		System.out.println("===========================material로 검색=================================");
		print(dao.searchAll(new FoodPageBean("material", "감자전분", null, 0)));
		System.out.println("===========================maker로 검색=================================");
		print(dao.searchAll(new FoodPageBean("maker", "빙그레", null, 0)));
		System.out.println("===========================name으로 검색=================================");
		print(dao.searchAll(new FoodPageBean("name", "라면", null, 0)));
		System.out.println("============================================================");
		print(dao.searchAll(null));
		System.out.println("============================================================");
	}
	
	public static void print(List<Food> foods) {
		for (Food food : foods) {
			System.out.println(food);
		}
	}
}
