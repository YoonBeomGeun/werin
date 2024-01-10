/*
 * package com.multi.werin.main; import java.io.BufferedReader; import
 * java.io.IOException; import java.io.InputStreamReader; import
 * java.net.HttpURLConnection; import java.net.URL; import java.net.URLEncoder;
 * 
 * import org.json.JSONObject; import org.json.XML;
 * 
 * 일단 이건 보류 pom에서 json 추가해야함
 * 
 * public class test { public static void main(String[] args) throws IOException
 * { StringBuilder urlBuilder = new StringBuilder(
 * "http://data.jeju.go.kr/rest/JejuLdapsDataService/getForecastPointDataXY");
 * URL urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") +
 * "=aPfEjmyFEWldT%2F6swKYEIBeFnHViz0HDF7F4rZb%2FO4C927BQ5p8c1aI1Ai1G%2B%2BO%2BtcQu%2BFPg1X18vZee4I5RXg%3D%3D"
 * ); Service Key urlBuilder.append("&" + URLEncoder.encode("baseDate","UTF-8")
 * + "=" + URLEncoder.encode("20240109", "UTF-8")); 생성일자 * 데이터 범위: 현재 ~ 과거 3일
 * urlBuilder.append("&" + URLEncoder.encode("baseTime","UTF-8") + "=" +
 * URLEncoder.encode("0300", "UTF-8")); 생성시간 urlBuilder.append("&" +
 * URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("53", "UTF-8"));
 * 예보지점 X 좌표 urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" +
 * URLEncoder.encode("4", "UTF-8")); 예보지점 Y 좌표 urlBuilder.append("&" +
 * URLEncoder.encode("hgtLevel","UTF-8") + "=" + URLEncoder.encode("0",
 * "UTF-8")); 고도 레벨 urlBuilder.append("&" +
 * URLEncoder.encode("pageSize","UTF-8") + "=" + URLEncoder.encode("1",
 * "UTF-8")); 페이지 크기 urlBuilder.append("&" +
 * URLEncoder.encode("startPage","UTF-8") + "=" + URLEncoder.encode("1",
 * "UTF-8")); 시작 페이지 URL url = new URL(urlBuilder.toString()); HttpURLConnection
 * conn = (HttpURLConnection) url.openConnection();
 * conn.setRequestMethod("GET"); conn.setRequestProperty("Content-type",
 * "application/json"); System.out.println("Response code: " +
 * conn.getResponseCode()); BufferedReader rd; if(conn.getResponseCode() >= 200
 * && conn.getResponseCode() <= 300) { rd = new BufferedReader(new
 * InputStreamReader(conn.getInputStream())); } else { rd = new
 * BufferedReader(new InputStreamReader(conn.getErrorStream())); } StringBuilder
 * sb = new StringBuilder(); String line; while ((line = rd.readLine()) != null)
 * { sb.append(line); } rd.close(); conn.disconnect(); //
 * System.out.println(sb.toString()); JSONObject json1 =
 * XML.toJSONObject(sb.toString()); System.out.println(json1); //{response:
 * {header: {}, body{items:[{item: {}, item: {}, ....]}}} JSONObject rfcOpenApi
 * = json1.getJSONObject("rfcOpenApi"); //System.out.println(response);
 * JSONObject body = rfcOpenApi.getJSONObject("body"); System.out.println(body);
 * } }
 */