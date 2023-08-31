package com.itbank.libook.service;

import java.util.ArrayList;
import java.util.List;

import com.itbank.libook.vo.CategoryVO;

public interface CategoryService {
	List<CategoryVO> getCategoryInfo() throws Exception;

	// 우림
	ArrayList<CategoryVO> findCategory() throws Exception;

	public int categoryInsert(CategoryVO vo) throws Exception;

	public int categoryChk(CategoryVO vo) throws Exception;
}
