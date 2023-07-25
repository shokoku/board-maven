package kr.sanus.boot11.member;

import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

  void save(Member member);

  Optional<Member> findByIdAndPw(@Param("id") String id, @Param("pw") String pw);


}
