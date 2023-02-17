package com.hosinsa.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class kakaoService {
	
	public String getReturnAccessToken (String code) {
		 String access_token = "";
         String refresh_token = "";
         String reqURL = "https://kauth.kakao.com/oauth/token";
         
         try {
        	 URL url = new URL(reqURL);
        	 HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        	 
        	 // HttpURLConnection 설정 값 셋팅
             conn.setRequestMethod("POST");
             conn.setDoOutput(true);
             
             // Buffer 스트림 객체 값 셋팅 후 요청
             BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
             StringBuilder sb = new StringBuilder();
             sb.append("grant_type=authorization_code");
             sb.append("&client_id=4cb50f40b2c3bae8b759b2b8ac27aaea");  //앱 KEY VALUE
             sb.append("&redirect_uri=http://localhost:8081/kakao_callback"); // 앱 CALLBACK 경로
             sb.append("&code=" + code);
             bw.write(sb.toString());
             bw.flush();
             
             // RETURN 값 result 변수에 저장
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             String br_line = "";
             String result = "";

             while ((br_line = br.readLine()) != null) {
                 result += br_line;
             }

             JsonParser parser = new JsonParser();
             JsonElement element = parser.parse(result);
             
        	 // 토큰 값 저장 및 리턴
             access_token = element.getAsJsonObject().get("access_token").getAsString();
             refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

             br.close();
             bw.close();
             
         } catch (IOException e) {
        	e.printStackTrace(); 
         }
         return access_token;
	}
	
	public Map<String, Object> getUserInfo(String access_token) {
		Map<String,Object> resultMap = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			 URL url = new URL(reqURL);
             HttpURLConnection conn = (HttpURLConnection) url.openConnection();
             conn.setRequestMethod("GET");
             
             // 요청에 필요한 Header에 포함될 내용
             conn.setRequestProperty("Authorization", "Bearer " + access_token);

             int responseCode = conn.getResponseCode();
             log.info("responseCode : " + responseCode);
             
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

             String br_line = "";
             String result = "";

             while ((br_line = br.readLine()) != null) {
                 result += br_line;
             }
             log.info("response:" + result);

             JsonParser parser = new JsonParser();
             JsonElement element = parser.parse(result);
             log.info("element:: " + element);
             
             JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
             JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
             log.info("id:: "+element.getAsJsonObject().get("id").getAsString());
             
             String id = element.getAsJsonObject().get("id").getAsString();
             String nickname = properties.getAsJsonObject().get("nickname").getAsString();
             String email = kakao_account.getAsJsonObject().get("email").getAsString();
             log.info("email:: " + email);
             
             resultMap.put("nickname", nickname);
             resultMap.put("id", id);
             resultMap.put("email", email); 

		} catch (IOException e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
