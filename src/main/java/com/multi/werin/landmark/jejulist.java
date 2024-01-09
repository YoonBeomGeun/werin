/*
 * package com.multi.werin.landmark;
 * 
 * import com.fasterxml.jackson.databind.JsonNode; // 주석 처리할 부분 import
 * com.fasterxml.jackson.databind.ObjectMapper; // 주석 처리할 부분
 * 
 * import java.io.BufferedReader; import java.io.IOException; import
 * java.io.InputStreamReader; import java.net.HttpURLConnection; import
 * java.net.URL;
 * 
 * public class jejulist {
 * 
 * static String apiKey =
 * "gRjisabrZIfabIjre8qnZIy4ig724PgKzbxWE5KdbOHL4SD%2FneKsnNw2phKHIowgD5NXuBRaTpMEvSAY2uTA1Q%3D%3D";
 * 
 * public static void main(String[] args) { try { int numOfRows = 10; int pageNo
 * = 1;
 * 
 * String apiUrl = "https://apis.data.go.kr/B551011/KorService1/" +
 * "areaBasedList1?" + "MobileOS=ETC&MobileApp=Test" + "&ServiceKey=" + apiKey +
 * "&listYN=Y&arrange=A&contentTypeId=&areaCode=39&sigunguCode=&cat1=A01&cat2=A0101&cat3=A01010200"
 * + "&_type=json&pageNo=" + pageNo + "&numOfRows=" + numOfRows;
 * 
 * String jsonContent = requestAPI(apiUrl);
 * 
 * // 응답이 없거나 빈 데이터일 경우 중단 if (jsonContent.isEmpty()) {
 * System.out.println("API 응답이 없거나 빈 데이터입니다."); return; }
 * 
 * // JSON 데이터를 파싱하여 출력 printJsonData(jsonContent); } catch (IOException e) {
 * e.printStackTrace(); } }
 * 
 * private static String requestAPI(String apiUrl) throws IOException {
 * StringBuilder content = new StringBuilder(); URL url = new URL(apiUrl);
 * HttpURLConnection connection = (HttpURLConnection) url.openConnection();
 * connection.setRequestMethod("GET");
 * 
 * int responseCode = connection.getResponseCode();
 * 
 * if (responseCode == HttpURLConnection.HTTP_OK) { BufferedReader in = new
 * BufferedReader(new InputStreamReader(connection.getInputStream())); String
 * inputLine;
 * 
 * while ((inputLine = in.readLine()) != null) { content.append(inputLine); }
 * in.close(); } else { System.out.println("API 호출 실패. 응답 코드: " + responseCode);
 * }
 * 
 * connection.disconnect();
 * 
 * return content.toString(); }
 * 
 * private static void printJsonData(String json) throws IOException {
 * //ObjectMapper objectMapper = new ObjectMapper(); JsonNode rootNode =
 * objectMapper.readTree(json);
 * 
 * // Pretty Printer 적용 String prettyJson =
 * objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(rootNode);
 * 
 * // 이 부분에서 필요한 JSON 데이터를 추출하여 사용하면 됩니다. // 예를 들어, 특정 필드를 출력하는 경우: String
 * resultCode =
 * rootNode.path("response").path("header").path("resultCode").asText();
 * System.out.println("Result Code: " + resultCode);
 * 
 * // 가독성 좋은 JSON 출력 System.out.println("Pretty JSON Response: " + prettyJson);
 * } }
 */