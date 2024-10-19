package kr.or.gaw.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.PostsDTO;
import kr.or.gaw.service.BoardService;
import kr.or.gaw.service.EmpService;


@Controller
public class GeunMainController {
	
	@Autowired
	EmpService empService;
	
	@Autowired
	BoardService boardservice;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	// 랜덤 숫자 계산
	private int generateRandomNumber(int min, int max) {
        Random random = new Random();
        return random.nextInt(max - min + 1) + min; // min과 max 사이의 랜덤 숫자 생성
    }
	
	// 메인페이지 입장
	@RequestMapping("/mainpage")
	public String main(Model model, @ModelAttribute("dto") EmpDTO dto, HttpSession session) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
	        return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
	    }
		
		List posts = boardservice.mainNewPosts();
		
		// 새로운 리스트 생성
        List<PostsDTO> newPosts = new ArrayList();

        // 전통적인 for문을 사용한 게시물 처리
        for (int i = 0; i < posts.size(); i++) {
            PostsDTO post = (PostsDTO) posts.get(i); // 게시물 가져오기
            Timestamp createdAt = post.getCreated_at(); // DB의 Timestamp 타입

            // 9시간 시차 보정
            long nineHoursInMillis = 9 * 60 * 60 * 1000;
            Timestamp adjustedCreatedAt = new Timestamp(createdAt.getTime() + nineHoursInMillis);

            // 현재 시간과 보정된 작성 시간 비교
            boolean isMoreThanADay = (System.currentTimeMillis() - adjustedCreatedAt.getTime()) >= (24 * 60 * 60 * 1000);

            // 날짜 또는 시간 포맷 설정
            String displayTime = isMoreThanADay
                ? new SimpleDateFormat("yyyy-MM-dd").format(adjustedCreatedAt)
                : new SimpleDateFormat("HH:mm:ss").format(adjustedCreatedAt);

            // 계산된 displayTime을 게시물에 설정
            post.setDisPlayTime(displayTime);

            // 처리된 게시물을 새로운 리스트에 추가
            newPosts.add(post);
        }
		System.out.println("newPosts : "+newPosts.toString());
		model.addAttribute("newPost", newPosts);
		
		return "main/mainpage";
	}
	
	// 로그인 페이지 입장
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "main/login";
	}
	
	// 로그아웃시 로그인페이지로 리다이렉트
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		 session.invalidate(); // 세션 무효화 및 삭제
		return "redirect:/login?logout=true";
	}
	
	// 약관동의 페이지 입장
	@RequestMapping("/agreement")
	public String agree() {
		return "main/agreement";
	}
	
	// 회원가입 페이지 입장
	@RequestMapping("/sign")
	public String sign() {
		return "main/sign";
	}
	
	// 비밀번호 찾기 입장
	@RequestMapping("/find")
	public String find() {
		return "main/find";
	}
	
	// 로그인 시도시 성공실패에 따라 작동하기
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("user_id") String user_id,
	                    @RequestParam("password") String password,
	                    Model model,
	                    RedirectAttributes redirectAttributes,
	                    HttpSession session) {
		EmpDTO dto = empService.listEmpOne(user_id);
		if (dto != null && passwordEncoder.matches(password, dto.getPassword())) { // 비밀번호 확인
			session.setAttribute("loggedInUser", dto);
			redirectAttributes.addFlashAttribute("dto", dto);
	        return "redirect:/mainpage"; // 로그인 성공
	    }
		return "redirect:/login?login=false"; // 로그인 실패
	}
	
	// 회원가입 처리 로직
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
		return "redirect:/login";
	}
	
	// 비밀번호 찾기 페이지 입장
	@RequestMapping("/updatePW")
	public String updatePW(EmpDTO dto, Model model, String user_id, String email) {
		dto = empService.listEmpOne(user_id);
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "main/updatePW";
	}
	
	// 비밀번호 찾기 로직
	@RequestMapping("/updatePW.do")
	public String updatePW2(EmpDTO dto) {
		String encodedPassword = passwordEncoder.encode(dto.getPassword());
        dto.setPassword(encodedPassword); // 암호화된 비밀번호를 DTO에 설정
		int result = empService.updateEmpPassword(dto);
		System.out.println("패스워드 변경 결과 : " + result);
		return "redirect:/login";
	}
	
	// 비밀번호 찾기에서 이메일 인증 ajax
	@RequestMapping(value ="/email.find", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> sendEmail(@RequestBody Map<String, String> request) {
        // 클라이언트에서 요청받은 데이터 중 'email'을 추출
        String email = request.get("email");
        String user_id = request.get("user_id");
        EmpDTO dto = null;
        
        System.out.println("email :" + email + " user_id : " + user_id);
        
        if(user_id != null) {
        	dto = empService.listEmpOne(user_id);
        }
        
        if (dto == null) {
            Map<String, Object> response = new HashMap();
            response.put("success", false);
            response.put("message", "해당 아이디가 존재하지 않습니다.");
            return ResponseEntity.ok(response); // 200 OK 상태로 반환
        }
        
        if (!dto.getEmail().equalsIgnoreCase(email)) {
        	Map<String, Object> response = new HashMap();
        	response.put("success", false);
        	response.put("message", "해당 이메일이 존재하지 않습니다.");
        	return ResponseEntity.ok(response); // 200 OK 상태로 반환
        }
        
        // UUID를 사용해 고유한 인증 코드를 생성
        int token = generateRandomNumber(100000, 999999);

        // 이메일 메시지를 구성 (받는 사람, 제목, 내용)
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email); // 수신자 이메일 설정
        message.setSubject("이메일 인증 요청"); // 이메일 제목
        message.setText("휴먼교육센터 팀 프로젝트로 인한 이메일 인증입니다"
        			  + "\n 인증 코드는 다음과 같습니다: " + token); // 이메일 본문에 인증 코드 포함

        try {
            // 이메일 전송 시도
            mailSender.send(message); // 이메일을 전송

            // 전송 성공 시 응답으로 'success: true' 반환
            Map<String, Object> response = new HashMap();
            response.put("success", true); // 성공 여부를 true로 설정
            response.put("token", token); // 생성된 인증 코드 추가
            response.put("dto", dto); // user 정보가 담긴 dto 넣기
            System.out.println("response : " + response);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // 전송 실패 시 예외를 잡아 처리
        	System.err.println("이메일 전송 실패: " + e.getMessage());
            Map<String, Object> response = new HashMap();
            response.put("success", false); // 실패 여부를 false로 설정
            response.put("message", "이메일 전송에 실패했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response); // 500 Internal Server Error 응답 반환
        }
    }
	
	// 회원가입에서 이메일 인증 ajax
	@RequestMapping(value ="/email.sign", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> sendEmail2(@RequestBody Map<String, String> request) {
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
	
	// 마이페이지에서 이메일 변경 로직
	@PostMapping("/emailUpdate")
	public String emailUpdate(HttpSession session,@RequestParam("email") String email) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
	        return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
	    }
		
		EmpDTO dto = (EmpDTO) loggedInUser;
        dto.setEmail(email);
        int result = empService.emailUpdate(dto);
        if(result >= 1) {
        	System.out.println("이메일 변경 완료 : " + dto.toString());
        } else {
        	System.out.println("이메일 변경 실패 : " + dto.toString());
        }
        
        return "redirect:mypage";
	}
	
	// 마이페이지에서 이름 변경 로직
	@PostMapping("/nameUpdate")
	public String nameUpdate(HttpSession session,@RequestParam("name") String name) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		}
		
		EmpDTO dto = (EmpDTO) loggedInUser;
		dto.setName(name);
		int result = empService.nameUpdate(dto);
		if(result >= 1) {
			System.out.println("이름 변경 완료 : " + dto.toString());
		} else {
			System.out.println("이름 변경 실패 : " + dto.toString());
		}
		
		return "redirect:mypage";
	}
	// 마이페이지에서 폰번호 변경 로직
	@PostMapping("/phoneUpdate")
	public String phoneUpdate(HttpSession session,@RequestParam("phone") String phone) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		}
		
		EmpDTO dto = (EmpDTO) loggedInUser;
		dto.setPhone(phone);
		int result = empService.phoneUpdate(dto);
		if(result >= 1) {
			System.out.println("폰번호 변경 완료 : " + dto.toString());
		} else {
			System.out.println("폰번호 변경 실패 : " + dto.toString());
		}
		
		return "redirect:mypage";
	}
	// 마이페이지에서 비밀번호 변경 로직
	@PostMapping("/passwordUpdate")
	@ResponseBody
	public Map<String, Object> updatePassword(HttpSession session, @RequestBody Map<String, String> payload) {
	    Map<String, Object> response = new HashMap();

	    EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	    if (loggedInUser == null) {
	        response.put("success", false);
	        response.put("message", "로그인이 필요합니다.");
	        return response;
	    }

	    String nowPassword = payload.get("nowpassword");
	    String changePassword = payload.get("changepassword");

	    // 현재 비밀번호 검증
	    if (!passwordEncoder.matches(nowPassword, loggedInUser.getPassword())) {
	        response.put("success", false);
	        response.put("message", "현재 비밀번호가 일치하지 않습니다.");
	        return response;
	    }

	    // 새 비밀번호 암호화 및 업데이트
	    loggedInUser.setPassword(passwordEncoder.encode(changePassword));
	    int result = empService.updateEmpPassword(loggedInUser);

	    if (result > 0) {
	        response.put("success", true);
	        response.put("message", "비밀번호가 성공적으로 변경되었습니다.");
	    } else {
	        response.put("success", false);
	        response.put("message", "비밀번호 변경에 실패했습니다.");
	    }

	    return response;
	}
		
	// 아이디 중복체크 로직
	@PostMapping("/check-duplicate.ajax")
    @ResponseBody
    public Map<String, Object> checkDuplicate(@RequestBody Map<String, String> requestData) {
        String user_id = requestData.get("user_id");
        System.out.println("user_id : "+user_id);
        boolean isDuplicate = empService.isUserIdDuplicate(user_id);
        
        Map<String, Object> response = new HashMap();
        response.put("success", true);
        
        if (isDuplicate) {
            response.put("status", "duplicate");
        } else {
            response.put("status", "available");
        }
        
        return response;
    }
	
	// 관리자 페이지 입장
	@RequestMapping("/adminpage")
	public String adminIn(Model model) {
		List list = empService.filterListEmp();
		List list1 = empService.deptList();
		model.addAttribute("emplist", list);
		model.addAttribute("deptlist", list1);
		return "main/adminPage";
	}
	
	// 관리자 페이지에서 회원정보 업데이트 로직
	@PostMapping("/empUpdate.do")
	public String adminUpdate(EmpDTO dto) {
		int result = empService.empUpdateToAdmin(dto);
		return "redirect:adminpage";
	}
	
	// 마이페이지 입장
	@RequestMapping("/mypage")
	public String mypageIn(Model model, @ModelAttribute("dto") EmpDTO dto, HttpSession session) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		
		if (loggedInUser == null) {
	        return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
	    }
		
		System.out.println(loggedInUser.toString());
		model.addAttribute("user", loggedInUser);
		return "main/mypage";
	}
	
	// 마이페이지에서 프로필 사진 업로드하기
	@RequestMapping("upload.do")
	public String upload(MultipartHttpServletRequest req, HttpSession session) {
	    EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");

	    // 파일을 담을 수 있는 클래스
	    MultipartFile mf = req.getFile("file1");

	    if (mf == null || mf.isEmpty()) {
	        System.out.println("파일이 비어있습니다.");
	        return "redirect:mypage?error=emptyfile";
	    }

	    try {
	        long filesize = mf.getSize();
	        long time = System.currentTimeMillis();
	        System.out.println("filesize : " + filesize);

	        String originalFileName = mf.getOriginalFilename();
	        System.out.println("originalFileName : " + originalFileName);
	        
	        // 확장자 추출
	        String ext = "";
	        int dotIndex = originalFileName.lastIndexOf('.');
	        if (dotIndex > 0) {
	            ext = originalFileName.substring(dotIndex + 1).toLowerCase();
	        }

	        // 저장할 경로
	        String path = "D:" + File.separator + "project" + File.separator + 
	                      "mes_project_03" + File.separator + 
	                      "src" + File.separator + "main" + File.separator + 
	                      "webapp" + File.separator + "resources" + File.separator + "profile";

	        // 고유한 파일 이름 생성 (충돌 방지)
	        String safeFileName = path + File.separator + loggedInUser.getUser_id() + "_" + time + "." + ext;

	        // URL 경로를 프로필에 저장
	        String profileUrl = "resources/profile/" + loggedInUser.getUser_id() + "_" + time + "." + ext;
	        loggedInUser.setProfile_url(profileUrl);

	        // 프로필 정보 업데이트
	        int result = empService.profileUpdate(loggedInUser);

	        // 파일 저장
	        File file = new File(safeFileName);
	        mf.transferTo(file);
	        

	    } catch (IllegalStateException e ) {
	        e.printStackTrace();
	        return "redirect:mypage?error=uploadfailed";
	    } catch (IOException e) {
	    	e.printStackTrace();
	    	return "redirect:mypage?error=uploadfailed";
	    }

	    return "redirect:mypage";
	}
	
	// 마이페이지에서 프로필 사진 삭제하기
	@RequestMapping("deleteProfile.do")
	public String deleteProfile(HttpSession session) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		int result = empService.profileDelete(loggedInUser);
		return "redirect:mypage";
	}
}
