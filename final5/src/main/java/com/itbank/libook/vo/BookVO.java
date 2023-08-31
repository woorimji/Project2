package com.itbank.libook.vo;

import org.springframework.stereotype.Repository;

@Repository
public class BookVO {
	
	private String book_isbn;
	private String book_name;
	private String book_writer;
	private int book_price;
	private String book_pub; // 출판사
	private String book_sub; // 설명
	private String book_img;
	private String book_category;
	private int book_qry; // 책 수량
	private int book_point; // 적립 포인트
	
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public String getBook_pub() {
		return book_pub;
	}
	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}
	public String getBook_sub() {
		return book_sub;
	}
	public void setBook_sub(String book_sub) {
		this.book_sub = book_sub;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	public String getBook_category() {
		return book_category;
	}
	public void setBook_category(String book_category) {
		this.book_category = book_category;
	}
	public int getBook_qry() {
		return book_qry;
	}
	public void setBook_qry(int book_qry) {
		this.book_qry = book_qry;
	}
	public int getBook_point() {
		return book_point;
	}
	public void setBook_point(int book_point) {
		this.book_point = book_point;
	}
	
}
