<%@ page import="java.sql.*" %> 
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%> 

<%
if(session.getAttribute("addproperty")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("admindash.jsp");
}
%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser1","root","Aiyshu@19"); //create connection
	
	if(request.getParameter("btn_addproperty")!=null) //check register button click event not null
	{
		String Business_space,Duration,Rent_type,Cost_per_unit,Status;
		
		Business_space=request.getParameter("txt_Business_space"); //txt_firstname
		Duration=request.getParameter("txt_Duration"); //txt_lastname
		Rent_type=request.getParameter("txt_Rent_type"); //txt_email
		Cost_per_unit=request.getParameter("txt_Cost_per_unit"); //txt_password
	        Status=request.getParameter("txt_Status"); //txt_password
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into addproperty(Business_space,Duration,Rent_type,Cost_per_unit,Status) values(?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,Business_space);
		pstmt.setString(2,Duration);
		pstmt.setString(3,Rent_type);
		pstmt.setString(4,Cost_per_unit);
		pstmt.setString(5,Status);
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Property Added Successfully...!"); //register success messeage
                
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

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel ="icon" href="https://icon-library.com/images/property-icon-png/property-icon-png-15.jpg" type ="image/x-icon">
        
	<title>Add Property</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			
			var cost_per_unit =/^[0-9\b]+$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 
			
			var bspace = document.getElementById("bspace"); //textbox id fname
                        var dura = document.getElementById("dura"); //textbox id lname
                        var rtype = document.getElementById("rtype"); //textbox id email
                        var cost = document.getElementById("cost"); //textbox id password
	                var status = document.getElementById("status"); 
			if(!business_space.test(bspace.value) || bspace.value==null) 
            {
				alert("Enter Alphabet Only....!");
                bspace.focus();
                bspace.style.background = '#f08080';
                return false;                    
            }
			if(!duration.test(dura.value) || dura.value==null) 
            {
				alert("Enter Duration Alphabet Only....!");
                dura.focus();
                dura.style.background = '#f08080';
                return false;                    
            }
			if(!rent_type.test(rtype.value) || rtype.value==null) 
            {
				alert("Enter Valid Rent type....!");
                rtype.focus();
                rtype.style.background = '#f08080';
                return false;                    
            }
			if(!cost_per_unit.test(cost.value) || cost.value=='') 
            {
				alert("Cost per unit must be in numbers");
                cost.focus();
                cost.style.background = '#f08080';
                return false;                    
            }
             
         function clickAndDisable(Status) {
     // disable subsequent clicks
     Status.onclick = function(event) {
        event.preventDefault();
     }
   }  
    
            
		}
		
	</script>	

</head>

<body>

  
<div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/background.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>ADD PROPERTY</h1>
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
                         <span>Business-Space</span>
                         <select name="txt_Business_space" id="bspace" required>
                             <option value="">SELECT</option>
                             <option value="Small-shop(600 sqft)">Small-Shop(600 sqft)</option>
                             <option value="Medium-shop(1000 sqft)">Medium-Shop(1000 sqft)</option>
                             <option value="Large-shop(2000 sqft)">Large-Shop(2000 sqft)</option>
                             <option value="Atrium-north and west">Atrium-North and West</option>
                             <option value="Atrium-south">Atrium-South</option>
                             <option value="Cinima-theater">Cinima-Theater</option>
                             <option value="Marketing-banner">Marketing-Banner</option>
                         </select>
                        </lable>
                    </div>
		 <div class="form-row">
                    <label>
                        <span>Duration</span>
                        <select name="txt_Duration" id="dura" required>
                             <option value="">SELECT</option>
                             <option value="All-days">All-days</option>
                             <option value="Week-Days">Week-Days</option>
                             <option value="Week-Ends">Week-Ends</option>
                             <option value="Public-Holidays">Public-Holidays</option>
                            
                        </select>
                     </label>
                  </div>

                <div class="form-row">
                   <label>
                     <span>Rent-Type</span>
                       <select name="txt_Rent_type" id="rtype" required>
                             <option value="">SELECT</option>
                             <option value="Day-Wise">Day-wise</option>
                             <option value="Week-Wise">Week-wise</option>
                             <option value="Hour-Wise">Hour-wise</option>
                             <option value="Sqft">Sqft</option>
                        </select>
                         
                    </label>
                 </div>

                    <div class="form-row">
                        <label>
                            <span>Cost Per Unit</span>
                            <input type="text" name="txt_Cost_per_unit" id="cost" placeholder="enter cost per unit" required>
                        </label>
                    </div> 
                 <div class="form-row">
                   <label>
                     <span>Status</span>
                       <select name="txt_Status" id="status" required>
                                <option value="select" selected="selected">Select</option>
                                <option value="Available">Available</option>
                                <option value="UnAvailable">UnAvailable</option>

                            
                       </select>
                     </label>
                 </div>
                 
                                        

					<input type="submit" name="btn_addproperty" value="ADD PROPERTY">
					
                </div>
				
                <a href="admindash.jsp" class="form-log-in-with-existing">Already have add the property?</a>

            </div>

        </form>

    </div>

</body>
<footer class="container-fluid text-center">
  <p><center>ABC Entertainment and Real Estate Pvt Ltd</center></p>
</footer>
</html>
