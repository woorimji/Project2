package com.itbank.libook;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.libook.service.BoardService;
import com.itbank.libook.vo.BoardVO;
import com.itbank.libook.vo.MemberVO;
import com.itbank.libook.vo.PagingVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="/listBoard.do", method=RequestMethod.GET)
	public String listBoard(HttpServletRequest request, PagingVO pagingVO, Model model) {
		
		int total_count = boardService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		if(total_count == 0)
			total_count = 1;
		
		pagingVO.setPageNo(page); // 
		pagingVO.setPageSize(10); // 한 페이지의 게시글 수
		pagingVO.setTotalCount(total_count);
		
		page = (page - 1) * 10 + 1; // select 하는 기준
		int page2 = page + 9;
		
		ArrayList<BoardVO> listBoard = boardService.getList(page, page2);
		
		// ArrayList<BoardVO> listBoard = boardService.listBoard();
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("pagingVO", pagingVO);
		return "board/listBoard";
	}
	
	@RequestMapping(value="/writeBoard.do", method=RequestMethod.GET)
	public String writeBoard(HttpServletRequest req, @RequestParam Map<String, String> map) {
		
		
		
		if(map.size() == 1) {
			
			HttpSession session = req.getSession();
			MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
			
			req.setAttribute("board_number", "0");
			req.setAttribute("board_step", "0");
			req.setAttribute("board_level", "0");
			req.setAttribute("board_parent", memberVO.getMember_id());
		} else {
			req.setAttribute("board_number", map.get("board_number"));
			req.setAttribute("board_step", map.get("board_step"));
			req.setAttribute("board_level", map.get("board_level"));
			req.setAttribute("board_parent", map.get("board_parent"));
		}
		
		return "board/writeBoard";
	}
	
	@RequestMapping(value="/writeBoard.do", method=RequestMethod.POST)
	public String writeBoard_ok(HttpServletRequest request, @ModelAttribute BoardVO boardVO) {
		
		boardService.countStep(boardVO);
		int res = boardService.insertBoard(boardVO);
		
		if(res > 0) {
			request.setAttribute("msg", "게시글 등록 성공!");
			request.setAttribute("url", "listBoard.do");
		} else {
			request.setAttribute("msg", "게시글 등록 실패!");
			request.setAttribute("url", "writeBoard.do");
		}
		
		return "message";
	}
	
	
	@RequestMapping(value="/contentBoard.do", method=RequestMethod.GET)
	public String contentBoard(Model model, @ModelAttribute("boardVO") BoardVO boardVO) {
		
		// 조회수 증가
		boardService.plusCount(boardVO);
		
		BoardVO boardVO2 = boardService.getBoard(boardVO);
		model.addAttribute("boardVO", boardVO2);
		
		return "board/content";
	}
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
	public String updateBoard(Model model, @ModelAttribute("boardVO") BoardVO boardVO) {
		
		BoardVO boardVO2 = boardService.getBoard(boardVO);
		
		model.addAttribute("boardVO", boardVO2);
		return "board/updateBoard";
	}
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.POST)
	public String updateBoard_ok(HttpServletRequest request, @ModelAttribute("boardVO") BoardVO boardVO) {
		
		int res = boardService.updateBoard(boardVO);
		
		if(res > 0) {
			request.setAttribute("msg", "게시글 수정 성공!");
			request.setAttribute("url", "listBoard.do");
		} else {
			request.setAttribute("msg", "게시글 수정 실패!");
			request.setAttribute("url", "updateBoard.do?board_number=" + boardVO.getBoard_number());
		}
		return "message";
	}
	
	@RequestMapping(value="/deleteBoard.do", method=RequestMethod.GET)
	public String deleteBoard(@ModelAttribute("boardVO") BoardVO boardVO, Model model) {
		
		model.addAttribute("boardVO", boardVO);
		return "board/deleteBoard";
	}
	
	@RequestMapping(value="/deleteBoard.do", method=RequestMethod.POST)
	public String deleteBoard_ok(HttpServletRequest request, @ModelAttribute("boardVO") BoardVO boardVO, @ModelAttribute("memberVO") MemberVO memberVO) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO2 = (MemberVO)session.getAttribute("memberVO");
		
		int res = -1;
		
		
		if(memberVO.getMember_pw().equals(memberVO2.getMember_pw())) {
			res = boardService.deleteBoard(boardVO);
		}
		
		if(res > 0) {
			request.setAttribute("msg", "게시글 삭제 성공!");
			request.setAttribute("url", "listBoard.do");
		} else if(res == 0) {
			request.setAttribute("msg", "게시글 삭제 실패!");
			request.setAttribute("url", "contentBoard.do?board_number=" + boardVO.getBoard_number());
		} else {
			request.setAttribute("msg", "비밀번호가 틀렸습니다!");
			request.setAttribute("url", "deleteBoard.do?board_number=" + boardVO.getBoard_number());
		}
		
		return "message";
	}
	
}