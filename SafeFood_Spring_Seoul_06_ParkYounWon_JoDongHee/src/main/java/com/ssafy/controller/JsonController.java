package com.ssafy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dao.CommentDAO;
import com.ssafy.dao.NaverDaoImpl;
import com.ssafy.vo.Comment;
import com.ssafy.vo.Customer;
import com.ssafy.vo.Food;
import com.ssafy.vo.Naver;

@RestController
public class JsonController {
	
	@Autowired
	public NaverDaoImpl naverDao;
	
	@Autowired
	public CommentDAO commentDao;
	
	@RequestMapping("list.json")
	public List<Naver> selectAll(){
		return naverDao.selectAll();
	}
	
	@RequestMapping("add.json")
	public void insertN(@RequestBody Naver naver,HttpSession session) {
		System.out.println(naver.getDay());
		Customer c = (Customer)session.getAttribute("c");
		naver.setId(c.getId());
		naver.setWriter(c.getId());
		naverDao.insert(naver);
	}
	
	@RequestMapping("one.json")
	public Naver selectone(HttpSession session){
		return naverDao.selectOne((Integer)session.getAttribute("detailNum"));
	}
	
	@RequestMapping("delete.json")
	public void delete(@RequestBody Naver naver){
		naverDao.delete(naver.getNum());
		commentDao.deleteC(naver.getNum());
	}
	@RequestMapping("update.json")
	public void update(@RequestBody Naver naver ,HttpSession session){
		session.setAttribute("naverr",naver);
	}
	
	@RequestMapping("update2.json")
	public void update2(@RequestBody Naver naver){
		naverDao.update(naver);
	}
	@RequestMapping("best.json")
	public List<Food> selectBest(HttpSession session){
		System.out.println("컨트롤러 들어와따");
		List<Integer> best = naverDao.bestfood();
		List<Food> food =(List<Food>) session.getAttribute("foods");
		//bestfood()로 가져온 인트리스트와 세션에있는 foods 의 리스트에서 코드를 비교해서 맞는 정보를 새로운 푸드리스트로 저장해서 그 리스트를 리턴
		List<Food> bestfood = new ArrayList<Food>();
		for (int b : best) {
			for (Food f : food) {
				if(b == f.getCode()) { 
					bestfood.add(f);
					break;
				}
			}
		}
		return bestfood;
	}
	
	
	
	// Gongji
	@RequestMapping("listg.json")
	public List<Naver> selectAllG(){
		return naverDao.selectAllG();
	}
	
	@RequestMapping("addg.json")
	public void insertG(@RequestBody Naver naver,HttpSession session) {
		Customer c = (Customer)session.getAttribute("c");
		naver.setId(c.getId());
		naver.setWriter(c.getId());
		naverDao.insertG(naver);
	}
	
	@RequestMapping("oneg.json")
	public Naver selectoneg(HttpSession session){
		return naverDao.selectOneG((Integer)session.getAttribute("detailNum"));
	}
	
	@RequestMapping("deleteg.json")
	public void deleteg(@RequestBody Naver naver){
		naverDao.deleteG(naver.getNum());
	}
	@RequestMapping("updateg.json")
	public void updateg(@RequestBody Naver naver ,HttpSession session){
		session.setAttribute("naverrr",naver);
	}
	
	@RequestMapping("update2g.json")
	public void update2g(@RequestBody Naver naver){
		naverDao.updateG(naver);
	}
	
	//comment
	@RequestMapping("commentList.json")
	public List<Comment> selectAllC(){
		return commentDao.SelectAllC();
	}
	@RequestMapping("commentList2.json")
	public List<Integer> selectAllC2(){
		List<Comment> list = commentDao.SelectAllC();
		List<Integer> result = new ArrayList<>();
		for(Comment c : list) {
			result.add(c.getNum());
		}
		return result;
	}
	@RequestMapping("commentOne.json")
	public Comment selectOneC(@RequestBody int c_num){
		return commentDao.SelectOneC(c_num);
	}
	@RequestMapping("commentInsert.json")
	public void commentInsert(@RequestBody Comment comment){
		commentDao.insertC(comment);
	}
	@RequestMapping("commentUpdate.json")
	public void commentUpdate(@RequestBody Comment comment){
		commentDao.updateC(comment);
	}
	@RequestMapping("commentDelete.json")
	public void commentDelete(@RequestBody int c_num){
		commentDao.deleteC(c_num);;
	}
}
