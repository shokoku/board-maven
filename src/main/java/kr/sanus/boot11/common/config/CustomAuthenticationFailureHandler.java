package kr.sanus.boot11.common.config;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
  @Override
  public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
      AuthenticationException exception) throws IOException, ServletException {

    String errorMessage;
    if (exception.getClass().isAssignableFrom(BadCredentialsException.class)) {
      errorMessage = "아이디 또는 비밀번호가 잘못되었습니다.";
    } else if (exception.getClass().isAssignableFrom(UsernameNotFoundException.class)) {
      errorMessage = "아이디가 잘못되었습니다.";
    } else {
      errorMessage = "로그인 실패";
    }
    request.setAttribute("errorMessage", errorMessage);
    request.getRequestDispatcher("/member/login").forward(request, response);
  }
}