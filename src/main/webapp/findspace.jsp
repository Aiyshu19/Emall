<%@page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%

    String Business_space = request.getParameter("Business_space");
    
   
    try {

 
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","Aiyshu@19");
        
        
        PreparedStatement st  = con.prepareStatement("select * from addproperty where  Business_space=?");

        st.setString(1,  Business_space); 

         ResultSet rs = st.executeQuery();

        ResultSetMetaData rsmd = rs.getMetaData(); 
        
       
       if (rs.next()) {
      
      
%>

<jsp:include page="dashboard.jsp"/>

<%


     

    out.print("<table width=25% border=1 align=center>");

    out.print("<tr>");

    out.print("<td>" + rsmd.getColumnName(1) + "</td>");

    out.print("<td>" + rs.getString(1) + "</td></tr>");

    out.print("<tr><td>" + rsmd.getColumnName(2) + "</td>");

    out.print("<td>" + rs.getString(2) + "</td></tr>");

    out.print("<tr><td>" + rsmd.getColumnName(3) + "</td>");

    out.print("<td>" + rs.getString(3) + "</td></tr>");

    out.print( "<tr><td>" +  rsmd.getColumnName(4) + "</td>");

    out.print("<td>" + rs.getString(4) + "</td></tr>");
    out.println("</table>"); 
    
} else
{

    out.println("Product Not Available....");

%>

<jsp:include page="dashboard.jsp"/>

<%}

    } catch (Exception ex) {

        System.out.println(ex);

    }

%>