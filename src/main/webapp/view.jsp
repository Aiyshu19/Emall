<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
  <link rel ="icon" href="https://icon-library.com/images/property-icon-png/property-icon-png-15.jpg" type ="image/x-icon">
        
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
        <li><a href="#">Home</a></li>
        <li><a href="Aboutus.jsp">About</a></li>
        <li><a href="payment.html">Payment</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span>Back</a></li>
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
       <h1 style="color:Black;"><b>WELCOME TO E-MALL</b></h1>
</div>

</div>
<head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>BOOK BUSINESS SPACE</title>

    </head>

    <body>
<%
String id = request.getParameter("userid");
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
%>
<!DOCTYPE html>
<html>

<body>

<h2 align="center"><font><strong>Book Business-space</strong></font></h2>
<table align="center" class="table table-striped cellpadding="10" cellspacing="10" width="700px" height="100"  border="3">
<tr bgcolor="#E6E6FA">
<td>Room_id</td>
<td>Business_space</td>
<td>Database</td>
<td>Rent_type</td>
<td>Cost_per_unit</td>
<td>Status</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from addproperty";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#FFFAFA">
<td><%=resultSet.getInt("Room_id") %></td>
<td><%=resultSet.getString("Business_space") %></td>
<td><%=resultSet.getString("Duration") %></td>
<td><%=resultSet.getString("Rent_type") %></td>
<td><%=resultSet.getString("Cost_per_unit") %></td>
<td><%=resultSet.getString("Status") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>