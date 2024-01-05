package com.multi.werin.landmark;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Repository;

@Repository
public class categorycodeprint {

    public static void main(String[] args) {
        String apiKey = "gRjisabrZIfabIjre8qnZIy4ig724PgKzbxWE5KdbOHL4SD%2FneKsnNw2phKHIowgD5NXuBRaTpMEvSAY2uTA1Q%3D%3D";
        int numOfRows = 10; // 한 페이지에 표시할 항목의 수

        // 첫 페이지부터 마지막 페이지까지 반복해서 호출
        for (int pageNo = 1; ; pageNo++) {
            String apiUrl = "https://apis.data.go.kr/B551011/KorService1/categoryCode1?MobileOS=ETC&MobileApp=Test&ServiceKey="
                    + apiKey + "&_type=json&pageNo=" + pageNo + "&numOfRows=" + numOfRows;

            String content = requestAPI(apiUrl);

            // 응답이 없거나 빈 데이터일 경우 반복 중단
            if (content.isEmpty()) {
                break;
            }

            // JSON 파싱 및 출력
            printJsonData(content);
        }
    }

    private static String requestAPI(String apiUrl) {
        StringBuilder content = new StringBuilder();
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            int responseCode = connection.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;

                while ((inputLine = in.readLine()) != null) {
                    content.append(inputLine);
                }
                in.close();
            } else {
                System.out.println("API 호출 실패. 응답 코드: " + responseCode);
            }

            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content.toString();
    }

    private static void printJsonData(String json) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(json);
            JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

            // 특정 필드의 각 항목에 대한 처리
            for (JsonNode itemNode : itemsNode) {
                String code = itemNode.path("code").asText();
                String name = itemNode.path("name").asText();
                String rnum = itemNode.path("rnum").asText();

                System.out.println("Code: " + code);
                System.out.println("Name: " + name);
                System.out.println("RNum: " + rnum);
                System.out.println("------------------------------");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}