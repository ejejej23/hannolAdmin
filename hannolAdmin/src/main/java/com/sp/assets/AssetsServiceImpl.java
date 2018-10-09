package com.sp.assets;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.ticket.Ticket;

@Service("assets.assetsServiceImpl")
public class AssetsServiceImpl implements AssetsService{
	@Autowired
	CommonDAO dao;

	
	@Override
	public List<Map<String, Object>> themeList() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("assets.themeList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int assetsDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result= dao.selectOne("assets.assetsDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<Assets> assetsCountList(Map<String, Object> map) {
		List<Assets> list = null;
		
		try {
			list = dao.selectList("assets.assetsCountList", map);
		} catch (Exception e) {
			System.out.println(e.toString()); 
		}
		return list;
	}
	
	@Override
	public int searchRentCount(int num) {
		int result = 0;  
		
		try {
			result = dao.selectOne("assets.searchRentCount", num); 
		} catch(NullPointerException e) {
			result = 0; //반환값이 null이면 0으로 셋팅 
		} catch (Exception e) {
			System.out.println(e.toString());   
		}
		return result;
	}

	@Override
	public int searchAssetsCode(int num) {
		int result = 0;
		
		try {
			result = dao.selectOne("assets.searchAssetsCode", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Ticket searchTicket(int num) {
		Ticket list = null;
		
		try {
			list = dao.selectOne("assets.searchTicket", num); 
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list; 
	}

	@Override
	public int searchReservationCheck(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("assets.searchReservationCheck", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertRent(Assets dto) {
		int result = 0;
		
		try {
			result = dao.insertData("assets.insertRent", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int assetsReservationDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("assets.assetsReservationDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<Assets> assetsReservationList(Map<String, Object> map) {
		List<Assets> list = null;
		
		try {
			list = dao.selectList("assets.assetsReservationList", map);
		} catch (Exception e) {  
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int rentalOkCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("assets.rentalOkCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}	
	
	@Override
	public List<Assets> rentalOkList(Map<String, Object> map) {
		List<Assets> list = null;
		try {
			list = dao.selectList("assets.rentalOkList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int rentUpdate(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.updateData("assets.rentUpdate", map); 
		} catch (Exception e) {
			System.out.println(e.toString());  
		}
		return result;
	}
}
