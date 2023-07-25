package kr.sanus.boot11.member;

import javax.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class MemberLoginForm {

  @NotBlank
  private String memberId;

  @NotBlank
  private String memberPw;

}
