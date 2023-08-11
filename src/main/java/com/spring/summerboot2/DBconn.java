package com.spring.summerboot2;

import java.sql.Connection;
import javax.sql.DataSource;

import javax.naming.Context;
import javax.naming.InitialContext;

public class DBconn {
	public static Connection getDBCP() {
        Connection conn = null;
        String jndiName = "jdbc/washboot";
        try {
            Context initContext = (Context) new InitialContext().lookup("java:comp/env");
            DataSource ds = (DataSource) initContext.lookup(jndiName);
            conn = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
