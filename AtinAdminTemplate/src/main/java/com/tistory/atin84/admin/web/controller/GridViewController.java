package com.tistory.atin84.admin.web.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tistory.atin84.admin.web.model.GridModel;
import com.tistory.atin84.admin.web.service.GridService;

@RestController
public class GridViewController {

	private Logger logger = LoggerFactory.getLogger(GridViewController.class);
	
	@Autowired
	private GridService gridService;
	
	@RequestMapping(value="/grid/{query}.do")
	public GridModel grid(@PathVariable("query") String query, @RequestParam Map<String, Object> param) {
		logger.debug("[{}] {}", query, param.toString());
		return gridService.listGrid(query, param);
	}
	
}
