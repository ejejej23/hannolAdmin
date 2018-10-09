package com.sp.amenity;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("amenity.amenityService")
public class AmenityServiceImpl implements AmenityService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Amenity> checkList(Map<String, Object> map) {
		List<Amenity> list = null;
		try {
			System.out.println("서비스임플~!!!!!!!!!!!!!!!!!!!!!!!!!");
			list = dao.selectList("amenity.checkList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int datanum(Map<String, Object> map) {
		int result=0;
		
		try {
			result = dao.selectOne("amenity.datanum",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	@Override
	public Amenity getCubeBookCancelDay(int payCode) {
		Amenity dto = new Amenity();
		
		try {
			dto=dao.selectOne("amenity.getCubeBookCancelDay", payCode);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dto;
	}
	
	@Override
	public int okTicketIfPayCancledCube(int payCode) {
		int result = 0;
		try {
			result = dao.selectOne("amenity.okTicketIfPayCancledCube", payCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int payBookCode(int payCode) {
		int result = 0;
		try {
			result = dao.selectOne("amenity.payBookCode", payCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int paydeleteLocker(int cubepayCode) {
		int res =0 ;
		
		try {
			res = dao.deleteData("amenity.paydeleteLocker", cubepayCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return res;
	}
	
	@Override
	public int paydeleteBook(int cubepayCode) {
		int res =0 ;
		
		try {
			res = dao.deleteData("amenity.paydeleteBook", cubepayCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return res;
	}
}
