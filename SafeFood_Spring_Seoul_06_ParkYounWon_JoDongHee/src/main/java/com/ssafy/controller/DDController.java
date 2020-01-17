package com.ssafy.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.ssafy.dao.CustomerDAO;
import com.ssafy.dao.FoodDao;
import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.vo.Customer;
import com.ssafy.vo.FoodPageBean;

@Service
public class DDController {
	@Autowired
	FoodDao foodDao;
	@Autowired
	CustomerDAO customerDAO;
	HashMap<String, Customer> hm = new HashMap<>();

	public void goMain(HttpServletRequest req, HttpServletResponse res) {
		try {
			HttpSession session = req.getSession();
			session.setAttribute("foods", foodDao.getFoods());
			if (session.getAttribute("login") == null) {
				session.setAttribute("login", "");
			}
			if (session.getAttribute("signUpFail") == null) {
				session.setAttribute("signUpFail", "");
			}
			if(session.getAttribute("signUpDateFail")==null) {
				session.setAttribute("signUpDateFail", "");
			}
		} catch (Exception e) {
		}
	}

	public void goDetail(HttpServletRequest req, HttpServletResponse res) {
		try {
			HttpSession session = req.getSession();
			session.setAttribute("num", req.getParameter("num"));
			
//        	if(session.getAttribute("login").equals("yes")){	        
//        		String id = (String)session.getAttribute("id");
//        		Customer c = hm.get(id);
//        		session.setAttribute("c", c);
//        	}else{
//        		session.setAttribute("c", null);
//        	}
		} catch (Exception e) {
		}
	}

	public void goSignUp(HttpServletRequest req, HttpServletResponse res) {
		try {
			HttpSession session = req.getSession();
			String id = req.getParameter("user_id");
			String pass = req.getParameter("user_pass");
			String name = req.getParameter("user_name");

			// 필수 정보 체크
			if (id == null || pass == null || name == null || hm.containsKey(id)) {
				session.setAttribute("signUpFail", "yes");
				res.sendRedirect("main.dd");
			} else {
				String address = req.getParameter("user_address");
				String phone = req.getParameter("phone");
				String[] allergy = new String[8];
				for (int i = 1; i <= 8; i++) {
					allergy[i - 1] = req.getParameter("alergy" + i);
				}

				Customer c = new Customer();
				c.setId(id);
				c.setPass(pass);
				c.setName(name);
				if (address != null) {
					c.setAddress(address);
				}
				if(phone!=null) {
					c.setPhone(phone);
				}

				for (int i = 0; i < 8; i++) {
					if(allergy[i]!=null) {
						c.setAllergys(allergy[i]);
					}
				}
				
				customerDAO.insertCustomer(c);
				
//				hm.put(id, c);
				session.setAttribute("signUpFail", "no");
				res.sendRedirect("main.dd");
			}

			session.setAttribute("num", req.getParameter("num"));
		} catch (Exception e) {
		}

	}

	public void goLogin(HttpServletRequest req, HttpServletResponse res) {
		try {
			String id = req.getParameter("user_id");
			String pass = req.getParameter("user_pass");
			// 로그인 할 수 없을 때.
			HttpSession session = req.getSession();
			if(id.equals("") || pass.equals("") || !customerDAO.findID(id,pass)) {
				session.setAttribute("login", "no");
				res.sendRedirect("main.dd");
			} else {
				Customer c = customerDAO.One(id);
				session.setAttribute("c", c);
				session.setAttribute("login", "yes");
				res.sendRedirect("main.dd");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void goLogOut(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		session.setAttribute("login", "");
		session.setAttribute("signUpFail", "");
		session.setAttribute("c", null);
		goMain(req,res);
	}

	public void goUpdate(HttpServletRequest req, HttpServletResponse res) {
		try {
			HttpSession session = req.getSession();
			String id = req.getParameter("upuser_id");
			String pass = req.getParameter("upuser_pass");
			String name = req.getParameter("upuser_name");

			System.out.println(id+"   "+pass+"   "+name);
			// 필수 정보 체크
			if (id == null || pass == null || name == null || pass.equals("") || name.equals("")) {
				session.setAttribute("signUpDateFail", "yes");
				res.sendRedirect("main.dd");
			} else {
				String address = req.getParameter("upuser_address");
				String phone = req.getParameter("upphone");
				String[] allergy = new String[8];
				for (int i = 1; i <= 8; i++) {
					allergy[i - 1] = req.getParameter("upalergy" + i);
				}

//				hm.remove(id);
				Customer c = new Customer();
				c.setId(id);
				c.setPass(pass);
				c.setName(name);
				if (address != null) {
					c.setAddress(address);
				}
				if(phone!=null) {
					c.setPhone(phone);
				}
				for (int i = 0; i < 8; i++) {
					if(allergy[i]!=null) {
						c.setAllergys(allergy[i]);
					}
				}
				Customer cc = (Customer)session.getAttribute("c");
				String food = "";
				for(int t: cc.getFoodcodes()) {
					food += t+" ";
					c.setFoodcodes(t);
				}
				c.setFoodcode(food);
				customerDAO.update(c);
//				hm.put(id, c);
				session.setAttribute("c", c);
				session.setAttribute("signUpDateFail", "no");
				res.sendRedirect("main.dd");
			}

			session.setAttribute("num", req.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void goGoodBye(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		Customer c = (Customer)session.getAttribute("c");
		customerDAO.delete(c);
//		hm.remove(c.getId());
		goLogOut(req, res);
	}

	public void goSearch(HttpServletRequest req, HttpServletResponse res) {
		String target = req.getParameter("target");
		String word = req.getParameter("word");
		HttpSession session = req.getSession();
		FoodPageBean bean = null;
		switch (target) {
		case "재료":
			bean = new FoodPageBean("material", word, "", "");
			break;
		case "식품명":
			bean = new FoodPageBean("name", word, "", "");
			break;
		case "제조사":
			bean = new FoodPageBean("maker", word, "", "");
			break;
		}
		System.out.println(target+"   "+word);
		session.setAttribute("foods", foodDao.searchAll(bean));
	}

	public void gochuga(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String num = req.getParameter("code");
		if(num == null) {
			
		}else {
			Customer c = (Customer)session.getAttribute("c");
			c.setFoodcodes(Integer.parseInt(num));
			customerDAO.updateCode(c);
		}
	}

	public void gochugaDelete(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		Customer c = (Customer)session.getAttribute("c");
		int code = Integer.parseInt(req.getParameter("code"));
		
		for (int i = 0; i < c.getFoodcodes().size(); i++) {
			if(code == c.getFoodcodes().get(i)) {
				c.getFoodcodes().remove(i);
			}
		}
		customerDAO.updateCode(c);
		session.setAttribute("c", c);
	}
}
