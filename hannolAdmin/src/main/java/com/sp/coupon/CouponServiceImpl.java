package com.sp.coupon;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.ticket.Ticket;

@Service("coupon.couponService")
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<Ticket> goodsList() throws Exception {
		List<Ticket> list = null;
		try {
			list = dao.selectList("coupon.listBenefit");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int insertCoupon(Coupon coupon) throws Exception {
		int result = 0;
		try {
			int seq = dao.selectOne("coupon.seq");
			coupon.setMngCode(seq);
			dao.insertData("coupon.insertCouponMng", coupon);

			List<Integer> userCode = dao.selectList("coupon.listUsers", coupon);
			for (int i = 0; i < userCode.size(); i++) {
				coupon.setUsersCode(userCode.get(i));
				for (int j = 0; j < coupon.getCount(); j++) {
					dao.insertData("coupon.insertCoupon", coupon);
				}
			}

			result = 1;
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("coupon.dataCount", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<Coupon> listCoupon(Map<String, Object> map) throws Exception {
		List<Coupon> list = null;
		try {
			list = dao.selectList("coupon.listCoupon", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public Coupon readCoupon(int mngCode) throws Exception {
		Coupon dto = null;
		try {
			dto = dao.selectOne("coupon.readCoupon", mngCode);
		} catch (Exception e) {
			throw e;
		}
		return dto;
	}

	@Override
	public int deleteCoupon(int mngCode) throws Exception {
		int result = 0;
		try {
			dao.deleteData("coupon.deleteCoupon", mngCode);
			dao.deleteData("coupon.deleteCouponMng", mngCode);
			result = 1;
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
