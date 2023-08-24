package com.spring.summerboot2.shop;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public class ShopServiceimpl implements ShopService{
	public ArrayList<ProductVO> Load_Product(String category, int sort) {
		ShopDAO shopdao = new ShopDAO();
		return shopdao.Load_Product(category, sort);
	}
	
	public ArrayList<String> Load_Category(){
		ShopDAO shopdao = new ShopDAO();
		return shopdao.Load_Category();
	}
	
	public ProductVO Load_Product(String product_id) {
		ShopDAO shopdao = new ShopDAO();
		return shopdao.Load_Product(product_id);
	}
	
}
