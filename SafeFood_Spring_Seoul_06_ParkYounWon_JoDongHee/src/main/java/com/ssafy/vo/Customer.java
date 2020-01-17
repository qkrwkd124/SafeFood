package com.ssafy.vo;

import java.util.ArrayList;

public class Customer {
	
	/**회원 정보*/
	private String id;
	private String pass;
	private String name;
	private String address;
	private String phone;
	private String allergy;
	private String foodcode="";
	
	/**알러지 정보 저장하는 리스트*/
	ArrayList<String> allergys = new ArrayList();
	ArrayList<Integer> foodcodes = new ArrayList();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public ArrayList<String> getAllergys() {
		return allergys;
	}

	public void setAllergys(String data) {
		allergys.add(data);
	}
	
	
	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public ArrayList<Integer> getFoodcodes() {
		return foodcodes;
	}

	public void setFoodcodes(int data) {
		if(!foodcodes.contains(data))
			foodcodes.add(data);
	}
	
	
	public String getFoodcode() {
		return foodcode;
	}

	public void setFoodcode(String foodcode) {
		this.foodcode = foodcode;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", pass=" + pass + ", name=" + name + ", address=" + address + ", phone=" + phone
				+ ", allergy=" + allergy + "]";
	}

}
