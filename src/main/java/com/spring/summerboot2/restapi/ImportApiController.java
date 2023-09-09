package com.spring.summerboot2.restapi;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.spring.summerboot2.pay.PayService;

@Controller
public class ImportApiController {

//	@Autowired
//	private PaymentService paymentService;
	
	@Autowired
	private ImportApiService importApiService;
	
    private IamportClient api;
    
    public ImportApiController() {
        // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        this.api = new IamportClient("2533578227323360","mGXIKZZqDcW9yYXiaVnuY8GE5TksKN84KSvGQBom2LrAvdAqa564rO17Nz2aGLjGoMTSVQuKpmJbRsqE");
    }

    @ResponseBody
    @RequestMapping(value="/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session
            , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
    {
        return api.paymentByImpUid(imp_uid);
    }
    
    @ResponseBody
    public IamportResponse<Payment> paymentLookup(@PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
    {
        return api.paymentByImpUid(imp_uid);
    }
    
    @ResponseBody
    @RequestMapping(value="/CancelPayments", method = RequestMethod.GET)
	public IamportResponse<Payment> CancelPayments(HttpServletRequest request, HttpServletResponse response
			,@RequestParam(value= "imp_uid") String imp_uid  ,@RequestParam(value= "reason") String reason) throws IamportResponseException, IOException
    {

    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		IamportResponse<Payment> lookUp = null;
		CancelData data = null;
		lookUp = paymentLookup(imp_uid);
		data = new CancelData(imp_uid, true);
		data.setReason(reason);
		if(lookUp.getResponse().getPayMethod().equals("vbank")) {
			String order_num = lookUp.getResponse().getMerchantUid();
			String[] v_data = new String[4];
			v_data = importApiService.vInformLoad(order_num);
			data.setReason(reason);
			data.setRefund_bank(v_data[0]);
			data.setRefund_holder(v_data[1]);
			data.setRefund_account(v_data[2]);
//			왜 refund_tel이 없지 실패...
		}
		
		IamportResponse<Payment> cancel = api.cancelPaymentByImpUid(data);//취소
		
		return cancel;
	}
    
}