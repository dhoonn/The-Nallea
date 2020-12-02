package com.icia.thenale.api;
/* Java 샘플 코드 */
import java.io.InputStreamReader;		
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dto.AirDTO;

import java.io.BufferedReader;
import java.io.IOException;

;public class ApiExplorer {
	@Autowired
	private static ModelAndView mav;
	
    public static List<AirDTO> main(String[] args) throws IOException {
    	mav = new ModelAndView();
        StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=Arzz1H8wpBItH301DgyPDCpfdUYkVScNrgggkKF5Jhi%2BcuZQX6dUbG1zByd8AtZkJPcoph6l5tdIkQ18zsu0FA%3D%3D"); /*Service Key*/
		
		  System.out.println("출발공항:"+args[0]+"도착공항:"+args[1]+"출발날짜"+args[2]);
		  String depAirportId = args[0];
		  String arrAirportId = args[1];
		  String startDate = args[2];
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("depAirportId","UTF-8") + "=" + depAirportId); /*출발공항ID*/
        urlBuilder.append("&" + URLEncoder.encode("arrAirportId","UTF-8") + "=" + arrAirportId); /*도착공항ID*/
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + startDate); /*출발일*/
        urlBuilder.append("&" + URLEncoder.encode("airlineId","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*항공사ID*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        // 위에서는 입력값으로 해당 url에 가서 조건에 맞는 데이터를 수집?함         
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        // 수집한 데이터가 200이상, 300이하라면 rd에 저장함,,, 300을 넘으면 에러임 ㅅㄱ;
        // rd를 readLine 했을때 null이 아니면, Stringbuilder를 이용하여 line에 다 붙이고,, sysout때림ㅅㄱ;
        StringBuilder sb = new StringBuilder();
        String line;        
        while ((line = rd.readLine()) != null) {
        	sb.append(line); }
		
        rd.close();
        conn.disconnect();
        
        
        /* StringUtils을 이용하여 데이터를 추출, 가공할거임 ㅅㄱ;
         * 1.  StringBetween()을 이용하여서 [첫번째] <item>의 세부항목 추출 및 저장 
         * 2.  StringAfter()를 이용하여 첫번째 </item>이후의 string덩어리를 return
         * 3.  (1)반복
         */
        String source = sb.toString(); //스트링 빌더안의 문자열을 string화 시켜서 source에 저장
		
		/*
		 * String count =
		 * StringUtils.substringBetween(source,"<numOfRows>","</numOfRows>");
		 */
        
        String target = source;
        String regEx = "<item>";
        Pattern pat = Pattern.compile(regEx); 
        Matcher match = pat.matcher(target);
        
        int matchCount = 0;
        while (match.find()) {
            System.out.println(matchCount + " : " + match.group());
            matchCount++;
        }
        System.out.println("총 개수 : " + matchCount);
        
        
		int endNum = matchCount;        
        // 추출값 저장할 DTOlist 생성
        List<AirDTO> airList = new ArrayList<AirDTO>();
        //추출
        for(int i=0; i<endNum; i++) {
        source = StringUtils.substringAfter(source, "<item>");
        String a_title = StringUtils.substringBetween(source, "<airlineNm>","</airlineNm>");
        String a_startplace = StringUtils.substringBetween(source, "<depAirportNm>","</depAirportNm>");
        String a_startdate = StringUtils.substringBetween(source, "<depPlandTime>","</depPlandTime>");
        String a_endplace = StringUtils.substringBetween(source, "<arrAirportNm>","</arrAirportNm>");
        String a_enddate = StringUtils.substringBetween(source, "<arrPlandTime>","</arrPlandTime>");
        String a_eprice = StringUtils.substringBetween(source, "<economyCharge>","</economyCharge>");
        String a_bprice = StringUtils.substringBetween(source, "<prestigeCharge>","</prestigeCharge>");
        String a_name = StringUtils.substringBetween(source, "<vihicleId>","</vihicleId>");
        //첫번째 <item> 세부추출 [끝]
        System.out.println((i+1)+"  항공사 이름 : "+a_title);
        System.out.println("출발지 : "+a_startplace);        
        System.out.println("도착지 : "+a_endplace);
        System.out.println("출발시각 : "+a_startdate);
        System.out.println("도착시각 : "+a_enddate);
        System.out.println("이코노미가격 : "+a_eprice);
        System.out.println("비즈니스가격 : "+a_bprice);
        System.out.println("기체 이름 : "+a_name);
        
        //저장
        if(a_eprice!="null" && a_bprice!="null") {
        AirDTO aDTO = new AirDTO();
        aDTO.setA_title(a_title);
        aDTO.setA_startplace(a_startplace);
        aDTO.setA_endplace(a_endplace);
        aDTO.setA_startdate(a_startdate);
        aDTO.setA_enddate(a_enddate);
        aDTO.setA_eprice(a_eprice);
        aDTO.setA_bprice(a_bprice);
        aDTO.setA_name(a_name);
        airList.add(aDTO);
        }//저장끝
        }//for끝
		
        // 가공과정 [끝]
        return airList;
    }
}


