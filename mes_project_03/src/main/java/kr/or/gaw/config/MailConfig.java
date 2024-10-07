package kr.or.gaw.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com"); // Gmail SMTP 서버 주소
        mailSender.setPort(587); // 포트 번호

        // 메일을 보낼 메일 아이디
        mailSender.setUsername("bijousimple4869@gmail.com"); // Gmail 주소
        mailSender.setPassword("cvmesohvncjbriaj"); // 생성한 앱 비밀번호

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        return mailSender;
    }
}

