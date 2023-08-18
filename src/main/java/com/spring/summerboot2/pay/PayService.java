package com.spring.summerboot2.pay;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface PayService {
	public InformVO Load_Inform(String id, InformVO s_inform);
	public String[] Make_Inform(Map<String, String> Inform);
	public void Save_Inform(String id, Map<String, String> Inform);
}
