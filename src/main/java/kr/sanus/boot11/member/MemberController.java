package kr.sanus.boot11.member;

import java.security.Principal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

  private final MemberService memberService;
  private final MemberSecurityService memberSecurityService;

  @GetMapping("/join")
  public String joinForm(Model model) {
    model.addAttribute("member", new Member());
    return "member/joinForm";
  }

  @PostMapping("/join")
  public String join(@Validated @ModelAttribute Member member, BindingResult bindingResult,
      Model model) {

    if (bindingResult.hasErrors()) {
      log.info("errors={}", bindingResult);
      model.addAttribute("bindingResult", bindingResult);
      return "member/joinForm";
    }

    if (!member.getPw().equals(member.getPw2())) {
      if (!member.getPw().isEmpty() && !member.getPw2().isEmpty()) {
        bindingResult.rejectValue("pw2", "error.member", "비밀번호가 일치하지 않습니다.");
      }
      log.info("errors={}", bindingResult);
      model.addAttribute("bindingResult", bindingResult);
      return "member/joinForm";
    }

    memberService.join(member);

    UserDetails userDetails = memberSecurityService.loadUserByUsername(member.getId());
    UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
        userDetails, null, userDetails.getAuthorities());
    SecurityContextHolder.getContext().setAuthentication(authenticationToken);
    return "redirect:/";
  }

  @GetMapping("/login")
  public String loginForm() {
    return "member/loginForm";
  }

  @PostMapping("/login")
  public String login(@Validated @ModelAttribute Member member, BindingResult bindingResult,
      Model model) {

    if (bindingResult.hasErrors()) {
      log.info("errors={}", bindingResult);
      model.addAttribute("bindingResult", bindingResult);
      return "member/loginForm";
    }
    return "redirect:/";
  }

  @GetMapping("/info")
  public String info(Principal principal, Model model) {
    Member member = memberService.info(principal.getName());
    model.addAttribute("member", member);
    return "member/info";
  }

  @GetMapping("/edit")
  public String editForm(Principal principal, Model model) {
    Member member = memberService.info(principal.getName());
    model.addAttribute("member", member);
    return "member/editForm";
  }

  @PostMapping("/edit")
  public String edit(@Validated @ModelAttribute("member") MemberEditForm form,
      BindingResult bindingResult, Model model) {
    if (bindingResult.hasErrors()) {
      log.info("errors={}", bindingResult);
      model.addAttribute("bindingResult", bindingResult);
      return "member/editForm";
    }
    memberService.edit(form);
    return "redirect:/member/info";
  }

  @GetMapping("/findId")
  public String findIdForm(Model model) {
    model.addAttribute("member", new Member());
    return "member/findIdForm";
  }

  @ResponseBody
  @PostMapping("/sendEmail")
  public boolean findIdByEmailAndName(@RequestBody MemberEditForm form) {
    Member member = memberService.findIdByEmailAndName(form.getEmail(), form.getName(),form.getId());
    if (member != null) {
      memberService.sendEmail(member.getEmail());
      return true;
    }
    return false;
  }

  @ResponseBody
  @PostMapping("/checkNumber")
  public String checkAuthenticationCode(@RequestBody MemberData form) {
    Member member = memberService.verifyCode(form.getEmail(), form.getCertification());
    return (member != null) ? member.getId() : null;
  }

  @GetMapping("/findPw")
  public String findPwForm(Model model) {
    model.addAttribute("member", new Member());
    return "member/findPwForm";
  }

  @PostMapping("/findPw")
  public String pwEdit(String id, String pw) {
    memberService.pwEdit(id,pw);
    return "redirect:/member/login";
  }

}
