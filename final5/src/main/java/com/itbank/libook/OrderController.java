package com.itbank.libook;

import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.libook.service.MemberService;
import com.itbank.libook.service.OrderService;
import com.itbank.libook.vo.BasketVO;
import com.itbank.libook.vo.BookVO;
import com.itbank.libook.vo.MemberVO;
import com.itbank.libook.vo.OrderVO;

import d.d.d.HomeController;

@Controller
public class OrderController {
	
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String KEY = "5885824611838735";
	public static final String SECRET = "Fi6gW5bCuNJXJdRXpUIDO3Ujj2FA8ueSYAS8VFnydGkXrbomqLARtqpdHmpeGQzYDTlN2K9CkyRgBFaq";
	private static final CloseableHttpClient httpClient = HttpClients.createDefault();
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Resource(name = "orderService")
	private OrderService orderService;
	

	// get 방식으로 결제창 이동 (즉시구매)
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String paymentGo(@ModelAttribute("bookVO") BookVO bookVO, Model model) {

		model.addAttribute("bookVO", bookVO);
		return "user/pay/showPaymentForm";
	}

	// post방식으로 이동
	@RequestMapping(value = "/payment2.do", method = RequestMethod.POST)
	public String paymentGo2(@ModelAttribute("bookVO") BookVO bookVO, Model model) {

		model.addAttribute("bookVO", bookVO);
		return "user/pay/showPaymentForm";
	}

	
	@RequestMapping(value="/payment_insert.do", method=RequestMethod.POST, consumes="application/json")
	   public void paymentInsert(@RequestBody HashMap<String, Object> data, HttpServletResponse response, HttpServletRequest request) throws IOException {   
	      
	      System.out.println("param : " + data);
	      
	       String member_num = (String) data.get("member_num");
	       String order_info = (String) data.get("order_info");
	       String order_type = "배송전"; // 배송현황을 "배송전"으로 초기화
	       int order_price = (int) data.get("order_price");
	       int order_point = (int) data.get("order_point"); // 누적 포인트 
	       // String book_isbn = (String) data.get("book_isbn");
	       // int book_qry = (int) data.get("book_qry");
	       // int saving_point = (int) data.get("saving_point");
	       String order_number = (String) data.get("order_number");
	       int used_point = (int) data.get("used_point"); // 사용포인트
	       
	       System.out.println("member_num : " + member_num);
	       System.out.println("order_number : " + order_number);
	       
	       // jsonData와 arr을 가져와서 필요한 데이터로 가공
	       HashMap<String, Integer> jsonData = (HashMap<String, Integer>) data.get("order_content");
	       HashMap<String, Integer> listBasket_map = (HashMap<String, Integer>) data.get("listBasket");
	       
	       // OrderVO 생성 및 데이터 설정   
	      OrderVO orderVO = new OrderVO();
	      orderVO.setMember_num(member_num);
	      orderVO.setOrder_info(order_info);
	      orderVO.setOrder_type(order_type);
	      orderVO.setOrder_price(order_price);
	      orderVO.setOrder_point(order_point);
	      orderVO.setOrder_number(order_number);
	      orderVO.setUsed_point(used_point);
	      orderVO.setConfirm_pay(0);
	      // jsonData를 OrderVO의 order_content에 추가
	      
	      String order_content = "";
	      
	      for(String bookName : jsonData.keySet()) {
	         order_content += bookName + " " + jsonData.get(bookName) + "권,";
	      }
	      
	      order_content = order_content.substring(0, order_content.length() - 1);
	      System.out.println(order_content);
	      orderVO.setOrder_content(order_content);
	      
	      // 1. 주문 테이블에 데이터 삽입
	      int result1 = orderService.insertOrder(orderVO);
	      
	      System.out.println("result1 : " + result1);
	      
	      // 2. book 테이블 재고 삭제
	      // 3. 해당 장바구니 데이터 삭제
	      
	      int result2 = 0;
	      int result3 = 0;
	      
	      ArrayList<BasketVO> listBasket = new ArrayList<BasketVO>();
	      
	      for(String book_isbn : listBasket_map.keySet()) {
	               
	         BasketVO basketVO = new BasketVO();
	         basketVO.setBook_isbn(book_isbn);
	         basketVO.setBasket_qry(listBasket_map.get(book_isbn));
	               
	         listBasket.add(basketVO);
	      }
	      
	      result2 = orderService.updateBookQrt(listBasket);   
	      result3 = orderService.deleteBasket(member_num);
	      
	      System.out.println("result2 : " + result2);
	      System.out.println("result3 : " + result3);
	      
	      // 4. member 포인트 조정(사용 포인트 만큼 차감)
	      
	      int result4 = orderService.updateMemberPoint(member_num, used_point);
	      
	      System.out.println("result4 : " + result4);
	      
	      HttpSession session = request.getSession(); 
	      MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	      memberVO.setMember_point(memberVO.getMember_point() - used_point);
	      session.setAttribute("memberVO", memberVO);
	      
	      
	      if(result1 > 0 && result2 > 0 && result4 > 0)
	         response.getWriter().write("{\"result\" : \"success\"}");
	      else
	         response.getWriter().write("{\"result\": \"fail\"}");
	      
	      // 5. imsi 테이블에 데이터 삽입
	      
	      orderService.insert_imsi(orderVO, listBasket);
	      
	      return;
	   }
	
	// ########################## 31일 추가 ##########################
	@RequestMapping(value="/confirm_pay.do", method=RequestMethod.POST, consumes="application/json")
	public void confirm_pay(@RequestBody HashMap<String, Object> data, HttpServletResponse response) throws IOException {
		
		String order_number = (String)data.get("order_number");
		String member_num = (String)data.get("member_num");
		int order_point = (int)data.get("order_point");
		
		OrderVO orderVO = new OrderVO();
		orderVO.setOrder_number(order_number);
		orderVO.setMember_num(member_num);
		orderVO.setOrder_point(order_point);
		
		System.out.println("confirm member_number : " + orderVO.getMember_num());
		System.out.println("confirm order_number : " + orderVO.getOrder_number());
		System.out.println("confirm order_point : " + orderVO.getOrder_point());
		
		int result = orderService.confirmPay(orderVO); // 구매확정 컬럼 0에서 1로 변경, 적립 포인트 누적 
		
		if(result == 1) {
			response.getWriter().write("{\"result\" : \"success\"}");
		} else {
			response.getWriter().write("{\"result\" : \"fail\"}");
		}
	}
	// ####################################################
	
	@RequestMapping(value="/qry_check.do", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public Map<String, Integer> qty_check(@RequestBody HashMap<String, String> data) {
		
		System.out.println("data : " + data);
		
		String book_isbn = (String)data.get("book_isbn"); 
		int max_qty = orderService.findMaxQty(book_isbn);
		
		System.out.println("max_qty : " + max_qty);
		
		Map<String, Integer> rp = new HashMap<String, Integer>();
		rp.put("max_qty", max_qty);
		
		return rp;
	}
	
	private List<NameValuePair> convertParameter(Map<String, String> m){
		List<NameValuePair> parameterList = new ArrayList<>();
		for(Map.Entry<String, String> entry : m.entrySet()) {
			parameterList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return parameterList;
	}
	
	// 아임포트 인증(토큰)을 받아주는 함수
	public String getImportToken() {
		String result = "";
		
		// CloseableHttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			
			try(CloseableHttpResponse res = httpClient.execute(post)){
				ObjectMapper mapper = new ObjectMapper();
				String body = EntityUtils.toString(res.getEntity());
				JsonNode rootNode = mapper.readTree(body);
				JsonNode resNode = rootNode.get("response");
				result = resNode.get("access_token").asText();
			}
		} catch(Exception e) {
			e.printStackTrace();
			log.error("An error occurred while getting the import token.", e);
		}
		
		// log.info("Token : " + result);
		System.out.println("Token : " + result);
		return result;
	}
	
	public int cancelPay(String token, String mid) {
		
		// CloseableHttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid);
		String asd = "";
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = httpClient.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty); asd = rootNode.get("response").asText();
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		if(asd.equals("null")) {
			System.err.println("환불 실패");
			return -1;
		} else {
			System.err.println("환불성공"); 
			return 1;
		}
		
		
	}
	
	@RequestMapping(value="/payment_cancel.do", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public void paymentCancel(@RequestBody HashMap<String, String> data, HttpServletResponse response) throws IOException {
		
		System.out.println("환불을 위한 data : " + data);
		
		String order_number = (String)data.get("order_number");
		
		System.out.println("환불 주문번호 : " + order_number);
		
		OrderVO orderVO = new OrderVO();
		orderVO.setOrder_number(order_number);
		
		String token = getImportToken();
		int result_delete = cancelPay(token, order_number);
		
		System.out.println("result_delete : " + result_delete);
		
		
		if(result_delete == -1) {
			response.getWriter().write("{\"result\" : \"fail\"}");
		} else {
			// 주문내역 삭제 메소드
			
			// 해당 주문 내역을 가져온다.
			orderService.plusQry(orderVO);
			// 주문 내역을 삭제한다.
			orderService.deleteOrder(orderVO);
			response.getWriter().write("{\"result\" : \"success\"}");
		}
		return;
	}
	
	// 우림
	// 내 배송정보
	@RequestMapping(value="/orderChk.do", method = RequestMethod.GET)
	public String orderList(@ModelAttribute("orderVO") OrderVO orderVO, Model model,
			@RequestParam("member_num") String member_num) throws Exception {

		ArrayList<OrderVO> orderList = orderService.orderList(orderVO);

		// 모델에 주문 목록을 담아 뷰 페이지로 전달합니다.
		model.addAttribute("orderList", orderList);

		// 결과를 보여줄 뷰 페이지의 이름을 반환합니다.
		return "user/pay/orderChk";
	}

	//
	// 주문 완료 처리
	
	@RequestMapping(value="/orderChk.do", method=RequestMethod.POST) 
	public String listOrder(Model model, HttpSession session) throws Exception { 
		// 주문을 처리하는 로직을 구현해야 합니다. (추가 정보와 함께 주문을 완료하는 로직)
		// 처리 결과를 모델에 담아 뷰 페이지로 전달합니다. // (여기서는 주문 완료 페이지로 이동하는 것을 가정하겠습니다.) 
		return "user/orderChk"; 
	}


	
	@RequestMapping(value="/everyOrder.do", method=RequestMethod.GET) 
	public String everyOrder(Model model) throws Exception {
		ArrayList<OrderVO> olist = orderService.everyOrder();
		model.addAttribute("olist", olist); 
		return "admin/everyOrder"; 
	}
	
	@RequestMapping(value="/everyOrder.do", method=RequestMethod.POST) 
	public String everyOrderAll(Model model) throws Exception {
		ArrayList<OrderVO> olist = orderService.everyOrder();
		model.addAttribute("olist", olist); 
		return "admin/everyOrder"; 
	}
	
	@RequestMapping(value="/orderChange.do", method=RequestMethod.POST)
	public String orderChange(@RequestParam("order_number") String order_number, @RequestParam("order_type") String order_type) throws Exception {
	    // 관리자가 선택한 주문의 배송현황을 수정하기 위해 OrderVO 객체를 생성하고 값을 설정
	    OrderVO orderVO = new OrderVO();
	    orderVO.setOrder_number(order_number);
	    orderVO.setOrder_type(order_type);

	    // 서비스를 통해 배송현황을 수정
	    orderService.orderChange(orderVO);

	    // 수정 완료 후 everyOrder.do로 리다이렉트
	    return "redirect:/everyOrder.do";
	}
    
    @RequestMapping(value="/orderChange.do", method=RequestMethod.GET)
    public String orderChangeForm(Model model) {
        // 여기서는 수정 폼을 보여주기 위해 별도의 작업이 필요하지 않을 수 있으므로 간단하게 리턴만 해줍니다.
        return "admin/everyOrder"; 
    }
}