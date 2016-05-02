package co.kr.doosam.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class DataSourceConfig {
	
    @Bean(destroyMethod="close")
	public DataSource dataSource(){
		BasicDataSource datasource = new BasicDataSource();
		datasource.setDriverClassName("com.mysql.jdbc.Driver");
		datasource.setUrl("jdbc:mysql://175.198.36.131:3306/hmc");
		datasource.setUsername("hmcuser");
		datasource.setPassword("hmcuser!120");
		datasource.setInitialSize(200);
		datasource.setMaxTotal(200);
		datasource.setMaxIdle(200);
		datasource.setMaxWaitMillis(7000);
		datasource.setRemoveAbandonedTimeout(5);
		datasource.setRemoveAbandonedOnBorrow(true);
		datasource.setRemoveAbandonedOnMaintenance(true);
		datasource.setDefaultAutoCommit(true);
		 
		return datasource;
	}
}
