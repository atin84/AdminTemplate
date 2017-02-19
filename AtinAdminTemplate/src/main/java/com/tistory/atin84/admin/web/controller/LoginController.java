package com.tistory.atin84.admin.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LocaleResolver localeResolver;
	
	/**
	 * 로그인 요청시
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/login.do")
	public ModelAndView loginForm(ModelMap modelMap, HttpServletRequest request) {
		logger.debug("CurrentLocale: {}, {}", request.getLocale(), localeResolver.resolveLocale(request));
		return new ModelAndView("login", modelMap);
	}
	
	/**
	 * Login 접근 금지 시
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/denied.do")
	public ModelAndView deniedForm(ModelMap modelMap) {
		return new ModelAndView("denied");		
	}
	
	/**
	 * 성공 시 처리 페이지
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/main.do")
	public ModelAndView sucessForm(ModelMap modelMap) {
		return new ModelAndView("main");
	}
	
	@RequestMapping(value="/locale/change.do")
	public String change(HttpServletRequest request) {
		return "redirect:" + request.getHeader("Referer");
	}
	
}
