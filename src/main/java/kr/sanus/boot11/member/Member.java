package kr.sanus.boot11.member;

import javax.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {

  @NotBlank
  private String id;

  @NotBlank
  private String pw;

  @NotBlank
  private String pw2;

  @NotBlank
  private String name;

  @NotBlank
  private String email;

  @NotBlank
  private String mobile;

}
