package com.sp.goodsOut;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("goodsOut.goodsOutService")
public class GoodsOutServiceImpl implements GoodsOutService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertGoodsOut(GoodsOut dto) {
		int result = 0;
		
		try {
			result = dao.insertData("goodsOut.insertGoodsOut", dto); 
					 dao.updateData("goodsOut.updateGoodsCount", dto);
		} catch (Exception e) { 
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("goodsOut.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<GoodsOut> listGoodsOut(Map<String, Object> map) {
		List<GoodsOut> list = null;
		
		try {
			list = dao.selectList("goodsOut.listGoodsOut", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public GoodsOut readGoodsOut(int num) {
		GoodsOut dto = null;
		
		try {
			dto = dao.selectOne("goodsOut.readGoodsOut", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}  
		return dto;
	}

	@Override
	public int updateGoodsOut(GoodsOut dto) {
		int result = 0;
		
		try {
			result = dao.updateData("goodsOut.updateGoodsOut", dto);
					 dao.updateData("goodsOut.updateTotalCount", dto);
					 dao.updateData("goodsOut.updateGoodsCount2", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<Map<String, Object>> listGubun() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("goodsOut.listGubun");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Map<String, Object>> listItem(int num) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("goodsOut.listItem", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listCompany() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("goodsOut.listCompany"); 
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<GoodsOut> listGoodsCompany(int num) {
		List<GoodsOut> list = null;
		try {
			list = dao.selectList("goodsOut.listGoodsCompany", num);  
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int goodsCount(int num) {
		int result = 0;
		
		try {
			result = dao.selectOne("goodsOut.goodsCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int goodsPrice(int num) {
		int result = 0;
		
		try {
			result = dao.selectOne("goodsOut.goodsPrice", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int searchMagam(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("goodsOut.searchMagam", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
