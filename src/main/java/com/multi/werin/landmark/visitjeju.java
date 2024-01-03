package com.multi.werin.landmark;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Repository;

@Repository
public class visitjeju {
    public StringBuilder jeju(String ko) {
        // API 키를 여기에 추가하세요
        String apiKey = "";

        // 엔드포인트 http 요청 --> 응답(xml) (JSON 형식으로 요청하려면 &_type=json 파라미터 추가) 이러면 JSON이 되는 것 같음
        String apiUrl = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?MobileOS=ETC&MobileApp=Test&ServiceKey=" + apiKey + "&_type=json";
        
        StringBuilder content = new StringBuilder();
        try {
            // URL 객체 생성
            URL url = new URL(apiUrl);

            // HttpURLConnection 객체 생성
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // 요청 메서드 설정
            connection.setRequestMethod("GET");

            // 응답 코드 확인
            int responseCode = connection.getResponseCode();
            
            if (responseCode == HttpURLConnection.HTTP_OK) {
                // 응답을 읽어오기 위한 BufferedReader 생성
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;

                // 응답 내용 읽기
                while ((inputLine = in.readLine()) != null) {
                    content.append(inputLine);
                }
                in.close();

                // 응답 내용 출력
                System.out.println("API 응답: " + content.toString());
            } else {
                System.out.println("API 호출 실패. 응답 코드: " + responseCode);
            }

            // 연결 해제
            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content;
        
    }
    
    
}