package com.spring.summerboot2.api;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.util.ArrayList;
import java.util.List;

public class WeatherDAO {
	
	String skey = "f4CnjhqW4Ekv2mXBwujW%2BT%2BZBT9yOjcJxhMTlSaJ0VpqbC8exBnefo%2BJ2OtUbw0wjzVqiJs8jrdH2Afj75PDzg%3D%3D";
	
	//당일 날씨 정보 가져오기
	public List<WeatherVO> get1Day(String today, String nx, String ny) throws IOException, ParseException{
		//today는 20230817과 같은 형태로, nx, ny는 좌표 정보입니다!!
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /*단기예보조회 URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+skey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0200", "UTF-8")); /*02시 발표(정시단위) */
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /*예보지점의 Y 좌표값*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        String sb = "";
        String line;
        while ((line = rd.readLine()) != null) {
            sb += line;
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(sb);
		JSONObject response = (JSONObject)jsonObject.get("response");
		JSONObject body = (JSONObject)response.get("body");
		JSONObject items = (JSONObject)body.get("items");
		JSONArray item = (JSONArray)items.get("item");
		
		String fcstDate = today;
		String ampop = ""; //오전의 강수확률
		String pmpop = ""; //오후의 강수확률
		String tmn = ""; //최저기온
		String tmx = ""; //최고기온 
		
		for(int i=0; i<item.size(); i++) {
			JSONObject data = (JSONObject)item.get(i);
			if(((String)data.get("fcstDate")).equals(fcstDate)) {
				if(((String)data.get("fcstTime")).equals("0600")) { 
		    		//최저온도인 TMN은 0600에만 발표되기때문에 편의성을 위해 0600에 최저온도, 강수확률(POP)까지 같이 뽑아옴
		    		if(((String)data.get("category")).equals("POP")) {
		    			ampop = (String)data.get("fcstValue"); //예보시간이 0600이기 때문에 오전의 강수확률을 ampop에 저장
		    			System.out.println("ampop : "+ampop);
		    		}else if(((String)data.get("category")).equals("TMN")) { 
		    			tmn = (String)data.get("fcstValue"); //최저온도를 TMN에 저장
		    			System.out.println("tmn : "+tmn);
		    		}
		    	}else if(((String)data.get("fcstTime")).equals("1500")) { 
		    		//최고온도인 TMX는 1500에만 발표되기때문에 편의성을 위해 1500에 최고온도, 강수확률(POP)까지 같이 뽑아옴
		    		if(((String)data.get("category")).equals("POP")) {
		    			pmpop = (String)data.get("fcstValue"); //오후의 강수확률을 pmpop에 저장
		    			System.out.println("pmpop : "+pmpop);
		    		}else if(((String)data.get("category")).equals("TMX")) { 
		    			tmx = (String)data.get("fcstValue"); //최고온도를 tmx에 저장
		    			System.out.println("tmx : "+tmx);
		    		}
		    	}
			}else {break;}
		}
		
		List<WeatherVO> oneday = new ArrayList();
		WeatherVO weather = new WeatherVO(fcstDate, ampop, pmpop, tmx, tmn);
		oneday.add(weather);
		
		return oneday;
	}
	
	//3일의 정보 가져오기
	public List<WeatherVO> get3Days(String today, String nx, String ny) throws IOException, ParseException{
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /*단기예보조회 URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+skey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(today, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0200", "UTF-8")); /*02시 발표(정시단위) */
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /*예보지점의 Y 좌표값*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        String sb = "";
        String line;
        while ((line = rd.readLine()) != null) {
            sb += line;
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(sb);
		JSONObject response = (JSONObject)jsonObject.get("response");
		JSONObject body = (JSONObject)response.get("body");
		JSONObject items = (JSONObject)body.get("items");
		JSONArray item = (JSONArray)items.get("item");
		
		System.out.println(item);
		List<WeatherVO> days3 = new ArrayList();;
		
		String fcstDate = today; //처음엔 오늘 날짜를 기본으로 설정.
		String ampop = "";
		String pmpop = "";
		String tmn = "";
		String tmx = "";
		
		for (int i = 0; i < item.size(); i++) { //JSONArray를 돌면서 값을 뽑아올 반복문
		    JSONObject data = (JSONObject)item.get(i);
		    String str1 = (String)data.get("fcstDate"); //예보날짜(fsctDate)를 비교할 str1 변수
		    if(fcstDate.equals(str1)) { //API 데이터 보시면 한 날짜에도 다른 시간대에 따라 정보가 엄청 많아서 같은 날짜의 정보끼리 구별하기 위해서 조건문 삽입
		    	if(((String)data.get("fcstTime")).equals("0600")) { 
		    		//최저온도인 TMN은 0600에만 발표되기때문에 편의성을 위해 0600에 최저온도, 강수확률(POP)까지 같이 뽑아옴
		    		if(((String)data.get("category")).equals("POP")) {
		    			ampop = (String)data.get("fcstValue"); //예보시간이 0600이기 때문에 오전의 강수확률을 ampop에 저장
		    			System.out.println("ampop : "+ampop);
		    		}else if(((String)data.get("category")).equals("TMN")) { 
		    			tmn = (String)data.get("fcstValue"); //최저온도를 TMN에 저장
		    			System.out.println("tmn : "+tmn);
		    		}
		    	}else if(((String)data.get("fcstTime")).equals("1500")) { 
		    		//최고온도인 TMX는 1500에만 발표되기때문에 편의성을 위해 1500에 최고온도, 강수확률(POP)까지 같이 뽑아옴
		    		if(((String)data.get("category")).equals("POP")) {
		    			pmpop = (String)data.get("fcstValue"); //오후의 강수확률을 pmpop에 저장
		    			System.out.println("pmpop : "+pmpop);
		    		}else if(((String)data.get("category")).equals("TMX")) { 
		    			tmx = (String)data.get("fcstValue"); //최고온도를 tmx에 저장
		    			System.out.println("tmx : "+tmx);
		    		}
		    	}
		    }else { //예보날짜(fsctDate)가 바뀌면 ((ex).20230817에서 20230818로 바뀌면) 
		    	//20230817의 날씨 예보 정보를 List인 days3에 저장 
		    	//(계속 반복하면서 3일 동안의 예보날짜,오전,오후강수확률,최고,최저온도 정보를 저장!!)
		    	WeatherVO weather = new WeatherVO(fcstDate, ampop, pmpop, tmx, tmn);
		    	days3.add(weather);
		    	
		    	fcstDate = str1;
		    }
		}
		
		return days3;
	}
	
}
