package com.tistory.atin84.admin;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class CreateH2Database {

	private Logger logger = LoggerFactory.getLogger(CreateH2Database.class);

	@Autowired
	protected JdbcTemplate jdbcTemplate;

	public void create() {
		logger.info("Creating H2 Database");
		createUsers();
	}

	@PostConstruct
	private void createUsers() {
		logger.info("Creating users table");
		jdbcTemplate.execute("create table if not exists users (id serial, first_name varchar(255), last_name varchar(255))");
		String[] names = "John Woo;Jeff Dean;Josh Bloch;Josh Long".split(";");
		for (String fullname : names) {
			String[] name = fullname.split(" ");
			logger.info("Inserting user record for " + name[0] + " " + name[1] + "\n");
			jdbcTemplate.update(
					"INSERT INTO users(first_name,last_name) values(?,?)",
					name[0], name[1]);
		}
	}
}

