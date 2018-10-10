package com.sp.goodsIn;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("goodsIn.goodsInService")
public class GoodsInServiceImpl implements GoodsInService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertGoodsIn(GoodsIn dto) {
		int result = 0;
		
		try {
			result = dao.insertData("goodsIn.insertGoodsIn", dto); 
					 dao.updateData("goodsIn.updateGoodsCount", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("goodsIn.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<GoodsIn> listGoodsIn(Map<String, Object> map) {
		List<GoodsIn> list = null;
		
		try {
			list = dao.selectList("goodsIn.listGoodsIn", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public GoodsIn readGoodsIn(int num) {
		GoodsIn dto = null;
		
		try {
			dto = dao.selectOne("goodsIn.readGoodsIn", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}  
		return dto;
	}

	@Override
	public int updateGoodsIn(GoodsIn dto) {
		int result = 0;
		
		try {
			result = dao.updateData("goodsIn.updateGoodsIn", dto);
					 dao.updateData("goodsIn.updateTotalCount", dto);
					 dao.updateData("goodsIn.updateGoodsCount2", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<Map<String, Object>> listGubun() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("goodsIn.listGubun");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Map<String, Object>> listItem(int num) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("goodsIn.listItem", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listCompany() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("goodsIn.listCompany"); 
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int goodsCount(int num) {
		int result = 0;
		
		try {
			result = dao.selectOne("goodsIn.goodsCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int searchMagam(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("goodsIn.searchMagam", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
