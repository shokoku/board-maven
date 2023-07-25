package kr.sanus.boot11.member;

import javax.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberLoginForm {

  @NotBlank
  private String id;

  @NotBlank
  private String pw;

}
