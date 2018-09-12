package com.sp.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("schedule.showController")
public class ShowController {
	
//	showGubun @ModelAttribute
//	public List<>
	
	
   
   @RequestMapping(value="/show/list", method=RequestMethod.GET)
   public String list() {
      
      return ".show.list";
   }
   
   
   
   @RequestMapping(value="/show/manage", method=RequestMethod.GET)
   public String manageShow() {
      
      return ".show.manage";
   }
   
   @RequestMapping(value="/show/created", method=RequestMethod.GET)
   public String createForm(Model model) {
      
     model.addAttribute("mode", "created");
      
      return ".show.created";
   }
   
   
   @RequestMapping(value="/show/created", method=RequestMethod.POST)
   public String createSubmit(
		   Model model) {
	   
	   
	   
	   return ".show.created";
   }
   
}