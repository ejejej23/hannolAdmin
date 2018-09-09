package com.sp.amenity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("amenity.amenityController")
public class AmenityController {
	
	@RequestMapping(value="/amenity/storage", method=RequestMethod.GET)
	public String storageForm() {
		
		return ".amenity.storage";
	}
}
