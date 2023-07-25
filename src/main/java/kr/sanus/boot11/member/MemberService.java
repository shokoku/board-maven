package kr.sanus.boot11.member;

import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {

  private final MemberMapper memberMapper;
  public void join(Member member) {
    memberMapper.save(member);
  }

  public Optional<Member> login(String id, String pw) {
    return memberMapper.findByIdAndPw(id, pw);
  }
}
