package com.itbank.libook.vo;

public class BasketVO {
	
	private String member_num;
	private String book_isbn;
	private int basket_qry;
	private String member_id;
	private String member_name;
	private int counted;
	private String book_name;
	private int book_price;
	private int book_point;
	
	private int book_qry;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public int getBasket_qry() {
		return basket_qry;
	}
	public void setBasket_qry(int basket_qry) {
		this.basket_qry = basket_qry;
	}
	public String getMember_num() {
		return member_num;
	}
	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getCounted() {
		return counted;
	}
	public void setCounted(int counted) {
		this.counted = counted;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public int getBook_point() {
		return book_point;
	}
	public void setBook_point(int book_point) {
		this.book_point = book_point;
	}
	public int getBook_qry() {
		return book_qry;
	}
	public void setBook_qry(int book_qry) {
		this.book_qry = book_qry;
	}
	
}
