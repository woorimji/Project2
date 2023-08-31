package com.itbank.libook.service.dao;

import java.util.ArrayList;
import java.util.List;

import com.itbank.libook.vo.CategoryVO;

public interface CategoryDAO {
	List<CategoryVO> getCategoryInfo();

	// 우림
	ArrayList<CategoryVO> findCategory();

	public int categoryInsert(CategoryVO vo);

	public int categoryChk(CategoryVO vo);
}
