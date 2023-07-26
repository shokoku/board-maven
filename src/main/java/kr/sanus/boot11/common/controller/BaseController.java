package kr.sanus.boot11.common.controller;

import java.security.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {

  @GetMapping("/")
  public String home(Principal principal) {
    return "index";
  }

}
