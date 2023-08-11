package com.spring.summerboot2.cart;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


@Service
public interface CartService {
	public List<CartVO> my_cart(String id);
	public void update_Quan(String id, int product_id, int quantity);
	public void delete(String id, int product_id);
}
