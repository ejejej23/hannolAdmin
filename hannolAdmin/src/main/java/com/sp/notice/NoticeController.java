package com.sp.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("notice.noticeController")
public class NoticeController {
	 @RequestMapping(value="/notice/list")
	   public String userList(Model model) throws Exception {
	      return ".notice.list";
	 }
	 
}
