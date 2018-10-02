package com.sp.question;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Question> list(Map<String, Object> map) throws Exception;
}
