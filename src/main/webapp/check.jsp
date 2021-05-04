<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
  <title>E-MALL</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
     
    }
   .row.content {height: 450px}
   
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
     <ul class="nav navbar-nav">
        <li class="active"><a href="check.jsp">HOME</a></li>
        <li><a href="profile.jsp">PROFILE</a></li>
        <li><a href="Aboutus.jsp">ABOUT</a></li>
        <li><a href="payment.html">PAYMENT</a></li>
        <li><a href="formpage.html">CONTACT</a></li>
        <li><a href="complain.jsp">COMPLAINT</a></li>
        <li><a href="vacancy.jsp">BOOK PROPERTY</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li><p style="color: white; "> Welcome, <%=session.getAttribute("login")%></p></li>
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
      </ul>
    
    </div>
  </div>
</nav>
<style>
body {
  background-image: url('aboutback.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
 
 <div class="container-fluid text-center">  
       <h1 style="color:Black;"><b>WELCOME TO E-MALL</b></h1>
</div>

</div>
<head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

       

    </head>

    <body>
<%
String id = (String) request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "dbuser1";
String userid = "root";
String password = "Aiyshu@19";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
PreparedStatement pstmt=null; 
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
%>
<!DOCTYPE html>
<html>

<body>


<%
try{

String sql = " SELECT * FROM book JOIN addproperty ON (book.Room_id = addProperty.Room_id) WHERE booked_user_id = ? ";
pstmt = connection.prepareStatement(sql);
pstmt.setString(1, (String) session.getAttribute("userid"));
resultSet = pstmt.executeQuery();
String usernameQuery = "SELECT firstname, lastname,email FROM login WHERE id = ?";
PreparedStatement usernamePStmt = connection.prepareStatement(usernameQuery);
usernamePStmt.setString(1, (String) session.getAttribute("userid"));
ResultSet usernameResultSet = usernamePStmt.executeQuery();
while(resultSet.next()){
%>

<% while(usernameResultSet.next()){
%>
<label>FirstName:</label><%= usernameResultSet.getString("firstname")%><br>
<label>LastName:</label><%= usernameResultSet.getString("lastname")%><br>
<label>Email:</label><%= usernameResultSet.getString("email")%></td><br>
<label>Room-id:</label><%= resultSet.getInt("Room_id")%></td><br>
<label>Business-space:</label><%= resultSet.getString("Business_space")%></td><br>
<label>Duration:</label><%= resultSet.getString("Duration")%></td><br>
<label>Rent-Type:</label><%= resultSet.getString("rent_type")%></td><br>
<label>Cost-per-unit:</label><%= resultSet.getString("cost_per_unit")%></td><br>
<%} %>


<% } %>
</table>

<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
