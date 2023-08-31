package com.itbank.libook.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.libook.service.CategoryService;
import com.itbank.libook.service.dao.CategoryDAO;
import com.itbank.libook.vo.CategoryVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	public List<CategoryVO> getCategoryInfo() throws Exception {
		return categoryDAO.getCategoryInfo();
	}

	// 우림
	@Override
	public ArrayList<CategoryVO> findCategory() {
		return categoryDAO.findCategory();
	}

	@Override
	public int categoryInsert(CategoryVO vo) {

		System.out.println(vo.toString());
		int flag = categoryDAO.categoryInsert(vo);
		if (flag > 0) {
			return flag;
		} else {

			return 0;
		}

	}
	@Override
	public int categoryChk(CategoryVO vo) throws Exception {
		System.out.println(vo);
		int result = categoryDAO.categoryChk(vo);
		if (result > 0) {
			return result;
		} else {
			
			return 0; 
		}
	}

}
