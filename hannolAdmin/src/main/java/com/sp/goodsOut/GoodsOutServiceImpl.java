package com.sp.goodsOut;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service
public class GoodsOutServiceImpl implements GoodsOutService {
	private CommonDAO dao;
	
	@Override
	public int insertGoodsOut(GoodsOut dto) {
		int result = 0;
		
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<GoodsOut> listGoodsOut(Map<String, Object> map) {
		List<GoodsOut> list = null;
		
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public GoodsOut readGoodsOut(int num) {
		GoodsOut dto = null;
		
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateGoodsOut(GoodsOut dto) {
		int result = 0;
		
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteGoodsOut(int num) {
		int result = 0;
		
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
