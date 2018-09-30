package com.sp.payment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("payment.paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<Payment> getTicketPayment(Map<String, Object> map) throws Exception {
		List<Payment> list = null;
		try {
			list = dao.selectList("payment.getTicketPayment", map);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	

}
