package com.today.bab.admin.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.today.bab.admin.model.dao.AdminDao;
import com.today.bab.admin.model.vo.AdminItemOrder;
import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminQnaAll;
import com.today.bab.admin.model.vo.AdminSellItem;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.admin.model.vo.AdminTotalData;
import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.admin.model.vo.CqAnswer;
import com.today.bab.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	private AdminDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public AdminServiceImpl(AdminDao dao,SqlSessionTemplate session) {
		this.dao=dao;
		this.session=session;
	}
	
	@Override
	public List<Member> adminMembers(Map<String, Integer> param) {
		return dao.adminMembers(session, param);
	}

	@Override
	public int selectMemberListCount() {
		return dao.selectMemberListCount(session);
	}

	@Override
	public AdminMember adminmemberInfo(String id) {
		return dao.adminmemberInfo(session, id);
	}

	@Override
	public List<AdminSubscription> adminSubscription(String id) {
		return dao.adminSubscription(session,id);
	}

	@Override
	public int adminDeleteMember(String memberId) {
		return dao.adminDeleteMember(session,memberId);
	}

	@Override
	public List<AdminMaster> adminMaster(Map<String, Integer> param) {
		return dao.adminMaster(session, param);
	}

	@Override
	public int selectMasterListCount() {
		return dao.selectMasterListCount(session);
	}
	
	@Override
	public int selectMasterIngListCount() {
		return dao.selectMasterIngListCount(session);
	}
	
	@Override
	public int selectMasterAllListCount() {
		return dao.selectMasterAllListCount(session);
	}
	
	@Override
	public AdminMaster adminMasterInfo(String teachername) {
		return dao.adminMasterInfo(session, teachername);
	}

	@Override
	public int masterDelete(AdminMaster m) {
		return dao.masterDelete(session,m);
	}
	
	@Override
	public int masterDelete2(String memberId) {
		return dao.masterDelete2(session,memberId);
	}

	@Override
	public int masterTestEnd(AdminMaster m) {
		return dao.masterTestEnd(session,m);
	}

	@Override
	public List<ClientQNA> selectQnAList(Map<String, Integer> param) {
		return dao.selectQnAList(session, param);
	}

	@Override
	public int selectQnACount() {
		return dao.selectQnACount(session);
	}

	@Override
	public ClientQNA selectQna(int cqNo) {
		return dao.selectQna(session,cqNo);
	}
	
	@Override
	public int insertqnaAnswer(CqAnswer cq) {
		return dao.insertqnaAnswer(session,cq);
	}

	@Override
	public int updateClientQNA(int cqNo) {
		return dao.updateClientQNA(session,cqNo);
	}

	@Override
	public List<AdminQnaAll> adminQnAAll(Map<String,Integer> param) {
		return dao.adminQnAAll(session,param);
	}
	
	@Override
	public List<AdminQnaAll> adminQnAOneDay(Map<String,Integer> param) {
		return dao.adminQnAOneDay(session,param);
	}

	@Override
	public List<AdminQnaAll> adminQnAMarket(Map<String,Integer> param) {
		return dao.adminQnAMarket(session,param);
	}
	
	@Override
	public int adminQnAAllCount() {
		return dao.adminQnAAllCount(session);
	}

	@Override
	public int qnAMarketCount() {
		return dao.qnAMarketCount(session);
	}

	@Override
	public int qnAOnedayCount() {
		return dao.qnAOnedayCount(session);
	}

	@Override
	public List<AdminItemOrder> adminRefund(Map<String, Integer> param) {
		return dao.adminRefund(session, param);
	}

	@Override
	public int adminRefundCount() {
		return dao.adminRefundCount(session);
	}

	@Override
	public AdminItemOrder selectcancelOrder(String merchant_uid) {
		return dao.selectcancelOrder(session,merchant_uid);
	}
	
	//환불처리를 위한 토큰발급
	public String getToken() throws IOException {

		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/users/getToken");

		String token="";
		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST"); //요청방식
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json"); //서버로부터 받을 Data를 JSON형식 타입으로 요청함
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", "4227012214583876");
		json.addProperty("imp_secret", "t5EJ4YwyrekonfXUboxNpS0JVZzdgVpHlsDGdA4a6xPRVQ8gjqhDN2n8EK3qrPGYxcpcx3av85Zb4v7E");
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	//발급받은 토큰과 결제정보를 통해 아임포트API에 환불처리요청
	public void payMentCancle(String access_token, String imp_uid, int amount, String reason) throws IOException  {
		
		HttpsURLConnection conn = null;
		
		URL url = new URL("https://api.iamport.kr/payments/cancel");
 
		conn = (HttpsURLConnection) url.openConnection();
 
		conn.setRequestMethod("POST");
 
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);
 
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
 
		json.addProperty("reason", reason);
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", amount);
		json.addProperty("checksum", amount);
 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		br.close();
		conn.disconnect();
	}

	@Override
	public int updateItemOrder(AdminItemOrder updateItemOrder) {
		return dao.updateItemOrder(session,updateItemOrder);
	}

	@Override
	public int insertPoint(AdminItemOrder updatePoint) {
		return dao.insertPoint(session,updatePoint);
	}

	@Override
	public List<AdminTotalData> adminTotalData() {
		return dao.adminTotalData(session);
	}

	@Override
	public List<AdminSellItem> adminProductList(Map<String, Integer> param) {
		return dao.adminProductList(session, param);
	}

	@Override
	public int adminProductCount() {
		return dao.adminProductCount(session);
	}

	@Override
	public List<Member> memberSearchClass(Map<String, Object> param) {
		return dao.memberSearchClass(session,param);
	}

	@Override
	public int memberSearchClassCount(Map<String, Object> param) {
		return dao.memberSearchClassCount(session,param);
	}

	@Override
	public List<AdminMaster> masterSearchClass(Map<String, Object> param) {
		return dao.masterSearchClass(session,param);
	}

	@Override
	public int masterSearchClassCount(Map<String, Object> param) {
		return dao.masterSearchClassCount(session,param);
	}

	
	
	
	
}
