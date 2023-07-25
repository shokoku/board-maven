package kr.sanus.boot11.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {

  private final MemberMapper memberMapper;
  public void join(Member member) {
    memberMapper.join(member);
  }

}
