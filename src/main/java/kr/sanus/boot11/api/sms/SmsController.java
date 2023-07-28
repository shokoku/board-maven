package kr.sanus.boot11.api.sms;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestClientException;

import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/sms")
public class SmsController {

  private final SmsService smsService;

  @GetMapping("/send")
  public String sendForm(Model model) {
    model.addAttribute("sms",new SmsMessageDTO());
    return "api/sendForm";
  }

  @PostMapping("/send")
  public String send(SmsMessageDTO smsMessageDto, Model model)
      throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
    SmsResponseDTO response = smsService.sendSms(smsMessageDto);
    model.addAttribute("response", response);
    return "api/result";
  }

}