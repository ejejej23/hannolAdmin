package com.sp.giftshop;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("giftshop.giftShopController")
public class GiftShopController {
	
	
	@RequestMapping(value="/giftshop/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		model.addAttribute("mode", "created");
		return ".giftshop.created";
	}

}
