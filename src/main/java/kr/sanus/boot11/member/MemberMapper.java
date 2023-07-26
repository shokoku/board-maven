package kr.sanus.boot11.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

  void save(Member member);
  Member findById(String id);

  void update(Member member);

}
