package com.itbank.libook;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.libook.service.BasketService;
import com.itbank.libook.vo.BasketVO;
import com.itbank.libook.vo.CategoryVO;

@Controller
public class BasketController {

	@Resource(name = "basketService")
	private BasketService basketService;
	
	//1
	@RequestMapping(value = "/addBasket.do")
	public String addBasket(@ModelAttribute("basketVO") BasketVO basketVO, Model model,
			@RequestParam("member_num")String member_num) throws Exception {
		System.out.println(member_num+"+1");
		basketService.addBasket(basketVO);
		return "redirect:/goBasket.do?member_num="+member_num;
	}
	//1
	@RequestMapping(value = "/goBasket.do")
	public String goBasket(@ModelAttribute("basketVO") BasketVO basketVO, Model model,
			@RequestParam("member_num")String member_num) throws Exception {
		System.out.println(member_num+"+2");
		ArrayList<BasketVO> baslist = basketService.goBasket(basketVO);
		model.addAttribute("baslist", baslist);
		return "/user/pay/showBasketForm";
	}
	//1
	@RequestMapping(value = "/clearBasket.do")
	public String clearBasket(@RequestParam("member_num") String member_num,
			@ModelAttribute("basketVO") BasketVO basketVO) throws Exception {
		basketService.clearBasket(basketVO);
		return "redirect:/goBasket.do?member_num="+member_num;
	}

	@ResponseBody
	@RequestMapping(value = "/addBasketQry.do", produces = "application/json; charset=UTF8")
	public ArrayList<BasketVO> addBasketQry(@RequestParam("book_isbn") String book_isbn,

			@RequestParam("member_num") String member_num,

			@ModelAttribute("basketVO") BasketVO basketVO, Model model) throws Exception {

		System.out.println(member_num);
		System.out.println(book_isbn);
		basketService.addBasketQry(basketVO);
		ArrayList<BasketVO> baslist = basketService.goBasket(basketVO);
		model.addAttribute("baslist", baslist);
		return baslist;
	}

	@ResponseBody
	@RequestMapping(value = "/subsBasketQry.do", produces = "application/json; charset=UTF8")
	public ArrayList<BasketVO> subsBasketQry(@RequestParam("book_isbn") String book_isbn,
			@RequestParam("member_num") String member_num, @ModelAttribute("basketVO") BasketVO basketVO, Model model)
			throws Exception {
		System.out.println(member_num);
		System.out.println(book_isbn);
		basketService.subsBasketQry(basketVO);
		ArrayList<BasketVO> baslist = basketService.goBasket(basketVO);
		model.addAttribute("baslist", baslist);
		return baslist;
	}
	
	@ResponseBody
	@RequestMapping(value="/delBasketQry.do", produces="application/json; charset=UTF8")
	public ArrayList<BasketVO>delBasketQry(@RequestParam("book_isbn")String book_isbn,
			@RequestParam("member_num")String member_num,
			@ModelAttribute("basketVO")BasketVO basketVO, Model model)throws Exception{
		System.out.println(member_num);
		System.out.println(book_isbn);
		basketService.delBasketQry(basketVO);
		ArrayList<BasketVO>baslist=basketService.goBasket(basketVO);
		model.addAttribute("baslist",baslist);
		return baslist;
	}
	//
	@ResponseBody
	@RequestMapping(value="/delSelectedRows.do", produces="application/json; charset=UTF8")
	public ArrayList<BasketVO> delSelectedRows(@RequestBody List<BasketVO> selectedRows, Model model){
		System.out.println(selectedRows);
		try {
			for(BasketVO row:selectedRows) {
				String member_num=row.getMember_num();
				String book_isbn=row.getBook_isbn();
				System.out.println(member_num);
				System.out.println(book_isbn);
				basketService.delSelectedRows(member_num,book_isbn);
			}
			
			ArrayList<BasketVO>baslist=basketService.goBasket(new BasketVO());
			model.addAttribute("baslist",baslist);
			return baslist;
		}catch(Exception e) {
			e.printStackTrace();
			return new ArrayList<BasketVO>();
		}
		
	}
		
	

	@ResponseBody
	@RequestMapping(value = "/getBasketCounted.do", produces = "application/json; charset=UTF8")
	public ArrayList<BasketVO> getBasketCounted(@ModelAttribute("basketVO") BasketVO basketVO, Model model,
			@RequestParam("member_num")String member_num)
			throws Exception {
		ArrayList<BasketVO> baslist = basketService.getAllBasket(basketVO);
		model.addAttribute("baslist", baslist);
		return baslist;
	}
	
	
	@RequestMapping(value="/goPaymentDirect.do")
	public String goPaymentDirect(@ModelAttribute("basketVO") BasketVO basketVO, Model model,
			@RequestParam("member_num")String member_num) throws Exception {
		System.out.println(member_num+"+2");
		basketService.addBasket(basketVO);
		return "redirect:/goPayment.do?member_num="+member_num;
	}
	
	@RequestMapping(value="/goPayment.do" , produces = "application/json; charset=UTF8")
	public String goPayment(@ModelAttribute("basketVO")BasketVO basketVO, Model model,
			@RequestParam("member_num")String member_num) throws Exception {
		
		
		ArrayList<BasketVO> listBasket = basketService.getAllBasket(basketVO);
		model.addAttribute("listBasket",listBasket);
		
		return "/user/pay/showPaymentForm";
	}
}
