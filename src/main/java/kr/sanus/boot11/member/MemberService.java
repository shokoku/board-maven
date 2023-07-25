package kr.sanus.boot11.member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {

  private final MemberMapper memberMapper;
  public void join(Member member) {
    memberMapper.join(member);
  }

  public boolean login(String memberId, String memberPw) {
    boolean result = memberMapper.findByMemberIdAndMemberPw(memberId, memberPw);
    return result;
  }
}
