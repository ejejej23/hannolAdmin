package com.sp.grade;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("grade.gradeController")
public class GradeController {

	@Autowired
	GradeService service;
	
	@RequestMapping(value = "/grade/list")
	public String list(Model model) throws Exception {
		
		List<Grade> list = service.list();		
		model.addAttribute("list", list);
		
		return ".grade.list";
	}
	
	@RequestMapping(value = "/grade/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		
		return ".grade.created";
	}
	
	@RequestMapping(value = "/grade/created", method=RequestMethod.POST)
	public String createdSubmit(Grade dto, HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "grade";	
		
		int result = service.insertGrade(dto, pathname);
		if(result != 1)
			return "redirect:/grade/created";
		
		return "redirect:/grade/list";
	}
	
	@RequestMapping(value = "/grade/update", method=RequestMethod.GET)
	public String updateForm(@RequestParam int num, Model model) throws Exception {
		
		Grade dto = service.readGrade(num);
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		
		return ".grade.created";
	}
	
	@RequestMapping(value = "/grade/update", method=RequestMethod.POST)
	public String updateSubmit(Grade dto, 
			@RequestParam String saveFileName,
			@RequestParam String originalFileName,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "grade";	
		
		dto.setSaveFileName(saveFileName);
		dto.setOriginalFileName(originalFileName);
		
		service.updateGrade(dto, pathname);
		
		return "redirect:/grade/list";
	}
	
	@RequestMapping(value = "/grade/delete")
	public String delete(@RequestParam int num, HttpSession session) throws Exception {
		
		service.updateMemberGrade(num);
		
		Grade dto = service.readGrade(num);
		if(dto==null) {
			return "redirect:/grade/list";
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "grade";	
	 	
		service.deleteGrade(num, dto.getSaveFileName(), pathname);
		
		return "redirect:/grade/list";
	}

}
