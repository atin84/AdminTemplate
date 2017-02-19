package com.tistory.atin84.admin.web.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

@Controller
public class PageViewController {

	private Logger logger = LoggerFactory.getLogger(PageViewController.class);
	
	@RequestMapping(value="/pageView/{page}.do", method=RequestMethod.GET)
	public String pageView(WebRequest request, ModelMap modelMap, @PathVariable("page") String page) throws IOException {
		logger.debug("CurrentLocale: " + request.getLocale());
		
		
		return page;
	}
	
}
