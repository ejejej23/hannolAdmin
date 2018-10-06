package com.sp.payment;

import java.util.HashMap;
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
	public List<Payment> getYears() throws Exception {
		List<Payment> list = null;
		try {
			list = dao.selectList("payment.getYears");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("payment.dataCount", map);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

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
	
	@Override
	public List<Integer> useDate(Map<String, Object> map) throws Exception {
		List<Integer> list = null;
		try {
			list = dao.selectList("payment.useDate", map);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int deleteRefund(int payCode) throws Exception {
		int result = 0;
		try {
			//매직패스 예약 취소
			dao.deleteData("magic.deleteMagicpassAll", payCode);
			
			result = dao.deleteData("payment.deleteGift", payCode);
			dao.updateData("payment.updateCardInfo", payCode);

			dao.deleteData("payment.deleteTicket", payCode);
			dao.deleteData("payment.deleteDiscount", payCode);

			List<Map<String, Object>> couponCode = dao.selectList("payment.getCouponCode", payCode);
			if (couponCode != null && couponCode.size() > 0) {
				for (int i = 0; i < couponCode.size(); i++) {
					Map<String, Object> map = new HashMap<>();
					map.put("couponCode", (couponCode.get(i)).get("COUPONCODE"));
					dao.updateData("payment.updateCouponState", map);
				}
			}
			
			dao.deleteData("payment.deleteCouponHistory", payCode);

		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
