package com.ryxc.core.biz;

import com.ryxc.core.dao.ChartConfigDao;
import com.ryxc.core.dao.DataGridDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;

/**
 * 实现业务层 重复代码复用
 */
public abstract class BaseService {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	protected ChartConfigDao chartConfigDao;
	
	@Resource
	protected DataGridDao dataGridDao;
	
}
