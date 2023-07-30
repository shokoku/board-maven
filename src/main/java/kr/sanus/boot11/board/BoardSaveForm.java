package kr.sanus.boot11.board;

import javax.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardSaveForm {

  @NotBlank
  private String title;

  @NotBlank
  private String content;

}
