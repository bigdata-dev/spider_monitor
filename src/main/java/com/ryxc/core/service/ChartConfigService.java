package com.ryxc.core.service;

import com.ryxc.core.biz.BaseService;
import com.ryxc.core.domain.Ids;
import com.ryxc.core.entity.ChartConfig;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChartConfigService extends BaseService{

	public void save(ChartConfig chartConfig) {
		chartConfigDao.saveOrUpdate(chartConfig);
	}

	public void delete(ChartConfig chartConfig) {
		chartConfigDao.delete(chartConfig);
	}

	public List<ChartConfig> queryAllChartConfig() {
		return chartConfigDao.findAll();
		
	}


	public void deleteBatch(Ids ids) {
		for (Integer id : ids.getId()) {
			chartConfigDao.delete(id);
		}
	}
	
	public List<ChartConfig> findAll() {
		return chartConfigDao.findAll();
	}

	public ChartConfig getById(Integer id) {
		return chartConfigDao.get(id);
	}


}
