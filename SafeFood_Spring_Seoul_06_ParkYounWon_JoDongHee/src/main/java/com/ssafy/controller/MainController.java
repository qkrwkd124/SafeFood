package com.ssafy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller		// 앞에 @Controller 붙인 클래스는 디스페처가 받은 요청을 처리할 페이지를 결정해주는 클래스
public class MainController {
	@Autowired
	private DDController controller;
	// 서버가 구현해야될 요청
	// list.do		상품 전체목록을 보여달라는 요청
	// addForm.do	상품을 등록할 페이지 요청
	// add.do		상품을 추가해달라는 요청
	
	@RequestMapping("list.dd") // 매핑하는 방법도 여러가지가 있지만 쉬운방법 1가지로 통일함
	public String main() {
		return "jsp/index";
	}
	
	
	@RequestMapping("main.dd") // 매핑하는 방법도 여러가지가 있지만 쉬운방법 1가지로 통일함
	public String list(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("하이루");
		controller.goMain(req,res);
		return "jsp/index";
	}
	
	@RequestMapping("index2.dd")
	public String index2() {
		return "jsp/index2";
	}
	
	@RequestMapping("chugaMoum.dd")
	public String chugaMoum() {
		System.out.println("추가모음~~");
		return "jsp/chugaMoum";
	}
	
	
	@RequestMapping("detail.dd")
	public String detail(HttpServletRequest req, HttpServletResponse res) {
		controller.goDetail(req,res);
		return "jsp/detail";
	}
	
	@RequestMapping("signup.dd")
	public void signup(HttpServletRequest req, HttpServletResponse res) {
		controller.goSignUp(req,res);
	}
	
	@RequestMapping("login.dd")
	public void login(HttpServletRequest req, HttpServletResponse res) {
		controller.goLogin(req,res);
	}
	
	@RequestMapping("logout.dd")
	public String logout(HttpServletRequest req, HttpServletResponse res) {
		controller.goLogOut(req,res);
		return "jsp/index";
	}
	@RequestMapping("signup2.dd")
	public String signup2(HttpServletRequest req, HttpServletResponse res) {
		return "jsp/signup2";
	}
	
	@RequestMapping("update.dd")
	public void update(HttpServletRequest req, HttpServletResponse res) {
		controller.goUpdate(req,res);
	}
	
	@RequestMapping("search.dd")
	public String search(HttpServletRequest req, HttpServletResponse res) {
		controller.goSearch(req,res);
		return "jsp/index";
	}
	
	@RequestMapping("goodbye.dd")
	public String goodbye(HttpServletRequest req, HttpServletResponse res) {
		controller.goGoodBye(req,res);
		return "jsp/index";
	}
	
	@RequestMapping("chuga.dd")
	public String chuga(HttpServletRequest req, HttpServletResponse res) {
		controller.gochuga(req,res);
		return "jsp/index";
	}
	@RequestMapping("chugaDelete.dd")
	public String chugaDelete(HttpServletRequest req, HttpServletResponse res) {
		controller.gochugaDelete(req,res);
		return "jsp/chugaMoum";
	} 
	
	@RequestMapping("qna.dd")
	public String qna(HttpServletRequest req, HttpServletResponse res) {
		return "jsp/qna";
	}
	
	@RequestMapping("addnaver.dd")
	public String addnaver(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("addNaver.dd");
		return "jsp/addNaver";
	}
	
	@RequestMapping("naverdetail.dd")
	public String godetail(HttpServletRequest req, HttpServletResponse res,int num,String writer,HttpSession session) {
		req.setAttribute("detailNum", num);
		session.setAttribute("writerNum", num);
		session.setAttribute("writer", writer); // 클릭한 글의 작성자
		return "jsp/naverDetail";
	}
	
	@RequestMapping("Ndelete.dd")
	public String godelete(HttpServletRequest req, HttpServletResponse res,HttpSession session) {
		int num = (Integer)session.getAttribute("writerNum");
		return "jsp/qna";
	}
	
	@RequestMapping("updateNaver.dd")
	public String goUpdate(HttpServletRequest req, HttpServletResponse res,HttpSession session) {
		return "jsp/updateNaver";
	}
	
	@RequestMapping("bestfood.dd")
	public String gobestfood(HttpServletRequest req, HttpServletResponse res) {
		return "jsp/bestfood";
	}
	
	@RequestMapping("gongji.dd")
	public String gongji(HttpServletRequest req, HttpServletResponse res) {
		return "jsp/gongji";
	}
	
	@RequestMapping("addgongji.dd")
	public String addgongji(HttpServletRequest req, HttpServletResponse res) {
		return "jsp/addGongji";
	}
	
	@RequestMapping("gongjidetail.dd")
	public String godetail2(HttpServletRequest req, HttpServletResponse res,int num,String writer,HttpSession session) {
		req.setAttribute("detailNum", num);
		session.setAttribute("writerNum", num);
		session.setAttribute("writer", writer); // 클릭한 글의 작성자
		return "jsp/gongjiDetail";
	}
	
	@RequestMapping("updateGongji.dd")
	public String goUpdate2(HttpServletRequest req, HttpServletResponse res,HttpSession session) {
		return "jsp/updateGongji";
	}
	
	@RequestMapping("predict.dd")
	public String predict(HttpServletRequest req, HttpServletResponse res,HttpSession session) {
		return "jsp/predictFood";
	}
	@RequestMapping("anim.dd")
	public String anim(HttpServletRequest req, HttpServletResponse res,HttpSession session) {
		return "jsp/anim";
	}
}
