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
  
  public Member info(String id) {
    Member findMember = memberMapper.findById(id);
    return findMember;
  }

  public void edit(MemberEditForm form) {
    Member member = memberMapper.findById(form.getId());
    member.setName(form.getName());
    member.setMobile(form.getMobile());
    member.setEmail(form.getEmail());
    memberMapper.update(member);
  }

}
