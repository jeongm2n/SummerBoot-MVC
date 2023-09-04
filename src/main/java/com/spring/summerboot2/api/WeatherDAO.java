package com.spring.summerboot2.api;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class WeatherDAO {

    String skey = "f4CnjhqW4Ekv2mXBwujW%2BT%2BZBT9yOjcJxhMTlSaJ0VpqbC8exBnefo%2BJ2OtUbw0wjzVqiJs8jrdH2Afj75PDzg%3D%3D";

    //당일 날씨 정보 가져오기
    public List<WeatherVO> getOneday(String today, String nx, String ny) throws IOException, ParseException {
        //today는 20230817과 같은 형태로, nx, ny는 좌표 정보입니다!!
        /*단기예보조회 URL*/
        String urlBuilder = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst" + "?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + skey + /*Service Key*/
                "&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8") + /*페이지번호*/
                "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8") + /*한 페이지 결과 수*/
                "&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8") + /*요청자료형식(XML/JSON) Default: XML*/
                "&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(today, "UTF-8") + "&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode("0200", "UTF-8") + /*02시 발표(정시단위) */
                "&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode("60", "UTF-8") + /*예보지점의 X 좌표값*/
                "&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode("127", "UTF-8"); /*예보지점의 Y 좌표값*/
        URL url = new URL(urlBuilder);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
        System.out.println(sb);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(sb);
        JSONObject response = (JSONObject) jsonObject.get("response");
        JSONObject body = (JSONObject) response.get("body");
        JSONObject items = (JSONObject) body.get("items");
        JSONArray item = (JSONArray) items.get("item");

        String fcstDate = today;
        String time = "";
        String pop = "";

        List<WeatherVO> oneday = new ArrayList<>();
        for (Object o : item) {
            JSONObject data = (JSONObject) o;
            if (data.get("fcstDate").equals(fcstDate)) { //날짜가 오늘날짜일때
                for (int a = 9; a <= 23; a++) {
                    String onTime = String.format("%02d", a) + "00";
                    if (data.get("fcstTime").equals(onTime)) { //9시~23시 정각시간
                        if (data.get("category").equals("POP")) { //카테고리가 POP(강수확률)
                            time = (String) data.get("fcstTime");
                            pop = (String) data.get("fcstValue");
                            System.out.println(time + " : " + pop);
                            WeatherVO temp = new WeatherVO();
                            temp.setTime(time);
                            temp.setPop(pop);
                            oneday.add(temp);
                        }
                    }
                }
            }
        }

        return oneday;
    }

    //3일의 정보 가져오기
    public List<WeatherVO> get3Days(String today) throws IOException, ParseException {
        /*단기예보조회 URL*/
        String urlBuilder = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst" + "?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + skey + /*Service Key*/
                "&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8") + /*페이지번호*/
                "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8") + /*한 페이지 결과 수*/
                "&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8") + /*요청자료형식(XML/JSON) Default: XML*/
                "&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(today, "UTF-8") + "&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode("0200", "UTF-8") + /*02시 발표(정시단위) */
                "&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode("60", "UTF-8") + /*예보지점의 X 좌표값*/
                "&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode("127", "UTF-8"); /*예보지점의 Y 좌표값*/
        URL url = new URL(urlBuilder);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(sb);
        JSONObject response = (JSONObject) jsonObject.get("response");
        JSONObject body = (JSONObject) response.get("body");
        JSONObject items = (JSONObject) body.get("items");
        JSONArray item = (JSONArray) items.get("item");

        System.out.println(item);
        List<WeatherVO> days3 = new ArrayList<>();

        String fcstDate = today; //처음엔 오늘 날짜를 기본으로 설정.
        String ampop = "";
        String pmpop = "";
        String tmn = "";
        double convert;
        String tmx = "";

        for (int i = 0; i < item.size(); i++) { //JSONArray를 돌면서 값을 뽑아올 반복문
            JSONObject data = (JSONObject) item.get(i);
            String str1 = (String) data.get("fcstDate"); //예보날짜(fsctDate)를 비교할 str1 변수
            if (fcstDate.equals(str1)) { //API 데이터 보시면 한 날짜에도 다른 시간대에 따라 정보가 엄청 많아서 같은 날짜의 정보끼리 구별하기 위해서 조건문 삽입
                if (data.get("fcstTime").equals("0600")) {
                    //최저온도인 TMN은 0600에만 발표되기때문에 편의성을 위해 0600에 최저온도, 강수확률(POP)까지 같이 뽑아옴
                    if (data.get("category").equals("POP")) {
                        ampop = (String) data.get("fcstValue"); //예보시간이 0600이기 때문에 오전의 강수확률을 ampop에 저장
                        System.out.println("ampop : " + ampop);
                    } else if (data.get("category").equals("TMN")) {
                        tmn = (String) data.get("fcstValue"); //최저온도를 TMN에 저장
                        convert = Double.parseDouble(tmn);
                        tmn = Integer.toString((int) convert);
                        System.out.println("tmn : " + tmn);
                    }
                } else if (data.get("fcstTime").equals("1500")) {
                    //최고온도인 TMX는 1500에만 발표되기때문에 편의성을 위해 1500에 최고온도, 강수확률(POP)까지 같이 뽑아옴
                    if (data.get("category").equals("POP")) {
                        pmpop = (String) data.get("fcstValue"); //오후의 강수확률을 pmpop에 저장
                        System.out.println("pmpop : " + pmpop);
                    } else if (data.get("category").equals("TMX")) {
                        tmx = (String) data.get("fcstValue"); //최고온도를 tmx에 저장
                        convert = Double.parseDouble(tmx);
                        tmx = Integer.toString((int) convert);
                        System.out.println("tmx : " + tmx);
                    }
                }
            } else { //예보날짜(fsctDate)가 바뀌면 ((ex).20230817에서 20230818로 바뀌면)
                //20230817의 날씨 예보 정보를 List인 days3에 저장
                //(계속 반복하면서 3일 동안의 예보날짜,오전,오후강수확률,최고,최저온도 정보를 저장!!)
                WeatherVO weather = new WeatherVO(fcstDate, ampop, pmpop, tmx, tmn);
                //list = [{date: , ampop: , pmpop: , tmx: , tmn: }]형태로 만들기 위함
                days3.add(weather);

                fcstDate = str1;
            }
        }

        return days3;
    }

    public List<WeatherVO> get4Days(String today) throws IOException, ParseException {//4~7일까지의 날씨 정보를 가져오기 위한 함수

        /*중기육상정보조회URL*/
        String urlBuilder1 = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst" + "?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + skey + /*Service Key*/
                "&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8") + /*페이지번호*/
                "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8") + /*한 페이지 결과 수*/
                "&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8") + /*요청자료형식(XML/JSON)Default: XML*/
                "&" + URLEncoder.encode("regId", "UTF-8") + "=" + URLEncoder.encode("11B10101", "UTF-8") + /*11B0000 서울, 인천, 경기도 11D10000 등 (활용가이드 하단 참고자료 참조)*/
                "&" + URLEncoder.encode("tmFc", "UTF-8") + "=" + URLEncoder.encode(today + "0600", "UTF-8"); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력 YYYYMMDD0600 (1800)-최근 24시간 자료만 제공*/
        URL url1 = new URL(urlBuilder1);
        HttpURLConnection conn1 = (HttpURLConnection) url1.openConnection();
        conn1.setRequestMethod("GET");
        conn1.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn1.getResponseCode());
        BufferedReader rd1;
        if (conn1.getResponseCode() >= 200 && conn1.getResponseCode() <= 300) {
            rd1 = new BufferedReader(new InputStreamReader(conn1.getInputStream()));
        } else {
            rd1 = new BufferedReader(new InputStreamReader(conn1.getErrorStream()));
        }
        String sb1 = "";
        String line1;
        while ((line1 = rd1.readLine()) != null) {
            sb1 += line1;
        }
        rd1.close();
        conn1.disconnect();

        /*중기기온조회URL*/
        String urlBuilder2 = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa" + "?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + skey + /*Service Key*/
                "&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8") + /*페이지번호*/
                "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8") + /*한 페이지 결과 수*/
                "&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8") + /*요청자료형식(XML/JSON)Default: XML*/
                "&" + URLEncoder.encode("regId", "UTF-8") + "=" + URLEncoder.encode("11B10101", "UTF-8") + /*11B10101 서울, 11B20201 인천 등 ( 별첨엑셀자료 참고)*/
                "&" + URLEncoder.encode("tmFc", "UTF-8") + "=" + URLEncoder.encode(today + "0600", "UTF-8"); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력- YYYYMMDD0600(1800) 최근 24시간 자료만 제공*/
        URL url2 = new URL(urlBuilder2);
        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
        conn2.setRequestMethod("GET");
        conn2.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn2.getResponseCode());
        BufferedReader rd2;
        if (conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
        } else {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
        }
        String sb2 = "";
        String line2;
        while ((line2 = rd2.readLine()) != null) {
            sb2 += line2;
        }
        rd2.close();
        conn2.disconnect();

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(sb1);
        JSONObject response = (JSONObject) jsonObject.get("response");
        JSONObject body = (JSONObject) response.get("body");
        JSONObject items = (JSONObject) body.get("items");
        JSONArray item = (JSONArray) items.get("item");

        String[] ampop = new String[4];
        String[] pmpop = new String[4];

        JSONObject data = (JSONObject) item.get(0);
        for (int i = 0; i < 4; i++) {
            Long rnStAm = (Long) data.get("rnSt" + (i + 4) + "Am"); //오전의 강수확률 ex)40.0 형태라서 정수형으로 변환
            Long rnStPm = (Long) data.get("rnSt" + (i + 4) + "Pm"); //오후의 강수확률

            // 숫자 값을 문자열로 변환 후 저장
            ampop[i] = rnStAm.toString();
            pmpop[i] = rnStPm.toString();
        }

        jsonObject = (JSONObject) jsonParser.parse(sb2);
        response = (JSONObject) jsonObject.get("response");
        body = (JSONObject) response.get("body");
        items = (JSONObject) body.get("items");
        item = (JSONArray) items.get("item");

        String[] tmn = new String[4];
        String[] tmx = new String[4];

        data = (JSONObject) item.get(0);
        for (int i = 0; i < 4; i++) {
            Long taMin = (Long) data.get("taMin" + (i + 4)); //최저온도 ex)21.0 형태라서 정수형으로 변환
            Long taMax = (Long) data.get("taMax" + (i + 4)); //최고온도

            tmn[i] = taMin.toString();
            tmx[i] = taMax.toString();
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        LocalDate date = LocalDate.parse(today, formatter);


        List<WeatherVO> days4 = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            Period periodToAdd = Period.ofYears(0).plusMonths(0).plusDays(i + 3);
            LocalDate newDate = date.plus(periodToAdd);

            String formattedNewDate = newDate.format(formatter);

            WeatherVO weather = new WeatherVO(formattedNewDate, ampop[i], pmpop[i], tmx[i], tmn[i]);
            days4.add(weather);
        }

        return days4;
    }
}
