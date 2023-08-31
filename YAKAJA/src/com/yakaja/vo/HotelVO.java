package com.yakaja.vo;

public class HotelVO {
	
	public String hotel_id;
	public String hotel_name;
	public String hotel_address;
	public int hotel_wifi;
	public int hotel_pet;
	public int hotel_bf;
	public int hotel_rs;
	public int hotel_ciga;
	public int hotel_wc;
	public String review_title;
	public String review_content;
	public String review_score;
	public int room_aprice;
	public int room_bprice;
	public int room_cprice;
	public String mem_id;
	public String room_imsi;
	
	
	
	public HotelVO() {
		
	}

	public HotelVO(String hotel_name,String hotel_address, String room_imsi, int room_aprice, int room_bprice,
			int room_cprice, int hotel_wifi, int hotel_pet, int hotel_rs, int hotel_bf, int hotel_ciga, int hotel_wc,
			String review_title, String review_score, String review_content, String mem_id) {
		this.hotel_name = hotel_name;
		this.hotel_address = hotel_address;
		this.hotel_bf = hotel_bf;
		this.hotel_ciga = hotel_ciga;
		this.hotel_pet = hotel_pet;
		this.hotel_rs = hotel_rs;
		this.hotel_wifi = hotel_wifi;
		this.hotel_wc = hotel_wc;
		this.review_content = review_content;
		this.review_score = review_score;
		this.review_title = review_title;
		this.room_aprice = room_aprice;
		this.room_bprice = room_bprice;
		this.room_cprice = room_cprice;
		this.room_imsi = room_imsi;
		this.mem_id = mem_id;
	}
	

	public HotelVO(String hotel_name2, String hotel_address2, int room_aprice2, int room_bprice2, int room_cprice2,
			String review_score2) {
		this.hotel_name = hotel_name2;
		this.hotel_address = hotel_address2;
		this.room_aprice = room_aprice2;
		this.room_bprice = room_bprice2;
		this.room_cprice = room_cprice2;
		this.review_score = review_score2;
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
	public String getHotel_address() {
		return hotel_address;
	}
	public void setHotel_address(String hotel_address) {
		this.hotel_address = hotel_address;
	}
	public int getHotel_wifi() {
		return hotel_wifi;
	}
	public void setHotel_wifi(int hotel_wifi) {
		this.hotel_wifi = hotel_wifi;
	}
	public int getHotel_pet() {
		return hotel_pet;
	}
	public void setHotel_pet(int hotel_pet) {
		this.hotel_pet = hotel_pet;
	}
	public int getHotel_bf() {
		return hotel_bf;
	}
	public void setHotel_bf(int hotel_bf) {
		this.hotel_bf = hotel_bf;
	}
	public int getHotel_rs() {
		return hotel_rs;
	}
	public void setHotel_rs(int hotel_rs) {
		this.hotel_rs = hotel_rs;
	}
	public int getHotel_ciga() {
		return hotel_ciga;
	}
	public void setHotel_ciga(int hotel_ciga) {
		this.hotel_ciga = hotel_ciga;
	}
	public int getHotel_wc() {
		return hotel_wc;
	}
	public void setHotel_wc(int hotel_wc) {
		this.hotel_wc = hotel_wc;
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
	public int getRoom_aprice() {
		return room_aprice;
	}
	public void setRoom_aprice(int room_aprice) {
		this.room_aprice = room_aprice;
	}
	public int getRoom_bprice() {
		return room_bprice;
	}
	public void setRoom_bprice(int room_bprice) {
		this.room_bprice = room_bprice;
	}
	public int getRoom_cprice() {
		return room_cprice;
	}
	public void setRoom_cprice(int room_cprice) {
		this.room_cprice = room_cprice;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRoom_imsi() {
		return room_imsi;
	}
	public void setRoom_imsi(String room_imsi) {
		this.room_imsi = room_imsi;
	}
}
