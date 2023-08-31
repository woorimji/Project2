package com.yakaja.vo;

public class ReservVO {
	
	private int reserv_id;
	private int room_num;
	private int hotel_id;
	private int room_price;
	private String reserv_in;
	private String reserv_out;
	private String mem_id;
	
	public ReservVO() {

	}

	public int getReserv_id() {
		return reserv_id;
	}

	public void setReserv_id(int reserv_id) {
		this.reserv_id = reserv_id;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getHotel_id() {
		return hotel_id;
	}

	public void setHotel_id(int hotel_id) {
		this.hotel_id = hotel_id;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public String getReserv_in() {
		return reserv_in;
	}

	public void setReserv_in(String reserv_in) {
		this.reserv_in = reserv_in;
	}

	public String getReserv_out() {
		return reserv_out;
	}

	public void setReserv_out(String reserv_out) {
		this.reserv_out = reserv_out;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public ReservVO(int reserv_id, int room_num, int hotel_id, int room_price, String reserv_in, String reserv_out, String mem_id) {
		super();
		this.reserv_id = reserv_id;
		this.room_num = room_num;
		this.hotel_id = hotel_id;
		this.room_price = room_price;
		this.reserv_in = reserv_in;
		this.reserv_out = reserv_out;
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		
		return "ReservVO [reserv_id=" + reserv_id + ", room_num=" + room_num + ", hotel_id=" + hotel_id + ", room_price=" + room_price
				+ ", reserv_in=" + reserv_in + ", reserv_out=" + reserv_out + ", mem_id=" + mem_id + "]";
		
	}
}



