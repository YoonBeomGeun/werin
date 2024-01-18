package com.multi.werin.landmark;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class Landmarkdb1 {
    
    // LandmarkItemVO 클래스 정의 필요
	
    public List<LandmarkApiVO> getLandmarkItems() {
        List<LandmarkApiVO> landmarkItemList = new ArrayList<>();

        try {
            String apiKey = "gRjisabrZIfabIjre8qnZIy4ig724PgKzbxWE5KdbOHL4SD%2FneKsnNw2phKHIowgD5NXuBRaTpMEvSAY2uTA1Q%3D%3D";
            int numOfRows = 10;
            int pageNo = 1;
            int totalPages = 1;

            do {
                String apiUrl = "http://apis.data.go.kr/B551011/KorService1/"
                        + "areaBasedList1?"
                        + "MobileOS=ETC&MobileApp=Test"
                        + "&ServiceKey=" + apiKey
                        + "&listYN=Y&arrange=A&contentTypeId=12&areaCode=39&sigunguCode=&cat1=&cat2=&cat3="
                        + "&_type=json&pageNo=" + pageNo + "&numOfRows=" + numOfRows;

                URL url = new URL(apiUrl);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                int responseCode = connection.getResponseCode();

                if (responseCode == HttpURLConnection.HTTP_OK) {
                    BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                    String inputLine;
                    StringBuilder response = new StringBuilder();

                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine);
                    }
                    in.close();

                    ObjectMapper objectMapper = new ObjectMapper();
                    JsonNode rootNode = objectMapper.readTree(response.toString());

                    JsonNode bodyNode = rootNode.path("response").path("body");
                    int totalCount = bodyNode.path("totalCount").asInt();
                    int itemsPerPage = bodyNode.path("numOfRows").asInt();

                    totalPages = (totalCount + itemsPerPage - 1) / itemsPerPage;

                    JsonNode itemsNodePage = bodyNode.path("items").path("item");
                    for (JsonNode itemNodePage : itemsNodePage) {
                        LandmarkApiVO landmarkItem = new LandmarkApiVO();
                        landmarkItem.setFirstimage(itemNodePage.path("firstimage").asText());
                        landmarkItem.setMapx(itemNodePage.path("mapx").asText());
                        landmarkItem.setMapy(itemNodePage.path("mapy").asText());
                        landmarkItem.setContentid(itemNodePage.path("contentid").asText());
                        landmarkItem.setTitle(itemNodePage.path("title").asText());

                        landmarkItemList.add(landmarkItem);
                    }

                    connection.disconnect();
                    pageNo++;
                } else {
                    System.out.println("API 호출 실패. 응답 코드: " + responseCode);
                }
            } while (pageNo <= totalPages);

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println(landmarkItemList);

        return landmarkItemList;
    }


}