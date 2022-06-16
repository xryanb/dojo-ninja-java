package com.dojos.ninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dojos.ninjas.models.Dojo;
import com.dojos.ninjas.models.Ninja;
import com.dojos.ninjas.services.DojoService;
import com.dojos.ninjas.services.NinjaService;


@Controller
public class DojoController {
	@Autowired
	DojoService dojoServ;
	
	@Autowired
	NinjaService ninjaServ;
	
	@RequestMapping("/dojos/new")
	public String index(@ModelAttribute("newdojo")Dojo dojo) {
		return "index.jsp";
	}
	
	@PostMapping("/dojos/create")
	public String create(@Valid @ModelAttribute("newdojo") Dojo dojo, BindingResult result) {
        if (result.hasErrors()) {
        	System.out.println("test");
            return "index.jsp";
        } else {
            dojoServ.createDojo(dojo);
            return "redirect:/ninjas/new";
        }
    }
	 
	@RequestMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("ninja") Ninja ninja,Model model) {
		List<Dojo> allDojos=dojoServ.allDojos();
		model.addAttribute("dojos", allDojos);
		return "newninja.jsp";
	}
	
	@PostMapping("/ninjas/create")
	public String create(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
        if (result.hasErrors()) {
        	List<Dojo> allDojos=dojoServ.allDojos();
    		model.addAttribute("dojos", allDojos);
            return "index.jsp";
        } else {
           ninjaServ.createNinja(ninja);
            return "redirect:/dojos/new";
        }
    }
	
	@RequestMapping("/dojos/{id}")
	public String display(@PathVariable("id") Long id, Model model) {
		Dojo oneDojo=dojoServ.findDojo(id);
		model.addAttribute("dojo", oneDojo);
		model.addAttribute("ninjas", oneDojo.getNinja());
		return "display.jsp";
	}
	
	
	
	
}
