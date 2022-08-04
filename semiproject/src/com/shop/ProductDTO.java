package com.shop;

public class ProductDTO {
	
	private int num;
	private String name;
	private int price;  
	private int category;
	private int brand;
	private int pro_size;
	private int color;
	private int tag;
	private String saveFileName;

	public int getColor() {
		return color;
	}
	public void setColor(int color) {
		this.color = color;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getBrand() {
		return brand;
	}
	public void setBrand(int brand) {
		this.brand = brand;
	}
	public int getPro_size() {
		return pro_size;
	}
	public void setPro_size(int pro_size) {
		this.pro_size = pro_size;
	}

	public int getTag() {
		return tag;
	}
	public void setTag(int tag) {
		this.tag = tag;
	}

	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

}
