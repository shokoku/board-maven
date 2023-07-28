package kr.sanus.boot11.api.email;

import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailService {

  private final JavaMailSender mailSender;


  public boolean sendEmail(EmailDTO emailDTO) {
    SimpleMailMessage message = new SimpleMailMessage();
    message.setTo(emailDTO.getTo());
    message.setSubject(emailDTO.getSubject());
    message.setText(emailDTO.getContent());
    try {
      mailSender.send(message);
      return true;

    } catch (Exception e) {
      new RuntimeException(e);
      return false;
    }

  }
}
