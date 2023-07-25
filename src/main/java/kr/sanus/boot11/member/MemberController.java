package kr.sanus.boot11.member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

  private final MemberService memberService;

  @GetMapping("/join")
  public String joinForm(Model model) {
    model.addAttribute("member",new Member());
    return "member/joinForm";
  }

  @PostMapping("/join")
  public String join(@Validated @ModelAttribute Member member, BindingResult bindingResult, Model model) {

    if (bindingResult.hasErrors()) {
      log.info("errors={}", bindingResult);
      model.addAttribute("bindingResult", bindingResult);
      return "member/joinForm";
    }

    if (!member.getMemberPw().equals(member.getMemberPw2())) {
      if (!member.getMemberPw().isEmpty() && !member.getMemberPw2().isEmpty()) {
        bindingResult.rejectValue("memberPw2", "error.member", "비밀번호가 일치하지 않습니다.");
      }
      log.info("errors={}", bindingResult);
      model.addAttribute("bindingResult", bindingResult);
      return "member/joinForm";
    }

    memberService.join(member);
    return "redirect:/";
  }

  @GetMapping("/login")
  public String loginForm(Model model) {
    model.addAttribute("member", new Member());
    return "member/loginForm";
  }

  @PostMapping("/login")
  public String login(@Validated @ModelAttribute MemberLoginForm form,
      BindingResult bindingResult, Model model) {

    if (bindingResult.hasErrors()) {
      log.info("errors={}", bindingResult);
      model.addAttribute("bindingResult", bindingResult);
      return "member/loginForm";
    }

    if (memberService.login(form.getMemberId(), form.getMemberPw())) {
      return "redirect:/";
    } else {
      return "member/loginForm";
    }
  }

}
