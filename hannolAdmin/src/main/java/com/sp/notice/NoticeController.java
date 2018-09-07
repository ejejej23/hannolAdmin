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
	 
	 @RequestMapping(value="/notice/created")
	   public String created(Model model) throws Exception {
	      return ".notice.created";
	 }
	 
	 @RequestMapping(value="/notice/article")
	   public String article(Model model) throws Exception {
	      return ".notice.article";
	 }
	 
}
