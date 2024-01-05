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
public class areacodeprint {

    public static void main(String[] args) {
        // API 키를 여기에 추가하세요
        String apiKey = "gRjisabrZIfabIjre8qnZIy4ig724PgKzbxWE5KdbOHL4SD%2FneKsnNw2phKHIowgD5NXuBRaTpMEvSAY2uTA1Q%3D%3D";

        // 첫 페이지의 totalCount를 확인하여 전체 페이지를 가져옴
        int numOfRows = 10;
        int pageNo = 1;
        int totalCount = getTotalCount(apiKey, numOfRows);

        // 모든 페이지의 내용을 요소별로 출력
        for (; pageNo <= (totalCount + numOfRows - 1) / numOfRows; pageNo++) {
            String apiUrl = "https://apis.data.go.kr/B551011/KorService1/areaCode1?MobileOS=ETC&MobileApp=Test&numOfRows=" + numOfRows
                    + "&ServiceKey=" + apiKey + "&_type=json&pageNo=" + pageNo;

            String content = requestAPI(apiUrl);

            // 응답이 없거나 빈 데이터일 경우 반복 중단
            if (content.isEmpty()) {
                break;
            }

            // JSON 데이터를 요소별로 출력
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

                System.out.println("Code: " + code);
                System.out.println("Name: " + name);
                System.out.println("------------------------------");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static int getTotalCount(String apiKey, int numOfRows) {
        String apiUrl = "https://apis.data.go.kr/B551011/KorService1/areaCode1?MobileOS=ETC&MobileApp=Test&numOfRows=" + numOfRows
                + "&ServiceKey=" + apiKey + "&_type=json&pageNo=1";

        String content = requestAPI(apiUrl);

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode;
        int totalCount = 0;

        try {
            rootNode = objectMapper.readTree(content);
            totalCount = rootNode.path("response").path("body").path("totalCount").asInt();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return totalCount;
    }
}