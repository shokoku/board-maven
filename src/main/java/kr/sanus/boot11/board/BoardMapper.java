package kr.sanus.boot11.board;

import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {

  void save(Board board);

  List<Board> findAll(int limit, int offset);
  int getTotalCount();

  Optional<Board> findById(int id);
}
