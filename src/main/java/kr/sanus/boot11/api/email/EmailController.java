package kr.sanus.boot11.api.email;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/email")
public class EmailController {

  private final EmailService emailService;

  @GetMapping("/send")
  public String sendForm(Model model) {
    model.addAttribute("email", new EmailDTO());
    return "api/email/sendForm";
  }

  @PostMapping("/send")
  public String sendEmail(@ModelAttribute("email") EmailDTO emailDTO, Model model) {
    boolean status = emailService.sendEmail(emailDTO);
    model.addAttribute("status", status);
    return "api/email/result";
  }
}
