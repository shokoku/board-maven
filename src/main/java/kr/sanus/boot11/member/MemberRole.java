package kr.sanus.boot11.member;

import lombok.Getter;

@Getter
public enum MemberRole {
  ADMIN("ADMIN"),
  USER("USER");

  MemberRole(String value) {
    this.value = value;
  }

  private String value;
}