package kr.sanus.boot11.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

@Service
public class MemberSecurityService implements UserDetailsService {

  private final MemberMapper memberMapper;

  @Autowired
  public MemberSecurityService(MemberMapper memberMapper) {
    this.memberMapper = memberMapper;
  }

  @Override
  public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
    Member member = memberMapper.findById(id);
    if (member == null) {
      throw new UsernameNotFoundException("사용자를 찾을 수 없습니다.");
    }

    String role = member.getId().equals("admin") ? MemberRole.ADMIN.getValue() : MemberRole.USER.getValue();

    return User.builder()
        .username(member.getId())
        .password(member.getPw())
        .roles(role)
        .build();
  }
}
