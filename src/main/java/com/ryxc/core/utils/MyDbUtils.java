package com.ryxc.core.utils;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public final class MyDbUtils {//拒绝继承
	private static String className = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://hh166.all123.net:3306/logger?useUnicode=true&amp;characterEncoding=utf-8";
	private static String user = "root";
	private static String password = "root";
	private static QueryRunner queryRunner = new QueryRunner();
	
	public static void main(String[] args) {
		//updateBuyed_clazz();
		executeSql("select  weather from weather  where area='广州'");
		List list  = new ArrayList();
		list.add("1");
		list.add("2");
		
		System.out.println(list.size());
	}
	
	public static List<String> executeSql(String sql){
		List<String> result = new ArrayList<String>();
		try {
			List<Object[]> requstList = queryRunner.query(getConnection(),sql, new ArrayListHandler(new BasicRowProcessor(){
				@Override
				public <Object> List<Object> toBeanList(ResultSet rs, Class<Object> type)
						throws SQLException {
					return super.toBeanList(rs, type);
				}
			}));
			for (Object[] objects : requstList) {
				result.add(objects[0].toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static void update(String sql, Object... params) {
		try {
			Connection connection = getConnection();
			queryRunner.update(connection , sql, params);
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//拒绝new一个实例
	private MyDbUtils() {};
	static {//调用该类时既注册驱动
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			throw new ExceptionInInitializerError(e);
		}
	}
	
	//获取连接
	private static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}
	
}