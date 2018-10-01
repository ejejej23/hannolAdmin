package com.sp.payment;

import java.util.List;
import java.util.Map;

public interface PaymentService {
	public List<Payment> getYears() throws Exception;
	int dataCount(Map<String, Object> map) throws Exception;
	public List<Payment> getTicketPayment(Map<String, Object> map) throws Exception;
	public List<Integer> useDate(Map<String, Object> map) throws Exception;
	public int deleteRefund(int payCode) throws Exception; 
}
