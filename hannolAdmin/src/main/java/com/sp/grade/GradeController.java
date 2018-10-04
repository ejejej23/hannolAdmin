package com.sp.grade;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("grade.gradeController")
public class GradeController {

	@RequestMapping(value = "/grade/list")
	public String list() {
		
		return ".grade.list";
	}
}
