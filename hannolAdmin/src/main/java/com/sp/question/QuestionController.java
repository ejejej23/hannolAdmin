package com.sp.question;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.payment.Payment;

@Controller("question.questionController")
public class QuestionController {
	@Autowired
	private QuestionService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value = "/question/list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam(value = "gubun", defaultValue = "요금 문의") String gubun,
			Model model) throws Exception {
		
		model.addAttribute("page", page);
		model.addAttribute("gubun", gubun);
		
		return ".question.list";
	}
	
	@RequestMapping(value = "/payment/ajaxList")
	public String aJaxList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "gubun", defaultValue = "요금 문의") String gubun,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		int rows = 10;
		int start = (current_page-1)*rows+1;
		int end = current_page * rows;
		
		Map<String, Object> map = new HashMap<>();
		map.put("gubun", gubun);
		map.put("start", start);
		map.put("end", end);
		
		int dataCount = service.dataCount(map);
		int total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		String cp = req.getContextPath();
		String list_url = cp + "/question/list?gubun="+gubun;
		String articleUrl = cp + "/question/article?page=" + current_page;
		String paging = util.paging(current_page, total_page, list_url);
		
		List<Question> list = service.list(map);
		int listNum, n = 0;
		Iterator<Question> it = list.iterator();
		while (it.hasNext()) {
			Question data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("gubun", gubun);
		model.addAttribute("articleUrl", articleUrl);
		
		return "/question/list-body";
	}
}
