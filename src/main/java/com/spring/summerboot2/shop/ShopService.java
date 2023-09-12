package com.spring.summerboot2.shop;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public interface ShopService {
	public ArrayList<ProductVO> Load_Product(String category, int sort, int page);
	public int Load_Size(String category);
	public ArrayList<String> Load_Category();
	public ProductVO Load_Product(String product_id);
	public void Add_Cart(String id, int product_id, int quantity, int amount);
	public ArrayList<ReviewVO> Load_Review(String product_id);
}
