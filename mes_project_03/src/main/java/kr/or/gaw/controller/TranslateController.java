package kr.or.gaw.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class TranslateController {

    // Google Translation API Key
    private static final String API_KEY = "AIzaSyBui7UTsPTqYgQ4MTmJ9MskmuexzPW2C6I";
    private static final String ENDPOINT = "https://translation.googleapis.com/language/translate/v2";

    @PostMapping("/translate")
    @ResponseBody
    public ResponseEntity<String> translate(@RequestParam("text") String text, @RequestParam("lang") String lang) {
        try {
            // Google Translate API로 요청할 URL 생성
            String url = ENDPOINT + "?q=" + text + "&target=" + lang + "&key=" + API_KEY;

            // RestTemplate을 사용해 API 요청 전송
            RestTemplate restTemplate = new RestTemplate();
            String response = restTemplate.getForObject(url, String.class);

            // 응답 데이터를 Jackson ObjectMapper를 사용해 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonResponse = objectMapper.readTree(response);
            String translatedText = jsonResponse
                .get("data")
                .get("translations")
                .get(0)
                .get("translatedText")
                .asText();

            // UTF-8 인코딩을 명시적으로 설정
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(new MediaType("text", "plain", java.nio.charset.StandardCharsets.UTF_8));

            // 번역된 텍스트 반환
            return new ResponseEntity(translatedText, headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();  // 오류 로그 출력
            return new ResponseEntity("번역 오류 발생", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
