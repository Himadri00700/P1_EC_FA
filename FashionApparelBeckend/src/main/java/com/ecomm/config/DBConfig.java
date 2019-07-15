package com.ecomm.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ecomm.model.Cart;
import com.ecomm.model.Category;
import com.ecomm.model.OrderDetail;
import com.ecomm.model.Product;
import com.ecomm.model.Supplier;
import com.ecomm.model.UserDetail;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.ecomm")
public class DBConfig {
		
	//Create a Bean for the DataSource
	@Bean(name="dataSource")
	public DataSource getH2DataSource() {
	
		DriverManagerDataSource dataSource=new DriverManagerDataSource();
		
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/S200012_13");
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUsername("dteja");
		dataSource.setPassword("dteja");
		
		System.out.println("~~~~ DataSource Creation ~~~~");
		
		return dataSource;
	}
	
	//Create a Bean for the SessionFactory
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFactory() {
		
		Properties hibernateProperties=new Properties();
		hibernateProperties.put("hibernate.hbm2ddl.auto", "update");
		hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		
		LocalSessionFactoryBuilder factory=new LocalSessionFactoryBuilder(getH2DataSource());
		factory.addProperties(hibernateProperties);
		
		factory.addAnnotatedClass(Category.class);
		factory.addAnnotatedClass(Supplier.class);
		factory.addAnnotatedClass(Product.class);
		factory.addAnnotatedClass(UserDetail.class);
		factory.addAnnotatedClass(Cart.class);
		factory.addAnnotatedClass(OrderDetail.class);
		
		SessionFactory sessionFactory=factory.buildSessionFactory();
		
		System.out.println("~~~~ SessionFactory Implementation ~~~~");
		
		return sessionFactory;
	}
	
	//Create a Bean for HibernateTransactionManager
	@Bean(name="txManager")
	public HibernateTransactionManager getHibernateTransactionManger(SessionFactory sessionFactory) {
		
		System.out.println("~~~~ HibernateTransactionManager ~~~~");
		
		return new HibernateTransactionManager (sessionFactory);	
	}
}
