package SupplementsWeb.com.controller;


import SupplementsWeb.com.biz.BoardBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BoardController {

    private final BoardBiz boardBiz;

    public BoardController(BoardBiz boardBiz) {
        this.boardBiz = boardBiz;
    }

    @GetMapping("/list")
    public String bbs(@PageableDefault Pageable pageable, Model model){
        model.addAttribute("boardList", boardBiz.findBoardList(pageable));
        return "/list";
    }

    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String board(@RequestParam(value = "idx", defaultValue = "0") Long idx, Model model) {
        model.addAttribute("board", boardBiz.findBoardByIdx(idx));
        return "/form";
    }

    @GetMapping("/bbs2")
    public String bbs2() {
        return "bbs2";
    }

}
