package kr.sanus.boot11.member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {

  private final MemberMapper memberMapper;
  private final PasswordEncoder passwordEncoder;
  public void join(Member member) {
    member.setPw(passwordEncoder.encode(member.getPw()));
    memberMapper.save(member);
  }

}
