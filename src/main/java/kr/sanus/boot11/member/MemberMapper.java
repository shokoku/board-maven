package kr.sanus.boot11.member;

import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

  void save(Member member);
  Member findById(String id);

  Optional<Member> findByEmail(String email);

  void update(Member member);

  void saveCode(String email, String code);

  String findCodeByEmail(String email);

  void updatePw(String pw, String id);

}
