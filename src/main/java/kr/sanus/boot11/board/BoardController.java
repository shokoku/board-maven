package kr.sanus.boot11.board;

import java.security.Principal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
@RequestMapping("/board")
public class BoardController {

  private final BoardService boardService;

  @GetMapping("/add")
  public String saveForm(Model model) {
    model.addAttribute("board", new Board());
    return "board/saveForm";
  }

  @PostMapping("/add")
  public String save(@Validated @ModelAttribute("board") BoardSaveForm form, BindingResult bindingResult,
      Model model, Principal principal) {

    if (bindingResult.hasErrors()) {
      log.info("errors={}", bindingResult);
      model.addAttribute("bindingResult", bindingResult);
      return "board/saveForm";
    }

    String writer;
    if (principal != null) {
      writer = principal.getName();
    } else {
      writer = "guest";
    }

    boardService.save(form, writer);
    return "redirect:/";
  }

}
