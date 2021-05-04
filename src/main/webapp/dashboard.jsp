<!DOCTYPE html>
<html lang="en">
<head>
  <title>E_MALL</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
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
        <li class="active"><a href="dashboard.jsp">HOME</a></li>
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

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="./Img/pm.jpg" alt="Image">
        <div class="carousel-caption">
          
        </div>      
      </div>

      <div class="item">
        <img src="./Img/mall.jpg" alt="Image">
        <div class="carousel-caption">
          
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
  <h3>E-Mall</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <img src="./Img/fc.jpg" class="img-responsive" style="width:100%" alt="Image">
      <p>Food Court</p>
    </div>
    <div class="col-sm-4"> 
      <img src="./Img/inox.jpg" class="img-responsive" style="width:100%" alt="Image">
      <p>Cini</p>    
    </div>
    <div class="col-sm-4"> 
      <img src="./Img/mall.jpg" class="img-responsive" style="width:100%" alt="Image">
      <p>Infrastructure</p>    
    </div>
    
  </div>
</div><br>

<footer class="container-fluid text-center">
  <p>ABC Entertainment and Real Estate Pvt Ltd</p>
</footer>

</body>
</html>