package model;

import java.io.Serializable;

public class Ingredient implements Serializable {
	private int rcpNum;
	private String ingredient;
	private String quantity;
	
	public Ingredient() {}

	public int getRcpNum() {
		return rcpNum;
	}

	public void setRcpNum(int rcpNum) {
		this.rcpNum = rcpNum;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	
}
