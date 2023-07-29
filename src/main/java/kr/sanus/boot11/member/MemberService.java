package kr.sanus.boot11.member;

import java.util.concurrent.ThreadLocalRandom;
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

  public Member findIdByEmailAndName(String email, String name) {
    return memberMapper.findByEmail(email)
        .filter(member -> member.getName().equals(name))
        .orElse(null);
  }


  public void sendEmail(String email) {
    String verificationCode = generateRandomVerificationCode();
    sendVerificationCodeByEmail(email, verificationCode);
    saveVerificationCode(email, verificationCode);
  }

  public Member verifyCode(String email, String inputCode) {
    String storedCode = memberMapper.findCodeByEmail(email);

    if (inputCode.equals(storedCode)) {
      return memberMapper.findByEmail(email).orElse(null);
    }

    return null;
  }

  private static final int VERIFICATION_CODE_LENGTH = 6;

  private String generateRandomVerificationCode() {
    StringBuilder sb = new StringBuilder();

    for (int i = 0; i < VERIFICATION_CODE_LENGTH; i++) {
      int randomDigit = ThreadLocalRandom.current().nextInt(10);
      sb.append(randomDigit);
    }

    return sb.toString();
  }

  private void sendVerificationCodeByEmail(String email, String verificationCode) {
    SimpleMailMessage message = new SimpleMailMessage();
    message.setTo(email);
    message.setSubject("Sanus 아이디 찾기");
    message.setText("인증번호는 " + verificationCode + " 입니다.");
    mailSender.send(message);
  }

  private void saveVerificationCode(String email, String verificationCode) {
    memberMapper.saveCode(email, verificationCode);
  }
}


