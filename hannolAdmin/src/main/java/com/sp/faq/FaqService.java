package com.sp.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public List<Faq> faqGubunList() throws Exception;
	public int insertFaq(Faq dto) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Faq> faqList(Map<String, Object> map) throws Exception;
	public Faq readFaq(long faqCode) throws Exception;
	public int updateFaq(Faq dto) throws Exception;
	public int deleteFaq(long faqCode) throws Exception;
}
