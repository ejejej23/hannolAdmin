package com.sp.visitor;

import java.util.List;
import java.util.Map;

public interface VisitorService {
	public List<Visitor> getYears() throws Exception;
	public List<Visitor> getVisitor(Map<String, Object> map) throws Exception;
	public List<Visitor> getVisitorA(Map<String, Object> map) throws Exception;
	public List<Visitor> getVisitorN(Map<String, Object> map) throws Exception;
	public List<Visitor> getVisitorY(Map<String, Object> map) throws Exception;
	public List<Visitor> visitorLinePeriod(Map<String, Object> map) throws Exception;
	public List<Visitor> visitorALinePeriod(Map<String, Object> map) throws Exception;
	public List<Visitor> visitorNLinePeriod(Map<String, Object> map) throws Exception;
	public List<Visitor> visitorYLinePeriod(Map<String, Object> map) throws Exception;
	
}
