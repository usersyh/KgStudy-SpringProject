package com.spring.kgstudy.order.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.kgstudy.order.dao.OrderDAO;
import com.spring.kgstudy.order.vo.OrderVO;

import lombok.RequiredArgsConstructor;

@Service

public class IamportService {

	

	private static String restApiKey = "8446781520557308";
	private static String restApiSecret = "7QOYTGyUqUBBztr9audqIlGAmE2YcafD0MOPcjB8ZH0MJorIdA1rHqgSvgcw9A1qUV5DvL2Zwd5DGLws";

	
	//Access Token 발급
	public String getAccessToken() throws Exception {

		String reqUri = "https://api.iamport.kr/users/getToken";

		URL url = new URL(reqUri);

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("POST");

		conn.setRequestProperty("Content-type", "application/json");

		conn.setDoOutput(true);

		sendAccessTokenRequest(conn);

		try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {

			String responseData = br.readLine();
			System.out.println("response : " + responseData);

			JsonElement resEl = (JsonElement) JsonParser.parseString(responseData);

			JsonObject object = resEl.getAsJsonObject();
			JsonObject response = object.get("response").getAsJsonObject();
			String accessToken = response.get("access_token").getAsString();

			System.out.println(accessToken);

			return accessToken;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	
	
	
	//AccessToken 발급 요청
	private static void sendAccessTokenRequest(HttpURLConnection conn) throws IOException {

		try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))) {

			Map<String, String> reqMap = new HashMap<String, String>();

			reqMap.put("imp_key", restApiKey);
			reqMap.put("imp_secret", restApiSecret);

			String req = new Gson().toJson(reqMap);

			bw.write(req);

			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("response code : " + responseCode);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
	//결제정보 요청
	public int getPaymentsInfo(String impUid, String accessToken) {

		String reqUri = "https://api.iamport.kr/payments/" + impUid;

		try {
			URL url = new URL(reqUri);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			String author = "Bearer " + accessToken;

			conn.setRequestMethod("GET");
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setRequestProperty("Authorization", author);
			conn.setRequestProperty("Content-type", "application/json");

			conn.setDoInput(true);

//			System.out.println(conn.getRequestProperty("Authorization"));
			int responseCode = conn.getResponseCode();
//			System.out.println("info response :" + responseCode);

			// 응답 데이터 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String responseData = br.readLine();

			JsonElement resEl = (JsonElement) JsonParser.parseString(responseData);

			JsonObject object = resEl.getAsJsonObject();

			JsonObject response = object.get("response").getAsJsonObject();

			int amount = response.get("amount").getAsInt();

			return amount;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

	
	
	//환불 요청
	public int refundOrder(OrderVO order, String accessToken) {
		
		
		int result=1;
		
		
		try {

			
			String reqUri = "https://api.iamport.kr/payments/cancel";
			String author = "Bearer " + accessToken;

			String impUid = order.getImpUid();
			String amount = ""+order.getOrderPrice();
			
			URL url = new URL(reqUri);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", author);
			conn.setRequestProperty("Content-type", "application/json");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			Map<String, String> reqMap = new HashMap<String, String>();
			
		
			reqMap.put("imp_uid", impUid);

			reqMap.put("amount", amount);
			reqMap.put("checksum", amount);

			String req = new Gson().toJson(reqMap);

			bw.write(req);

			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("response code : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String responseData = br.readLine();
			

			JsonElement resEl = (JsonElement) JsonParser.parseString(responseData);

			System.out.println("res : "+resEl.toString());
			JsonObject object = resEl.getAsJsonObject();
			result = object.get("code").getAsInt();
//			
//			
//			
//			
//			if (result==0) {
//			System.out.println(object.toString());
//			
//			
//		
//			
//			
//			
//			
//			if(dao.deleteOrder(impUid)) {
//				msg="refund-success";
//				
//			}else {
//				msg="delete-faild";
//				
//			}
//			
//			
//			
//			}else {
//				
//			
//				msg="refund-faild";
//		
//			}
//			
			
		
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	
}
