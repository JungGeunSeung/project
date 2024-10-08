package kr.or.gaw.controller;


import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.service.EmpService;


@Controller
public class GeunController {
	
	@Autowired
	EmpService empService;
	
	@Autowired
    private JavaMailSender mailSender;
	
	 @Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	private int generateRandomNumber(int min, int max) {
        Random random = new Random();
        return random.nextInt(max - min + 1) + min; // min과 max 사이의 랜덤 숫자 생성
    }
	
	@RequestMapping("/mainpage")
	public String main() {
		return "main/mainpage";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("로그인 페이지 입장");
		return "main/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("user_id") String user_id,
	                    @RequestParam("password") String password,
	                    Model model) {
		EmpDTO dto = empService.listEmpOne(user_id);
		if (dto != null && passwordEncoder.matches(password, dto.getPassword())) { // 비밀번호 확인
	        model.addAttribute("dto", dto);
	        return "main/mainpage"; // 로그인 성공
	    }
		return "main/login"; // 로그인 실패
	}
	
	@RequestMapping("/agreement")
	public String agree() {
		return "main/agreement";
	}

	@RequestMapping("/sign")
	public String sign() {
		return "main/sign";
	}
	
	@RequestMapping("/sign.do")
	public String signRun(EmpDTO dto) {
		 // 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(dto.getPassword());
        dto.setPassword(encodedPassword); // 암호화된 비밀번호를 DTO에 설정
		
		// 현재 시간을 java.sql.Date로 설정
	    LocalDateTime now = LocalDateTime.now(); // 현재 시간
	    Date hireDate = Date.valueOf(now.toLocalDate()); // LocalDateTime에서 LocalDate로 변환 후 java.sql.Date로 변환
	    dto.setHire_date(hireDate); // hire_date에 현재 시간 설정

	    // 직원 정보 삽입
	    empService.insertEmp(dto);
		System.out.println("-----------------------------------------------------");
		System.out.println("empService.insertEmp(dto) : " + dto.toString());
		System.out.println("-----------------------------------------------------");
		return "redirect:/login";
	}
	
	@RequestMapping(value ="/email", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> sendEmail(@RequestBody Map<String, String> request) {
        // 클라이언트에서 요청받은 데이터 중 'email'을 추출
        String email = request.get("email");

        // UUID를 사용해 고유한 인증 코드를 생성
        int token = generateRandomNumber(100000, 999999);

        // 이메일 메시지를 구성 (받는 사람, 제목, 내용)
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email); // 수신자 이메일 설정
        message.setSubject("이메일 인증 요청"); // 이메일 제목
        message.setText("휴먼교육센터 팀 프로젝트로 인한 이메일 인증입니다.\n 인증 코드는 다음과 같습니다: " + token); // 이메일 본문에 인증 코드 포함

        try {
            // 이메일 전송 시도
            mailSender.send(message); // 이메일을 전송

            // 전송 성공 시 응답으로 'success: true' 반환
            Map<String, Object> response = new HashMap();
            response.put("success", true); // 성공 여부를 true로 설정
            response.put("token", token); // 생성된 인증 코드 추가
            System.out.println("response : " + response);
            return ResponseEntity.ok(response); // 200 OK 응답을 반환
        } catch (Exception e) {
            // 전송 실패 시 예외를 잡아 처리
        	System.err.println("이메일 전송 실패: " + e.getMessage());
            Map<String, Object> response = new HashMap();
            response.put("success", false); // 실패 여부를 false로 설정
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response); // 500 Internal Server Error 응답 반환
        }
    }
	
}
