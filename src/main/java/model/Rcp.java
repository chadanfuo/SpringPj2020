package model;

import java.io.Serializable;
import java.util.Date;

public class Rcp implements Serializable {
	// rcp table
	private int rcpnum; // rcpNum int primary key,
	private String title; // title varchar(20),	
	private String subtitle; // subtitle varchar(30),
	private String cookingtime; // cookingTime varchar(30),
	private String foodname; // foodName varchar(30),
	private int memnum; // memNum int,
	private Date reg_date; // reg_date date,
	private String thumbnail; // thumbNail varchar(30),
	private String hashtag; // HashTag varchar(1000)
	private String category;
	
	private String profile;
		
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Rcp() {}

	public int getRcpnum() {
		return rcpnum;
	}

	public void setRcpnum(int rcpnum) {
		this.rcpnum = rcpnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getCookingtime() {
		return cookingtime;
	}

	public void setCookingtime(String cookingtime) {
		this.cookingtime = cookingtime;
	}

	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}

	public int getMemnum() {
		return memnum;
	}

	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}