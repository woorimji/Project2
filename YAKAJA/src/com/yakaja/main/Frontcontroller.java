package com.yakaja.main;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.YakajaVO;
import com.haeva.my.HaevaHotelJoin;
import com.haeva.my.HaevaImpl;
import com.haeva.my.HaevaJoin;
import com.haeva.my.HaevaMyResDelete;
import com.haeva.my.HaevaMyinfo;
import com.haeva.my.HaevaMyresv;
import com.haeva.my.HaevafindID;
import com.haeva.my.Haevalogin;
import com.haeva.my.HaevafindPW;
import com.haeva.my.HaevaMyupdate;
import com.haeva.my.HaevaPaymentInsert;
import com.haeva.my.HaevaReviewWrite;
import com.haeva.my.HaevaMydelete;

@WebServlet("/Frontcontroller") /////////////////////////////////////
public class Frontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Frontcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  {
        try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        response.setCharacterEncoding("UTF-8");

        String c = request.getRequestURI().substring(request.getContextPath().length());
        String str = null;
        
        
        HaevaImpl scmd1 = null;

        System.out.println(c);
        
        switch (c) {
            case "/join.do":
                scmd1 = new HaevaJoin();
                try {
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str = "msg.jsp"; // 
                break;
            // Add cases for other URLs if needed
                
            case "/login_ok.do":
                scmd1 = new Haevalogin();
                
                request.setAttribute("action", "login");
                       
                try {
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str = "msg.jsp"; // 
                break;
                
            case "/logout.do":
                scmd1 = new Haevalogin();
                request.setAttribute("action", "logout");
                try {
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str = "msg.jsp";
                break;
                
            case "/myinfo.do":
                scmd1 = new HaevaMyinfo();
                request.setAttribute("action", "login");
                try {
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str = "myinfo.jsp";
                break;
                
            case "/resv.do":
                scmd1 = new HaevaMyresv();
                // request.setAttribute("action", "login");
                try {
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str = "resv.jsp";
                break;
                
            case "/update.do":
                scmd1 = new HaevaMyupdate();
                try {
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str = "msg.jsp";
                break;
                
                               
            case "/findid.do":
                scmd1 = new HaevafindID();
                try {
                	
                	System.out.println("find");
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                

               str = "msg.jsp";
               break;
               
            case "/findpw.do":
                scmd1 = new HaevafindPW();
                try {
                	
                	System.out.println("findpw");
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
               str = "msg.jsp";
               break;
               
    		case "/delete.do":
    			scmd1 = new HaevaMydelete();
    			request.setAttribute("action", "confirm");
    			try {
    				System.out.println("delete");
    				scmd1.haeva(request, response);
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
    			str = "msg.jsp";
    			break;
    			
    			
    		case "/deleteForm.do":

    	        String confirmMsg = "정말로 삭제하시겠습니까? (삭제 시 예약정보 및 내역은 일괄 삭제됩니다.)";
    	        request.setAttribute("msg", confirmMsg);		
    	        request.setAttribute("url", "Mydelete.jsp");

    			str = "msg.jsp";
    			break;
    			
    		case "/resvdelete.do":
                scmd1 = new HaevaMyResDelete();
                try {
                	
                	System.out.println("Resdelete");  
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                

               str = "msg.jsp";
               break;
               
       		// 결제 관련 case
    		case "/payment.do": // 결제 페이지로 이동.
    			str = "payment.jsp";
    			break;
    			
    		case "/payment_create.do": // 결제 진행(DB에 예약정보 입력)
    			scmd1 = new HaevaPaymentInsert();
    			try {
    				scmd1.haeva(request, response);
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    			return; // 서블릿의 실행 종료

    		case "/paymentComplete.do":
    			str = "paymentComplete.jsp";
    			break;
    			
    		case "/hoteljoin.do":
                scmd1 = new HaevaHotelJoin();
                try {
                	System.out.println("hoteljoin");
                    scmd1.haeva(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str = "msg.jsp"; // 
                break;
                
    		case "/makereview.do":
    			scmd1 = new HaevaReviewWrite();
    			try {
    				scmd1.haeva(request, response);
    			}catch(Exception e) {
    				e.printStackTrace();
    			}
    			str="index.jsp";
    			break;  			                
        }
        
        

        RequestDispatcher rd1 = request.getRequestDispatcher(str);
        try {
			rd1.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
			

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			                        throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}