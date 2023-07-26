package kr.sanus.boot11.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.header.writers.frameoptions.XFrameOptionsHeaderWriter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.authorizeRequests()
        .antMatchers("/admin/**").hasRole("ADMIN")
        .antMatchers("/vip/**").authenticated()
        .antMatchers("/**").permitAll()
        .and()
        .csrf().disable()
        .headers(headers -> headers
            .addHeaderWriter(new XFrameOptionsHeaderWriter(XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN)))
        .formLogin(login -> login
            .loginPage("/member/login")
            .failureHandler(new CustomAuthenticationFailureHandler())
            .usernameParameter("id")
            .passwordParameter("pw")
            .defaultSuccessUrl("/"))
        .logout(logout -> logout
            .logoutUrl("/member/logout")
            .logoutSuccessUrl("/")
            .invalidateHttpSession(true));
  }

  @Bean
  public PasswordEncoder passwordEncoder() {
    return PasswordEncoderFactories.createDelegatingPasswordEncoder();
  }
}
