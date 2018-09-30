package com.sp.payment;

import java.util.List;
import java.util.Map;

public interface PaymentService {
	public List<Payment> getTicketPayment(Map<String, Object> map) throws Exception;
}
