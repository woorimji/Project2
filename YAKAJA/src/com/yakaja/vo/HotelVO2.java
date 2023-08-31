package com.yakaja.vo;

public class HotelVO2 {

	private String hotel_name;
	private String hotel_addr;
	private int room_aprice;
	private int room_bprice;
	private int room_cprice;
	private String ravg;
	
	public HotelVO2(String hotel_name, String hotel_addr, int room_aprice, int room_bprice, int room_cprice, String ravg) {
		
		this.hotel_name=hotel_name;
		this.hotel_addr=hotel_addr;
		this.room_aprice=room_aprice;
		this.room_bprice=room_bprice;
		this.room_cprice=room_cprice;
		this.ravg=ravg;
		
	}
	
	public String getRavg() {
		return ravg;
	}
	
	public void setRavg(String ravg) {
		this.ravg = ravg;
	}
	
	public HotelVO2() {}
	
	public String getHotel_name() {
		return hotel_name;
	}
	
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	
	public String getHotel_addr() {
		return hotel_addr;
	}
	
	public void setHotel_addr(String hotel_addr) {
		this.hotel_addr = hotel_addr;
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

}
