<%@ page import="java.sql.*" %>  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("dashboard")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("property.jsp");
}
%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","Aiyshu@19"); //create connection
	
	if(request.getParameter("btn_book")!=null) //check register button click event not null
	{
		String Room_id,phonenumber,startdate,enddate;
		 
                Room_id=request.getParameter("txt_Room_id");
		
		phonenumber=request.getParameter("txt_phonenumber"); //txt_phonenumber
               
                startdate=request.getParameter("txt_startdate");  
		enddate=request.getParameter("txt_enddate"); 
		PreparedStatement pstmt=null; //create statement
                String userid = (String) session.getAttribute("userid");
		
                pstmt=con.prepareStatement("insert into book( Room_id,phonenumber,startdate,enddate,booked_user_id) values(?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,Room_id);
                
		pstmt.setString(2,phonenumber);
                
                pstmt.setString(3,startdate);
                pstmt.setString(4,enddate);
                pstmt.setString(5,userid);
		
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...!"); //register success messeage

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
 <title>Register</title>
 <style>
  
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
     
    }
   .row.content {height: 450px}
   
  </style>
        
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	
	<script>	
	
		/*function validate()
		{
                        var room_id=/^[0-9\b]+$/;
			
			var phone_number= /^\d{10}$/;
                        
                        var Start_date= /^[0-9\b]+$;
                        var End_date= /^[0-9\b]+$;
                        var rid=document.getElementById("rid");
			
                        var number= document.getElementById("number");
                        var cname= document.getElementById("cname");
                        var bspace= document.getElementById("bspace");
                        var dura= document.getElementById("dura");
                        var rtype= document.getElementById("rtype");
                        var sdate= document.getElementById("sdate");
                        var edate= document.getElementById("edate");
			
			if(!first_name.test(fname.value) || fname.value==null) 
            {
				alert("Enter Firstname Alphabet Only....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!last_name.test(lname.value) || lname.value==null) 
            {
				alert("Enter Lastname Alphabet Only....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(mail.value) || mail.value==null) 
            {
				alert("Enter Valid Email....!");
                mail.focus();
                mail.style.background = '#f08080';
                return false;                    
            }
           
	     if(!company_name.test(cname.value) || cname.value==null) 
            {
				alert("Fill this field....!");
                cname.focus();
                cname.style.background = '#f08080';
                return false;                    
            }
             if(!Space.test(bspace.value) || bspace.value==null) 
            {
				alert("Fill this field....!");
                bspace.focus();
                bspace.style.background = '#f08080';
                return false;                    
            }
              if(!Duration.test(dura.value) || dura.value==null) 
            {
				alert("Fill this field....!");
                dura.focus();
                dura.style.background = '#f08080';
                return false;                    
            }
              if(!Rent_type.test(rtype.value)) 
            {
				alert("Fill this field....!");
                rtype.focus();
                rtype.style.background = '#f08080';
                return false;                    
            }
              
		}*/
         
	$(document).ready(function(){
            $("#sdate").datepicker({
                minDate:0
         
            });
        });
	$(document).ready(function(){
            $("#edate").datepicker({
                minDate:0
         
            });
        });

	</script>	

</head>


<body>


  <div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/background.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Register a new Business Space</h1>
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
                    <div class="form-row">
                      <label>
                         <span>Room_id</span>
                      
                        <select name="txt_Room_id" id="rid" required>
                             <option value="">SELECT</option>
                             <option value="1">1</option>
                             <option value="2">2</option>
                             <option value="3">3</option>
                             <option value="4">4</option>
                             <option value="5">5</option>
                             <option value="6">6</option>
                             <option value="7">7</option>
                             <option value="8">8</option>
                             <option value="9">9</option>
                             <option value="10">10</option>
                            
                        </select>
                       
                      </lable>
                   
				   
                   
                     
                    <div class="form-row">
                        <label>
                            <span>PhoneNumber</span>
                            <input type="number" name="txt_phonenumber" id="number" placeholder="enter phonenumber" required>
                        </label>
                    </div>
                       
                    
                    
                   

                 <div class="form-row">
                        <label>
                            <span>Start-Date</span>
                            <input type="text" name="txt_startdate" id="sdate" placeholder="enter startdate" required>
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>End-Date</span>
                            <input type="text" name="txt_enddate" id="edate" placeholder="enter enddate" required>
                        </label>
                    </div>
                          <center> <input type="submit" name="btn_book" value="BOOK-SPACE"></center>
                    </div>

					
					
                </div>
				
               

            </div>

        </form>
           <a href="dashboard.jsp"><center><b>Back to dashboard</b></center></a>
         <footer class="container-fluid text-center">
  <p><center>ABC Entertainment and Real Estate Pvt Ltd</center></p>
</footer>
    </div>

</body>

</html>