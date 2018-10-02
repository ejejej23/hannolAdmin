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
	
	@Override
	public Question readQuestion(int num) throws Exception {
		Question dto = null;
		try {
			dto = dao.selectOne("question.readQuestion", num);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public Question readAnswer(int num) throws Exception {
		Question dto = null;
		try {
			dto = dao.selectOne("question.readAnswer", num);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public int deleteQuestion(int num) throws Exception {
		int result= 0;
		try {
			result = dao.deleteData("question.deleteQuestion", num);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertAnswer(Question dto) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("question.insertAnswer", dto);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteAnswer(int num) throws Exception {
		int result= 0;
		try {
			result = dao.deleteData("question.deleteAnswer", num);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int updateAnswer(Question dto) throws Exception {
		int result= 0;
		try {
			result = dao.deleteData("question.updateAnswer", dto);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

}
