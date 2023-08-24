package com.spring.summerboot2.shop;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public interface ShopService {
	public ArrayList<ProductVO> Load_Product(String category, int sort);
	public ArrayList<String> Load_Category();

}
