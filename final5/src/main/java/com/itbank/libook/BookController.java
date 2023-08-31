package com.itbank.libook;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.libook.service.BookService;
import com.itbank.libook.vo.BookVO;

@Controller
public class BookController {

	@Resource(name="bookService")
	private BookService bookService;
	
	//상민
	@RequestMapping(value="/searchBookInfo.do")
	public String searchBookInfo(@ModelAttribute("bookVO")BookVO bookVO, Model model) throws Exception {
		ArrayList<BookVO>blist= bookService.searchBookInfo(bookVO);		
		model.addAttribute("blist", blist);
		return "/user/search/showSearchedBookForm";
	}
	
	@RequestMapping(value="/aBookInfo.do")
	public String aBookInfo(@ModelAttribute("bookVO")BookVO bookVO, Model model) throws Exception {
		ArrayList<BookVO>blist=bookService.aBookInfo(bookVO);
		model.addAttribute("blist",blist);
		return "/user/search/showABookForm";
	}
	

	@RequestMapping(value="/aBookInfo2.do" )
	public String aBookRedirect(@ModelAttribute("bookVO")BookVO bookVO,  Model model) throws Exception {
		ArrayList<BookVO>blist=bookService.aBookInfoRe(bookVO);
		model.addAttribute("blist",blist);
		return "/user/search/showABookForm";
	}
	 
	
	@RequestMapping(value="/searchBookCategory.do")
	public String searchBookCategory(@ModelAttribute("bookVO")BookVO bookVO, Model model) throws Exception {
		ArrayList<BookVO>blist=bookService.searchBookCategory(bookVO);
		model.addAttribute("blist",blist);
		return "/user/search/showSearchedBookForm";
	}
	
	
	
	
	

	//우림
	@RequestMapping(value = "/addBook.do", method = RequestMethod.GET)
	public String addBook() {
		return "admin/addBook"; // admin 폴더 아래에 있는 addBook.jsp로 이동
	}
	
	@RequestMapping(value = "/join.do")
	public String bookInsert(@RequestParam("img_file") MultipartFile bookImageFile, Model model,
			HttpServletRequest request, BookVO bookVO) {
		// 이미지 파일 업로드를 위한 처리 로직
		// 이미지를 복사할 폴더 경로 설정

		System.out.println(bookImageFile);
		
		  String uploadDirectory =
		  "C:\\Users\\innat\\Documents\\workspace-sts-3.9.18.RELEASE\\real_final_real\\src\\main\\webapp\\resources\\img\\book\\";
		  //"D:\\javaspring_workspace\\libooklaryProject\\src\\main\\webapp\\resources\\img\\book\\";
		  String fileName = bookImageFile.getOriginalFilename(); 
		  
		  Path filePath = Paths.get(uploadDirectory + fileName);
		  String fileNameWithoutExtension = fileName.substring(0, fileName.lastIndexOf('.'));
		  
		  // 이미지를 해당 폴더로 복사 
		  try { 
			  Files.write(filePath, bookImageFile.getBytes());
		  
			  System.out.println(bookImageFile.getBytes());
			  System.out.println(filePath);
			  System.out.println(uploadDirectory);
			  System.out.println(fileNameWithoutExtension);
		  // 서버에 저장된 파일의 경로를 book_img 속성에 설정 
		  bookVO.setBook_img(fileNameWithoutExtension);
		  
		  int result = bookService.bookInsert(bookVO);
		  
		  
		  if (result > 0) { model.addAttribute("result", "Success"); } else {
		  model.addAttribute("result", "Failed"); }
		  
		  } catch (Exception e) { // TODO Auto-generated catch block
		  e.printStackTrace(); }
		 
		return "admin/bookInsertResult";
	}
	

	@RequestMapping(value = "/isbnChk.do" , method = RequestMethod.POST)
	public void isbnChk(@ModelAttribute("bookVO") BookVO bookVO, HttpServletResponse response) throws Exception {

		System.out.println(bookVO.getBook_isbn());
		
		int result = bookService.isbnChk(bookVO);
		
		System.out.println(result);
		
		if (result > 0) {
			response.getWriter().write("fail");
		} else {
			response.getWriter().write("success");
		}
		

	}
	
	
	
	
	
	
	
	
	
	
	
	
	//진규
	@RequestMapping(value="/getbook.do")
	public String getAllBook(Model model) throws Exception{
		
		ArrayList<BookVO> alist=bookService.getAllInfo();
		model.addAttribute("alist",alist);
		return "admin/showallbook";
	}
	
	@RequestMapping(value="/getBookInfo.do")
	public String findOneBook(@ModelAttribute("bookVO")BookVO bookvo,  Model model) throws Exception {
		System.out.println("뭘 받았는지:"+bookvo);
		ArrayList<BookVO> blist=this.bookService.getOneBook(bookvo);
		if(blist.size()!=0) {
			model.addAttribute("a", blist.get(0).getBook_isbn());
			model.addAttribute("b",  blist.get(0).getBook_name());
			model.addAttribute("c",  blist.get(0).getBook_writer());
			model.addAttribute("d",  blist.get(0).getBook_price());
			model.addAttribute("e",  blist.get(0).getBook_qry());
		}
		return "admin/showonebook";
	}
	
	@RequestMapping(value="/updatebook.do")
	public String updateBookInfo(@ModelAttribute("bookVO")BookVO bookvo,  Model model) throws Exception {
		bookService.updateBookQry(bookvo);
		ArrayList<BookVO> blist=this.bookService.getOneBook(bookvo);
		
		System.out.println("updatebook: "+blist.get(0).getBook_name());
		String f=blist.get(0).getBook_name();
		model.addAttribute("a", blist.get(0).getBook_isbn());
		model.addAttribute("b",  blist.get(0).getBook_name());
		model.addAttribute("c",  blist.get(0).getBook_writer());
		model.addAttribute("d",  blist.get(0).getBook_price());
		model.addAttribute("e",  blist.get(0).getBook_qry());
		return "forward:/getBookInfo.do?book_name="+f;
	}
	
	@RequestMapping(value="/orderbynumdesc.do")
	public String orderByNumdesc(Model model) throws Exception {
		
		//System.out.println(a);
		ArrayList<BookVO> alist=bookService.orderbynumdesc();
		model.addAttribute("alist",alist);
		return "admin/showallbook";
		
	}
	
	@RequestMapping(value="/orderbynumasc.do")
	public String orderByNumasc(Model model) throws Exception {
		
		//System.out.println(a);
		ArrayList<BookVO> alist=bookService.orderbynumasc();
		model.addAttribute("alist",alist);
		return "admin/showallbook";
		
	}
	
	@RequestMapping(value="/orderbypricedesc.do")
	public String orderByPricedesc(Model model) {
		ArrayList<BookVO> alist=bookService.orderbypricedesc();
		model.addAttribute("alist",alist);
		return "admin/showallbook";
	}
	
	@RequestMapping(value="/orederbypriceacs.do")
	public String orderByPriceasc(Model model) {
		ArrayList<BookVO> alist=bookService.orderbypriceasc();
		model.addAttribute("alist",alist);
		return "admin/showallbook";
	}
	
	@RequestMapping(value="/orderbynamedesc.do")
	public String orderByNamedesc(Model model) {
		ArrayList<BookVO> alist=bookService.orderbynamedesc();
		model.addAttribute("alist",alist);
		return "admin/showallbook";
	}
	
	@RequestMapping(value="/orderbynameasc.do")
	public String orderByNameasc(Model model) {
		ArrayList<BookVO> alist=bookService.orderbynameasc();
		model.addAttribute("alist",alist);
		return "admin/showallbook";
	}
	
	@RequestMapping(value="/testsc.do" ,method=RequestMethod.POST) 
    public String scbarcheck
    (@Param("sc1") int sc1 ,@Param("sc2") int sc2, Model model) {
       System.out.println(sc1); System.out.println(sc2);
        
      ArrayList<BookVO> alist = bookService.getbetweenprice(sc1, sc2);
      model.addAttribute("alist",alist); 
      return "admin/showallbook";
        }
	
	@RequestMapping(value="/searchbook.do")
	public String searchbookname(@ModelAttribute("bookVO")BookVO bookVO, Model model) {
		
		ArrayList<BookVO> alist=bookService.getsearchedbook(bookVO);
		model.addAttribute("alist", alist);
		return "admin/showallbook";
	} 

	@RequestMapping(value="/searchwriter.do")
	public String searchbookwriter(@ModelAttribute("bookVO")BookVO bookVO, Model model) {
		
		ArrayList<BookVO> alist=bookService.getsearchedwriter(bookVO);
		model.addAttribute("alist", alist);
		return "admin/showallbook";
	} 
	@RequestMapping(value="/goshowallbook.do")
	public String mainreset(){
		return "forward:/getbook.do";
	}
	
	
}
