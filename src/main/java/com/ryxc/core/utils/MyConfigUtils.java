package com.ryxc.core.utils;

import com.ryxc.core.dao.ConfigParamDao;
import com.ryxc.core.entity.ConfigParam;
import com.ryxc.core.utils.web.SpringContextHolder;
import org.springframework.core.io.support.ResourcePropertySource;
import org.springframework.util.Assert;

import java.io.IOException;
import java.util.List;

public class MyConfigUtils {
	static ResourcePropertySource propertySource;
	static {
		try {
			propertySource = new ResourcePropertySource("resource", "classpath:config.properties");
			Assert.notNull(propertySource);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static List<ConfigParam> findByStyle(String styleName){
		return getDao().findByHql("from "+ConfigParam.class.getSimpleName()+" where style=?", styleName);
	}
	
	public static String getProperty(String property) {
		Object prop = propertySource.getProperty(property);
		if(prop==null){
			throw new RuntimeException("读取参数"+property+"的值出错，没有读取到数据");
		}
		return prop.toString();
	}
	
	public static ConfigParam getByName(String name) {
		final List<ConfigParam> list = getDao().findByHql("from "+ConfigParam.class.getSimpleName()+" where name=?", name);
		if(list!=null&&list.size()>0) {
			if(list.size()>1) {
				throw new RuntimeException("配置项"+name+"存在同名，严重错误");
			}
			return list.get(0);
		}
		return null;
	}
	
	public static String getValueByName(String name) {
		ConfigParam param = getByName(name);
		if(param==null) {
			throw new RuntimeException("配置项"+name+"不存在，严重错误");
		}
		return param.getValue();
	}
	
	public static void setValueByName(String name, String value) {
		ConfigParam param = getByName(name);
		if(param == null) {
			throw new RuntimeException("配置项"+name+"不存在，严重错误");
		}
		param.setValue(value);
		getDao().update(param);
	}
	
	private static ConfigParamDao getDao() {
		return SpringContextHolder.getBean(ConfigParamDao.class);
	}
	
	
	public static String getDBPwd() {
		return propertySource.getProperty("main.db.password").toString();
	}

	public static String getDBUser() {
		return propertySource.getProperty("main.db.user").toString();
	}
}
