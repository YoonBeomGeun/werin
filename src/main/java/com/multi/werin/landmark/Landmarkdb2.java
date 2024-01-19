package com.multi.werin.landmark;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Component
public class Landmarkdb2 {

	@JsonIgnoreProperties(ignoreUnknown = true)
	public LandmarkApiVO2 getLandmarkItems(int contentid) { // 나중에 contentid 집어넣을 생각
		// List<LandmarkApiVO>
		try {
			// API 호출을 위한 URL
			String apiKey = "gRjisabrZIfabIjre8qnZIy4ig724PgKzbxWE5KdbOHL4SD%2FneKsnNw2phKHIowgD5NXuBRaTpMEvSAY2uTA1Q%3D%3D";

			String apiUrl = "http://apis.data.go.kr/B551011/KorService1/detailCommon1" + "?ServiceKey=" + apiKey
					+ "&contentTypeId=12" + "&contentId=" + contentid + "&MobileOS=ETC" + "&MobileApp=AppTest"
					+ "&defaultYN=Y" + "&firstImageYN=Y" + "&areacodeYN=Y" + "&catcodeYN=Y" + "&addrinfoYN=Y"
					+ "&mapinfoYN=Y" + "&overviewYN=Y";

			// API 호출 및 응답 받기
			String xmlResponse = sendHttpRequest(apiUrl);

			// XML을 JSON으로 변환
			JSONObject jsonResponse = convertXmlToJson(xmlResponse);

			// Jackson ObjectMapper 인스턴스 생성
			ObjectMapper objectMapper = new ObjectMapper();

			// JSON 응답 문자열
			String jsonResponseString = jsonResponse.toString(); // 여기에 실제 JSON 응답 문자열을 넣어야 합니다.

			// JSON 문자열을 JSONObject로 변환
			JSONObject jsonResponse1 = new JSONObject(jsonResponseString);

			// LandmarkApiVO2 객체 생성
			LandmarkApiVO2 landmark = new LandmarkApiVO2();

			// "response" > "body" > "items" > "item" 경로를 따라가서 값들을 가져옴
			JSONObject item = jsonResponse1.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONObject("item");

			// overview 설정
			String overviewValue = item.getString("overview");
			landmark.setOverview(overviewValue);
			landmark.setAddr1(item.getString("addr1"));
			landmark.setTitle(item.getString("title"));
			landmark.setFirstImage2(item.getString("firstimage2"));
			
			// "mapx"와 "mapy"는 숫자이므로 getString 대신 getDouble을 사용
			landmark.setMapx(Double.toString(item.getDouble("mapx")));
			landmark.setMapy(Double.toString(item.getDouble("mapy")));

			landmark.setTel(item.getString("tel"));
			landmark.setHomepage(item.getString("homepage"));
			// 나머지 필드들도 필요에 따라 추가

			// landmark 객체를 사용하거나 반환하면 됩니다.
			System.out.println(landmark);

			return landmark;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Response {
		// 'header', 'body', 등 필드들은 그대로 두세요.
	}

	private static String sendHttpRequest(String apiUrl) throws Exception {
		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("GET");

		int responseCode = conn.getResponseCode();

		if (responseCode == HttpURLConnection.HTTP_OK) {
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder response = new StringBuilder();
			String inputLine;

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}

			in.close();

			return response.toString();
		} else {
			throw new RuntimeException("HTTP GET 요청이 실패했습니다. 응답 코드: " + responseCode);
		}
	}

	private static JSONObject convertXmlToJson(String xml) {
		return XML.toJSONObject(xml);
	}
}