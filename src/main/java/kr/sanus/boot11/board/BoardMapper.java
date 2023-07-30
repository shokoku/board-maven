package kr.sanus.boot11.board;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {

  void save(Board board);

}
