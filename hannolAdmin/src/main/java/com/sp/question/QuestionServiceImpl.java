package com.sp.question;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("question.questionService")
public class QuestionServiceImpl implements QuestionService{
	@Autowired
	CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("question.dataCount", map);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public List<Question> list(Map<String, Object> map) throws Exception {
		List<Question> list = null;
		try {
			list = dao.selectList("question.listQuestion", map);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

}
