<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.sql.PreparedStatement"%>
<html lang="en">
<head>
  <link rel ="icon" href="https://icon-library.com/images/property-icon-png/property-icon-png-15.jpg" type ="image/x-icon">
        
  <title>Tenant</title>
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
        <li><a href="#">Home</a></li>
        <li><a href="Aboutus.jsp">About</a></li>
        
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="admindash.jsp"><span class="glyphicon glyphicon-log-in"></span>Back</a></li>
      </ul>
    
    </div>
  </div>
</nav>
<style>
body {
  background-image: url('./Img/aboutback.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
 
 <div class="container-fluid text-center">  
       <h1 style="color:Black;"><b>Tenants Detail</b></h1>
</div>

</div>
<head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Tenants</title>

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

<table align="center" class="table table-striped cellpadding="10" cellspacing="10" width="700px" height="100"  border="3">

<tr bgcolor="#E6E6FA">
<td>Id</td>
<td>FirstName</td>
<td>LastName</td>
<td>Email</td>

<td>Room Id</td>

<td>PhoneNumber</td>
<td>Start date</td>
<td>End Date</td>




</tr>
<%
try{

String sql = "SELECT * FROM login JOIN book ON (login.id = book.booked_user_id) WHERE booked_user_id IS NOT NULL";
pstmt = connection.prepareStatement(sql);

resultSet = pstmt.executeQuery();

while(resultSet.next()){
%>


<tr bgcolor="#FFFAFA">
<td><%= resultSet.getInt("id")%></td>
<td><%= resultSet.getString("firstname")%></td>
<td><%= resultSet.getString("lastname")%></td>
<td><%= resultSet.getString("email")%></td>

<td><%= resultSet.getInt("Room_id")%></td>

<td><%= resultSet.getString("phonenumber")%></td>
<td><%= resultSet.getString("startdate")%></td>
<td><%= resultSet.getString("enddate")%></td>



</tr>
<%} %>



</table>

<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
