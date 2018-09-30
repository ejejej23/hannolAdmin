package com.sp.magicpass;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("magicpass.magicpassServiceImpl")
public class MagicpassServiceImpl implements MagicpassService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("magic.dataCount", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<Magicpass> magicpassList(Map<String, Object> map) throws Exception {
		List<Magicpass> list = null;
		try {
			list = dao.selectList("magic.listMagicpass", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

}
