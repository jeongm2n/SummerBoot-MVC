package com.spring.summerboot2.cart;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

	@Override
	public List<CartVO> my_cart(String id) {
		CartDAO dao =  new CartDAO();
		return dao.my_cart(id);
	}

	@Override
	public void update_Quan(String id, int product_id, int quantity) {
		CartDAO dao =  new CartDAO();
		dao.update_Quan(id, product_id, quantity);
	}

	@Override
	public void delete(String id, int product_id) {
		CartDAO dao =  new CartDAO();
		dao.delete(id, product_id);
	}
	
}
