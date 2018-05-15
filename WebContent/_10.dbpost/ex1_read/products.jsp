<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
    
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	
    	String sql = "select * from products";
    	
    	
    	try{
    		Context init = new InitialContext();
    		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
    		conn = ds.getConnection();

    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		//JSON 형태로 데이터를 만듭니다.
    		StringBuffer sb = new StringBuffer();
    			sb.append("[");
    			int i = 0;
    		while(rs.next()){
    			i++;
				sb.append("{\"ID\":");
				sb.append("\""+rs.getInt(1) + "\",");
				sb.append("\"NAME\":");
				sb.append("\""+rs.getString(2) + "\",");
				sb.append("\"MODELNUMBER\":");
				sb.append("\""+rs.getString(3) + "\",");
				sb.append("\"SERIES\":");
				sb.append("\""+rs.getString(4) + "\"},");
    		}
				if(i!=0){
					sb.deleteCharAt(sb.length()-1);//맨 마지막 콤마를 제거합니다.
    				sb.append("]");
				}else{
					//데이터가 없는 경우 모두 제거합니다
					//delete(start, end):index 가 start 부터 end-1 까지 제거합니다.
					sb.delete(0,sb.length());
				}
    		//page 가 안바뀐상태에서 한번 요청하면 갱신이 안되고 캐쉬에 남아있는
    		//데이터를 계속 쓰게 됩니다.
    		//ajax 처리시 캐쉬에 저장하지 않겠다고 세팅해야 합니다.
    		response.setHeader("cache-control", "no-cache,no-store");
    		System.out.println(sb.toString());
    		out.print(sb.toString());
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
