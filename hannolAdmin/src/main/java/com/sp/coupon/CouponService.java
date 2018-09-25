package com.sp.coupon;

import java.util.List;
import java.util.Map;

import com.sp.ticket.Ticket;

public interface CouponService {
	public List<Ticket> goodsList() throws Exception;
	public int insertCoupon(Coupon coupon) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Coupon> listCoupon(Map<String, Object> map) throws Exception;
	public Coupon readCoupon(int mngCode) throws Exception;
	public int deleteCoupon(int mngCode) throws Exception;
}
