package kr.sanus.boot11.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

  void join(Member member);

  boolean findByMemberIdAndMemberPw(String memberId, String memberPw);

}
