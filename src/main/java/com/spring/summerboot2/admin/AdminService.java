package com.spring.summerboot2.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.summerboot2.branch.WashlistDAO;
import com.spring.summerboot2.branch.WashlistVO;
import com.spring.summerboot2.community.InquiryVO;
import com.spring.summerboot2.member.MemberDAO;
import com.spring.summerboot2.member.MemberVO;
import com.spring.summerboot2.shop.ProductVO;
import com.spring.summerboot2.reservation.*;

@Service
public class AdminService {
	public List<MemberVO> userList(String searchCon, String search, String E_YN, int start) {
		MemberDAO member = new MemberDAO();
		return member.userList(searchCon, search, E_YN, start);
	}
	
	public int userCnt(String searchCon, String search, String E_YN) {
		MemberDAO member = new MemberDAO();
		return member.userCnt(searchCon, search, E_YN);
	}
	
	public List<WashlistVO> washList() {
		WashlistDAO washlist = new WashlistDAO();
		return washlist.washList();
	}
	
	public List<ProductVO> productList() {
		AdminDAO dao = new AdminDAO();
		return dao.productList();
	}
	
	public boolean addProduct(ProductVO vo) {
		AdminDAO dao = new AdminDAO();
		return dao.addProduct(vo);
	}
	
	public boolean addStore(WashlistVO vo) {
		AdminDAO dao = new AdminDAO();
		return dao.addStore(vo);
	}
	
	public boolean overlappedName(String name) {
		AdminDAO dao = new AdminDAO();
		return dao.overlapped(name);
	}
	
	public boolean updateStore(WashlistVO vo) {
		AdminDAO dao = new AdminDAO();
		return dao.update(vo);
	}
	
	public boolean updateStoreImg(WashlistVO vo) {
		AdminDAO dao = new AdminDAO();
		return dao.updateImg(vo);
	}
	
	public boolean deleteStore(int no) {
		AdminDAO dao = new AdminDAO();
		return dao.deleteStore(no);
	}
	
	public List<ReservationVO> reservationList(int no, String res_date){
		ReservationDAO resdao = new ReservationDAO();
		return resdao.showresList(no,res_date);
	}
	
	public int deleteres(int res_no) {
		ReservationDAO resDAO = new ReservationDAO();
		int result = resDAO.deleteres(res_no);
		return result;
	}

	public boolean deleteUser(String id) {
		AdminDAO dao = new AdminDAO();
		return dao.deleteUser(id);
	}
	
	public List<OrderVO> orderList(){
		OrderDAO orderdao = new OrderDAO();
		return orderdao.orderList();
	}
	
	public List<OrderVO> filterOrderList(String column, String str){
		OrderDAO orderdao = new OrderDAO();
		return orderdao.filterOrderList(column,str);
	}
	
	public OrderVO Load_Account(String order_num) {
		OrderDAO orderdao = new OrderDAO();
		return orderdao.Load_Account(order_num);
	}
	
	public void add_tracking(String order_num, String tracking) {
		OrderDAO orderdao = new OrderDAO();
		orderdao.add_tracking(order_num, tracking);
	}

	public Map<String, Object> inquiry(int q_no) {
		AdminCommunityDAO dao = new AdminCommunityDAO();
		System.out.println("service == " + q_no);
		return dao.qna(q_no);
	}
	
	public List<InquiryVO> inquiryMain() {
		AdminCommunityDAO dao = new AdminCommunityDAO();
		return dao.inquiryMain();
	}
	
	public int inquiryCount() {
		AdminCommunityDAO dao = new AdminCommunityDAO();
		return dao.InquiryCount();
	}

	public List<InquiryVO> inquiryList(int start, String category, String searchCon, String search, String stateCon) {
		AdminCommunityDAO dao = new AdminCommunityDAO();
		return dao.inquiryList(start, category, searchCon, search, stateCon);
	}
	
	public int inquiryCount(String category, String searchCon, String search, String stateCon) {
		AdminCommunityDAO dao = new AdminCommunityDAO();
		return dao.InquiryCount(category, searchCon, search, stateCon);
	}
	
	public int deleteInquiry(int q_no) {
		AdminCommunityDAO dao = new AdminCommunityDAO();
		return dao.deleteInquiry(q_no);
	}
	
	public int update(InquiryVO vo) {
		AdminCommunityDAO dao = new AdminCommunityDAO();
		return dao.update(vo);
	}
	
	public List<Integer> reserCount() {
		AdminDAO dao = new AdminDAO();
		return dao.reserCount();
	}
	
	public List<Integer> orderMonthSum() {
		AdminDAO dao = new AdminDAO();
		return dao.orderMonthSum();
	}
	
	public Map<String, Integer> storePerRes() {
		AdminDAO dao = new AdminDAO();
		return dao.storePerRes();
	}
	
	public List<String> storeName() {
		AdminDAO dao = new AdminDAO();
		return dao.storeName();
	}
	
	public List<Integer> inquiryCnt() {
		AdminDAO dao = new AdminDAO();
		return dao.inquiryCnt();
	}
}
