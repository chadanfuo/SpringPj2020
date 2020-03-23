package model;

import java.io.Serializable;
import java.util.Date;

import oracle.net.aso.q;

public class Rcp implements Serializable {
	// rcp table
	int rcpNum; // rcpNum int primary key,
	String title; // title varchar(20),
	String foodName; // foodName varchar(30),
	String subtitle; // subtitle varchar(30),
	String ingredient; // ingredient2 varchar(50),
	String quantity; //quantity varchar(500),
	String cookingTime; // cookingTime varchar(30),
	int memNum; // memNum int,
	Date reg_date; // reg_date date,
	String thumbNail; // thumbNail varchar(30),
	String hashTag; // HashTag varchar(1000)
	
	
	
	public Rcp() {}

	public String getQuantity() {
		if (quantity==null) 
			quantity="";
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public int getRcpNum() {
		return rcpNum;
	}

	public void setRcpNum(int rcpNum) {
		this.rcpNum = rcpNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getSubtitle() {
		if(subtitle == null) 
		subtitle = "";
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getCookingTime() {
		return cookingTime;
	}

	public void setCookingTime(String cookingTime) {
		this.cookingTime = cookingTime;
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getThumbNail() {
		return thumbNail;
	}

	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

}