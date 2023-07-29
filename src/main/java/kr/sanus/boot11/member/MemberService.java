package kr.sanus.boot11.member;

import java.util.Optional;
import java.util.Random;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {

  private final MemberMapper memberMapper;
  private final PasswordEncoder passwordEncoder;
  private final JavaMailSender mailSender;
  
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

  public Member checkNamedAndEmail(String name, String email) {
    Optional<Member> optionalMember = memberMapper.findByEmail(email);

    if (optionalMember.isPresent()) {
      Member member = optionalMember.get();
      if (member.getName().equals(name)  && member.getEmail().equals(email) ) {
        return member;
      }
      return null;
    }
    return null;
  }

  public void sendEmail(String email) {
    String verificationCode = generateRandomVerificationCode();
    SimpleMailMessage message = new SimpleMailMessage();
    message.setTo(email);
    message.setSubject("Sanus 아이디 찾기");
    message.setText("인증번호는 " + verificationCode + " 입니다.");
    mailSender.send(message);
    memberMapper.saveCode(email, verificationCode);
  }

  public Member verifyCode(String email, String inputCode) {
    String byCode = memberMapper.findCodeByEmail(email);

    if (inputCode.equals(byCode)) {
      Optional<Member> memberOptional = memberMapper.findByEmail(email);
      if (memberOptional.isPresent()) {
        return memberOptional.get();
      } else {
        return null;
      }
    } else {
      return null;
    }
  }


  private String generateRandomVerificationCode() {
    Random random = new Random();
    StringBuilder sb = new StringBuilder();

    for (int i = 0; i < 6; i++) {
      sb.append(random.nextInt(10));
    }
    return sb.toString();
  }
}


