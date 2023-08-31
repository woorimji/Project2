package com.itbank.libook;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.libook.service.CategoryService;
import com.itbank.libook.vo.CategoryVO;

@Controller
public class CategoryController {

	@Resource(name = "categoryService")
	private CategoryService categoryService;
	
	//상민
	@ResponseBody
	@RequestMapping(value = "getCategoryInfo.do", produces = "application/json; charset=UTF8")
	public List<CategoryVO> getCategoryInfo(@RequestParam(value = "param") String param) throws Exception {
		
		List<CategoryVO> clist = categoryService.getCategoryInfo();
		
		return clist;
	}
	
	
	//우림
	@RequestMapping(value = "/categoryFind.do") // 전체보기
	public String findCategory(Model model) throws Exception {

		ArrayList<CategoryVO> alist = categoryService.findCategory();
		
		model.addAttribute("alist", alist); // "categories"라는 이름으로 카테고리 데이터를 모델에 추가합니다.
		
		return "admin/categoryFind"; // CategoryFind.jsp에서 전부 출력
	}
	
	
	@RequestMapping(value = "/addCategory.do", method = RequestMethod.GET)
	public String AddCategoryForm() {
		
		return "admin/addCategory"; // admin 폴더 아래에 있는 addCategory.jsp로 이동
	}
	
	
	@RequestMapping(value = "/addCategory.do", method = RequestMethod.POST)
	public String insertCategory(CategoryVO vo, Model model) {
		
		int flag = 0;
		
		try {
			flag =categoryService.categoryInsert(vo);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		model.addAttribute("flag",flag);
		model.addAttribute("result", "success");
		
		return (flag!=0)?"redirect:index.do":"admin/addCategory"; // admin 폴더 아래에 있는 addCategory.jsp로 이동
	}
	
	
	@RequestMapping(value = "/categoryChk.do", method = RequestMethod.POST)
	public void categoryChk(@ModelAttribute("categoryVO") CategoryVO categoryVO, HttpServletResponse response){

		System.out.println(categoryVO.getCategory_name());

		int result;
		
		try {
			result = categoryService.categoryChk(categoryVO);
		System.out.println(result);

		if (result > 0) {
			response.getWriter().write("fail");
		} else {
			response.getWriter().write("success");
		}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
}
