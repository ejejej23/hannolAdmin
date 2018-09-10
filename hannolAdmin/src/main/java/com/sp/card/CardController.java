package com.sp.card;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("card.cardController")
public class CardController {
	
	@Autowired
	CardService service;
	
	 @RequestMapping(value="/card/list")
	   public String cardList(Model model) throws Exception {
	      return ".card.card";
	 }
	 
	 @RequestMapping(value="/card/created", method=RequestMethod.GET)
	   public String createdForm(Card card, Model model) throws Exception {
		 model.addAttribute("mode", "created");
	      
		 return ".card.created";
	 }
	 
	 @RequestMapping(value="/card/created", method=RequestMethod.POST)
	   public String createdSubmit(Card dto, Model model) throws Exception {
		 service.insertCard(dto);
		 
		 return "redirect:/card/list";
	 }
}
