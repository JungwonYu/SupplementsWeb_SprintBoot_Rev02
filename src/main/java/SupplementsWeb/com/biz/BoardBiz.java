package SupplementsWeb.com.biz;

import SupplementsWeb.com.dao.BoardDaoImpl;
import SupplementsWeb.com.domain.Board;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class BoardBiz {

    private final BoardDaoImpl boardDaoImpl;

    public BoardBiz(BoardDaoImpl boardRepository) {
        this.boardDaoImpl = boardRepository;
    }

    public Page<Board> findBoardList(Pageable pageable) {
        pageable = PageRequest.of(pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1, pageable.getPageSize());
        return boardDaoImpl.findAll(pageable);
    }

    public Board findBoardByIdx(Long idx) {
        return boardDaoImpl.findById(idx).orElse(new Board());
    }

}
