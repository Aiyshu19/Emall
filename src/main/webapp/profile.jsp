<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
<!DOCTYPE html>
<html>
<head>
<head>
<title>E-MALL</title>

 

  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
 


<style>
body{
    margin-top:20px;
    background:#f8f8f8
}
</style>
</head>
<body>

<div class="container">
<div class="row flex-lg-nowrap">
  <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
    
  </div>

  <div class="col">
    <div class="row">
      <div class="col mb-3">
        <div class="card">
          <div class="card-body">
            <div class="e-profile">
              <div class="row">
                <div class="col-12 col-sm-auto mb-3">
                  <div class="mx-auto" style="width: 140px;">
                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                      <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
                    </div>
                  </div>
                </div>
                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                  <div class="text-center text-sm-left mb-2 mb-sm-0">
                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap"><%= usernameResultSet.getString("firstname")%></h4>
                    
                    
                    <div class="mt-2">
                      <button class="btn btn-primary" type="button">
                        <i class="fa fa-fw fa-camera"></i>
                        <span><input type="file" name="changephoto">Change Photo</span>
                      
                      </button>
                    </div>
                  </div>
                  
                </div>
              </div>
              <ul class="nav nav-tabs">
                <li class="nav-item"><a href="#" class="active nav-link">USER PROFILE</a></li>
              </ul>
              <div class="tab-content pt-3">
                <div class="tab-pane active">
                  <form class="form" novalidate="">
                    <div class="row">
                      <div class="col">
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label><strong>First Name:</strong></label>
                              <%= usernameResultSet.getString("firstname")%> 
                            </div>
                          </div>
                        
                          <div class="col">
                            <div class="form-group">
                              <label><strong>Last Name:</strong></label>
                              <%= usernameResultSet.getString("lastname")%> 
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label><strong>Email:</strong></label>
                              <%= usernameResultSet.getString("email")%> 
                            </div>
                          </div>
                        </div>
                        
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-12 col-sm-6 mb-3">
                        <div class="mb-2"><b><h3 style="text-align:center;">Booked Space Detail</h3></b>
                       <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label><strong>Room-ID</strong></label>
                              <%= resultSet.getString("Room_id")%> 
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label><strong>Business-space:</strong></label>
                              <%= resultSet.getString("Business_space")%> 
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label><strong>Duration:</strong></label>
                              <%= resultSet.getString("Duration")%> 
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label><span class="d-none d-xl-inline"><strong>Rent Type:</strong></span></label>
                              <%= resultSet.getString("rent_type")%>
                             
                          </div>
                        </div>
                        </div>
                       <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label><span class="d-none d-xl-inline"><strong>Cost-Per-Unit:</strong></span></label>
                              <%= resultSet.getString("cost_per_unit")%>
                            </div> 
                          </div>
                        </div>
                       
                      </div>
                      <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                        <div class="mb-2"><b></b></div>
                        <div class="row">
                          <div class="col">
                            
                            <div class="custom-controls-stacked px-2">
                              <div class="custom-control custom-checkbox">
                               
                              </div>
                              <div class="custom-control custom-checkbox">
                              
                              </div>
                              <div class="custom-control custom-checkbox">
                               
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

     <p align="center"><button type="button"  class="btn btn-primary"  style="margin-top:15px;" onclick="location.href='dashboard.jsp'">BACK</button>

    </div>

  </div>
</div>
</div>

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
