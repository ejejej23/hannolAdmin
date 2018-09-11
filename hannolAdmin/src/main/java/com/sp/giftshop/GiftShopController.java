package com.sp.giftshop;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("giftshop.giftShopController")
public class GiftShopController {

	@Autowired
	private GiftShopService service;

	@RequestMapping(value = "/giftshop/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {

		List<String> gubunList = service.gubunList();

		model.addAttribute("mode", "created");
		model.addAttribute("gubunList", gubunList);
		return ".giftshop.created";
	}

	@RequestMapping(value = "/giftshop/created", method = RequestMethod.POST)
	public String createdSubject(GiftShop dto, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"giftShopGoods";
		
		service.insertGiftGoods(dto, pathname);
		
		return "redirect:/giftshop/list";
	}

	@RequestMapping(value = "/giftshop/list")
	public String listForm(Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", 1);
		map.put("end", 6);
		
		List<GiftShop> list =  service.listGiftGoods(map);
		model.addAttribute("list", list);
		return ".giftshop.list";
	}

}
