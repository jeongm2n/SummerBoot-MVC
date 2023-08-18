package com.spring.summerboot2.pay;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface PayService {
	public InformVO Load_Inform(String id, InformVO s_inform);
	public String[] Add_Session(Map<String, String> Inform);
	public void Save_Inform(String id, Map<String, String> Inform);
	
}
