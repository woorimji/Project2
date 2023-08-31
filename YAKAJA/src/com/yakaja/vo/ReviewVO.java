package com.yakaja.vo;

public class ReviewVO {
	
	public String hotel_id;
	public String hotel_name;
	public String mem_name;
	public String review_title;
	public String review_content;
	public String review_score;
	
	public ReviewVO (String hotel_id, String hotel_name, String review_title, String mem_name, String review_content, String review_score) {
		this.hotel_name=hotel_name;
		this.review_title=review_title;
		this.mem_name=mem_name;
		this.review_content=review_content;
		this.review_score=review_score;
		this.hotel_id=hotel_id;
	}
	
	public String getHotel_id() {
		return hotel_id;
	}
	
	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}
	
	public String getHotel_name() {
		return hotel_name;
	}
	
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	
	public String getMem_name() {
		return mem_name;
	}
	
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	public String getReview_title() {
		return review_title;
	}
	
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	
	public String getReview_content() {
		return review_content;
	}
	
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public String getReview_score() {
		return review_score;
	}
	
	public void setReview_score(String review_score) {
		this.review_score = review_score;
	}

}
