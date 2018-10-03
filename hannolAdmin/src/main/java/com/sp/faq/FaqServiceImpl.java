package com.sp.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("service.faqService")
public class FaqServiceImpl implements FaqService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<Faq> faqGubunList() throws Exception {
		List<Faq> gubunList = null;
		try {
			gubunList = dao.selectList("faq.gubunList");
		} catch (Exception e) {
			throw e;
		}
		return gubunList;
	}

	@Override
	public int insertFaq(Faq dto) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("faq.insertFaq", dto);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("faq.dataCount", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<Faq> faqList(Map<String, Object> map) throws Exception {
		List<Faq> list = null;
		try {
			list = dao.selectList("faq.faqList", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public Faq readFaq(long faqCode) throws Exception {
		Faq dto = null;
		try {
			dto = dao.selectOne("faq.readFaq", faqCode);
		} catch (Exception e) {
			throw e;
		}
		return dto;
	}

	@Override
	public int updateFaq(Faq dto) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("faq.updateFaq", dto);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int deleteFaq(long faqCode) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("faq.deleteFaq", faqCode);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
