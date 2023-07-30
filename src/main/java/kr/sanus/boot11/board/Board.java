package kr.sanus.boot11.board;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

  private Long id;
  private String title;
  private String content;
  private String writer;
  private Date createdDate;
  private Date updatedDate;

}
