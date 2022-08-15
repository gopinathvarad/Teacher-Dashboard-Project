

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class DBConnectionManager {

	public static Session getSession() {
		Session session = null;
		
		int lport = 5656;
		String rhost = "pawscomp2.sis.pitt.edu";
		String host = "pawscomp2.sis.pitt.edu";
		int rport = 3306;
		String user = "root";
		String password = "infoGrass5";
		try {
			// Set StrictHostKeyChecking property to no to avoid UnknownHostKey
			// issue
			java.util.Properties config = new java.util.Properties();
			config.put("StrictHostKeyChecking", "no");
			JSch jsch = new JSch();
			session = jsch.getSession(user, host, 22);
			session.setPassword(password);
			session.setConfig(config);
			session.connect();
			System.out.println("Connected");
			int assinged_port = session.setPortForwardingL(lport, rhost, rport);
			System.out.println("localhost:" + assinged_port + " -> " + rhost + ":"
					+ rport);
			System.out.println("Port Forwarded");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return session;
	}

	public static Connection getConnection(Session session, String schemaName) {
		int lport = 5656;
		String dbuserName = "root";
		String dbpassword = "!nfoGrass5";
		String url = "jdbc:mysql://localhost:" + lport + "/" + schemaName + "?useSSL=false";
		String driverName = "com.mysql.jdbc.Driver";
		Connection conn = null;

		try {
			// mysql database connectivity
			Class.forName(driverName).newInstance();
			conn = DriverManager.getConnection(url, dbuserName, dbpassword);
			System.out.println("Database connection established");
			System.out.println("DONE");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static void close(Connection conn, Session session) {
		try {
			if (conn != null && !conn.isClosed()) {
				System.out.println("Closing Database Connection");
				conn.close();
			}
//			if(session !=null && session.isConnected()){
//                System.out.println("Closing SSH Connection");
//                session.disconnect();
//            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
