package kr.sanus.boot11.member;

import javax.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberEditForm {

  @NotBlank
  private String id;

  @NotBlank
  private String name;

  @NotBlank
  private String email;

  @NotBlank
  private String mobile;

}
