package com.study.board.controller;

import com.study.board.entity.Board;
import com.study.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/board/write")
    public String boardWriteForm() {

        return "boardwrite";  // boardwrite.html 파일이 존재해야 함
    }

    @PostMapping("/board/writePro")
    public String boardWritePro(Board board) {

        boardService.write(board);

        return "";
    }
}
