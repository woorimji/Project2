package com.itbank.libook.vo;

public class BoardVO {
	
	private int board_number;
	private String board_writer;
	private String board_subject; // 제목
	private String board_content; // 내용
	private String board_date; // 작성일자
	private String board_count; // 조회수
	private int board_step;
	private int board_level;
	
	private String board_parent;
	
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_count() {
		return board_count;
	}
	public void setBoard_count(String board_count) {
		this.board_count = board_count;
	}
	public int getBoard_step() {
		return board_step;
	}
	public void setBoard_step(int board_step) {
		this.board_step = board_step;
	}
	public int getBoard_level() {
		return board_level;
	}
	public void setBoard_level(int board_level) {
		this.board_level = board_level;
	}
	public String getBoard_parent() {
		return board_parent;
	}
	public void setBoard_parent(String board_parent) {
		this.board_parent = board_parent;
	}
	
}
