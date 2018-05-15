<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="org.json.simple.*" %>
<%
    
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String modelnumber = request.getParameter("modelnumber");
		String series = request.getParameter("series");
    	
    	String sql = "select * from products order by id";
    	String sql2 = "insert into products values(products_seq.nextval,?,?,?)";
    	int a = 1;
    	
    	
    	try{
    		Context init = new InitialContext();
    		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
    		conn = ds.getConnection();

    		
    		if(!name.isEmpty()){
    			pstmt = conn.prepareStatement(sql2);
        		pstmt.setString(1, name);
        		pstmt.setString(2, modelnumber);
        		pstmt.setString(3, series);
        		pstmt.executeUpdate();
        		pstmt.close();
    			
    		}
    			pstmt = conn.prepareStatement(sql);
        		rs = pstmt.executeQuery();
        		
        		
        		//JSON 형태로 데이터를 만듭니다.
        		JSONArray array = new JSONArray();
        		while(rs.next()){
    				JSONObject object = new JSONObject();
    				object.put("ID",rs.getInt(1));
    				object.put("NAME",rs.getString(2));
    				object.put("MODELNUMBER",rs.getString(3));
    				object.put("SERIES",rs.getString(4));
    				array.add(object);
        		}
    	
        		//page 가 안바뀐상태에서 한번 요청하면 갱신이 안되고 캐쉬에 남아있는
        		//데이터를 계속 쓰게 됩니다.
        		//ajax 처리시 캐쉬에 저장하지 않겠다고 세팅해야 합니다.
    				response.setHeader("cache-control", "no-cache,no-store");
        		System.out.println(array);
        		out.print(array);
            		/* out.print(toString()); */
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		if(rs != null)try{rs.close();}
    		catch(SQLException ex){ex.printStackTrace();}
    		if(pstmt !=null)
    			try{pstmt.close();}		//객체를 사용하고 메모리에 반환합니다. //메모리 낭비를 막을 수 있습니다.
    			catch(SQLException ex){ex.printStackTrace();}
    			if(conn != null)
    				try{conn.close();}
    			catch(SQLException ex){ex.printStackTrace();}
    	}
%>
