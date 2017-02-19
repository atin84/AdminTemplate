package com.tistory.atin84.admin.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tistory.atin84.admin.web.dao.CommonDAO;
import com.tistory.atin84.admin.web.model.GridModel;

@Service
public class GridService {

	@Autowired
	private CommonDAO commonDao;

	public List<Map<String, Object>> selectList(String sqlName, Map<String, Object> param) {
		return commonDao.selectGridList(sqlName, param);
	}

	public GridModel listGrid(String sqlName, Map<String, Object> param) {
		GridModel model = new GridModel();

		List<Map<String, Object>> returnList = null;

		if(param.get("page") != null) {
			int pageNumber = Integer.parseInt((String)param.get("page"));
			int rows = Integer.parseInt((String)param.get("rows"));

			int startIdx = (pageNumber-1)*rows + 1;
			int endIdx = pageNumber*rows;

			param.put("STARTIDX", startIdx);
			param.put("ENDIDX", endIdx);

			returnList = this.commonDao.selectGridList(sqlName, param);

			long totalCnt = 0;
			long totalPage = 0;

			if(returnList.size() != 0) {
				totalCnt = this.commonDao.count(sqlName, param);
				totalPage = (totalCnt -1) / rows + 1;
			}

			model.setPage(String.valueOf(pageNumber));
			model.setRecords(String.valueOf(totalCnt));
			model.setTotal(String.valueOf(totalPage));
		}
		else {
			returnList = this.commonDao.selectGridList(sqlName, param);
		}		
		model.setRows(returnList);

		return model;
	}
}
