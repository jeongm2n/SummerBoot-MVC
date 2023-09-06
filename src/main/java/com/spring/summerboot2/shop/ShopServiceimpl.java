package com.spring.summerboot2.shop;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public class ShopServiceimpl implements ShopService{
	public ArrayList<ProductVO> Load_Product(String category, int sort, int page) {
		ShopDAO shopdao = new ShopDAO();
		return shopdao.Load_Product(category, sort, page);
	}
	
	public int Load_Size() {
		ShopDAO shopdao = new ShopDAO();
		return shopdao.Load_Size();
	}
	
	public ArrayList<String> Load_Category(){
		ShopDAO shopdao = new ShopDAO();
		return shopdao.Load_Category();
	}
	
	public ProductVO Load_Product(String product_id) {
		ShopDAO shopdao = new ShopDAO();
		return shopdao.Load_Product(product_id);
	}
	
	public void Add_Cart(String id, int product_id, int quantity, int amount) {
		ShopDAO shopdao = new ShopDAO();
		 shopdao.Add_Cart(id, product_id, quantity, amount);
	}
	
	public ArrayList<ReviewVO> Load_Review(String product_id) {
		ShopDAO shopdao = new ShopDAO();
		return shopdao.Load_Review(product_id);
	}
}
