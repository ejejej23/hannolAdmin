package com.sp.question;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Question> list(Map<String, Object> map) throws Exception;
	public Question readQuestion(int num) throws Exception;
	public Question readAnswer(int num) throws Exception;
	public int deleteQuestion(int num) throws Exception;
	public int insertAnswer(Question dto) throws Exception;
	public int deleteAnswer(int num) throws Exception;
	public int updateAnswer(Question dto) throws Exception;
}
