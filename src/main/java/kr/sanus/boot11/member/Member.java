package kr.sanus.boot11.member;

import javax.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class Member {

  @NotBlank
  private String memberId;

  @NotBlank
  private String memberPw;

  @NotBlank
  private String memberPw2;

  @NotBlank
  private String memberName;

  @NotBlank
  private String memberEmail;

  @NotBlank
  private String memberMobile;

}
