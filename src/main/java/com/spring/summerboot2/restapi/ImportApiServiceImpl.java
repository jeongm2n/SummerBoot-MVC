package com.spring.summerboot2.restapi;

import org.springframework.stereotype.Service;

@Service
public class ImportApiServiceImpl  implements ImportApiService{

	@Override
	public String[] vInformLoad(String order_num) {
		ImportApiDAO importApiDAO = new ImportApiDAO();
		return importApiDAO.vInformLoad(order_num);
	}


}
