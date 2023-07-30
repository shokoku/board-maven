package kr.sanus.boot11.board;

import java.util.Date;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BoardService {

  private final BoardMapper boardMapper;

  public void save(BoardSaveForm form, String writer) {
    Board board = new Board();
    board.setTitle(form.getTitle());
    board.setContent(form.getContent());
    board.setCreatedDate(new Date());
    board.setUpdatedDate(new Date());
    board.setWriter(writer);
    boardMapper.save(board);
  }

  public List<Board> findAll(int limit, int offset) {
    return boardMapper.findAll(limit, offset);
  }

  public int getTotalCount() {
    return boardMapper.getTotalCount();
  }

}
