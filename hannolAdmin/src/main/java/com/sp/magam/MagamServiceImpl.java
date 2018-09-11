package com.sp.magam;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("magam.magamService")
public class MagamServiceImpl implements MagamService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Magam readMagam(Map<String, Object> map) throws Exception {
		Magam dto = null;
		try {
			dto = dao.selectOne("magam.readMagam", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("magam.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Magam> listMagam(Map<String, Object> map) throws Exception {
		List<Magam> list = null;
		try {
			list = dao.selectList("magam.listMagam", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateMagam(Magam dto) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("magam.updateMagam", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
