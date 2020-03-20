package model;

import java.io.Serializable;

public class Follow implements Serializable {
	private int memNum;
	private int followNum;
	
	public Follow() {
		
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public int getFollowNum() {
		return followNum;
	}

	public void setFollowNum(int followNum) {
		this.followNum = followNum;
	}
	
}
