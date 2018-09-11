package com.sp.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("schedule.showController")
public class ShowController {
   
   @RequestMapping(value="/show/list", method=RequestMethod.GET)
   public String list() {
      
      return ".show.list";
   }
}