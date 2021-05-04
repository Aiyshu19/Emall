<%@ page import="java.sql.*" %> 
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%> 

<%
if(session.getAttribute("complain")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("check.jsp");
}
%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","Aiyshu@19"); //create connection
	
	if(request.getParameter("btn_submit")!=null) //check register button click event not null
	{
		String username,complaint,phonenumber,message;
		
		username=request.getParameter("txt_username"); //txt_firstname
		
		complaint=request.getParameter("txt_complaint"); //txt_email
		phonenumber=request.getParameter("txt_phonenumber"); //txt_password
	        message=request.getParameter("txt_message"); //txt_password
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into complaint(username,complaint,phonenumber,message) values(?,?,?,?)"); //sql insert query
		pstmt.setString(1,username);
		
		pstmt.setString(2,complaint);
		pstmt.setString(3,phonenumber);
		pstmt.setString(4,message);
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Complaint Registered...!"); //register success messeage
                

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>  
<!DOCTYPE html>
<html>
<head>
  <link rel ="icon" href="https://icon-library.com/images/property-icon-png/property-icon-png-15.jpg" type ="image/x-icon">
        
   <title>Complaint</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
   

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
     
    }
   .row.content {height: 450px}
   
  </style>
   
 <!-- Title Page-->
    <title>Complaint</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/com.css" rel="stylesheet" media="all">

	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			
			var user_name =/^[a-z A-Z]+$/; 
                        
                        var com_for =/^[a-z A-Z]+$/;
                        var phone_num =/^[0-9\b]+$/;
                        var message_for =/^[a-z A-Z]+$/;
			
			var uname = document.getElementById("uname"); //textbox id fname
                        
                        var cfor = document.getElementById("cfor"); //textbox id email
                        var pnum = document.getElementById("pnum"); //textbox id password
	                var msg = document.getElementById("msg"); 
			
		
	</script>	

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
        <li><a href="dashboard.jsp">Home</a></li>
        <li><a href="Aboutus.jsp">About</a></li>
        <li><a href="payment.html">Payment</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="dashboard.jsp"><span class="glyphicon glyphicon-log-in"></span>Back</a></li>
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



 <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Complaint Form</h2>
                </div>

				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
                                               
                                                
					}
					%>
					</p>
				   
				   </br>
				   
               <div class="card-body">
                    <form method="POST">
                        <div class="form-row m-b-55">
                            <div class="value">
                                <div class="form-row">
                                    <div class="name">User Name</div>
                                    <div class="value">
                                     <div class="input-group">
                                         <input class="input--style-5" type="text" id="uname" name="txt_username" required>
                                      </div>
                            </div>
                        </div>
                           
                        </div>
                        <div class="form-row">
                            <div class="name">Complaint Regard</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" id="cfor" name="txt_complaint" required>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Phone Number</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="number" id="pnum" name="txt_phonenumber" required>
                                </div>
                            </div>
                        </div>
                         <div class="form-row">
                            <div class="name">Message</div>
                            <div class="value">
                                <div class="input-group">
                                    
                                  <textarea class="input--style-5" type="text" name="txt_message"  id="msg" placeholder="Message text . . ." required></textarea>
                                </div>
                            </div>
                        </div>
                        
                        
                            <button class="btn btn--radius-2 btn--red"  name="btn_submit" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="./vendor/./jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="./vendor/select2/select2.min.js"></script>
    <script src="./vendor/datepicker/moment.min.js"></script>
    <script src="./vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="./Javascript/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>