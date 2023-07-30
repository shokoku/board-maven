package kr.sanus.boot11.board;

import java.security.Principal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

  @GetMapping("/list")
  public String list(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
    int limit = 10;
    int offset = (page - 1) * limit;

    int totalCount = boardService.getTotalCount();
    int totalPages = (int) Math.ceil((double) totalCount / limit);

    List<Board> boards = boardService.findAll(limit, offset);
    model.addAttribute("boards", boards);
    model.addAttribute("totalPages", totalPages);
    model.addAttribute("currentPage", page);

    return "board/list";
  }


  @GetMapping("/detail/{id}")
  public String content(@PathVariable int id, Model model) {
    Board board = boardService.findById(id);
    model.addAttribute("board", board);
    return "board/detail";
  }

  @GetMapping("/test")
  public void test() {
    for (int i = 0; i < 100; i++) {
      BoardSaveForm form = new BoardSaveForm();
      form.setTitle(i + " 번째 제목");
      form.setContent(i + " 번째 내용");
      boardService.save(form,"test");

    }
  }
}
