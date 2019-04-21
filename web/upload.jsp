<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>AES and Twofish </title>
  <meta name="description" content="free website template" />
  <meta name="keywords" content="enter your keywords here" />
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=9" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
</head>

<body>
  <div id="main">
    <div id="header">
	  <div id="banner">
	    <div id="welcome">
	        <h1>Performance   and   Efficiency   Analysis   of   AES and Twofish </h1>
	    </div><!--close welcome-->
	    <div id="welcome_slogan">
	      <h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Block   Cipher   Algorithms      of   Symmetric   Key  Cryptography</center></h1>
	    </div><!--close welcome_slogan-->
	  </div><!--close banner-->
    </div><!--close header-->

	<div id="menubar">
      <ul id="menu">
        <li ><a href="Home.html">Home</a></li>
        <li><a href="File.jsp">CipherGeneration</a></li>
        <!-- <li><a href="Ad.html">Algorithm Description</a></li>
        <li><a href="P.html">Security </a></li>
        <li><a href="Home.Html">Logout</a></li> -->
      </ul>
    </div><!--close menubar-->	
    
	<div id="site_content">		

	  <div class="sidebar_container">       
		<div class="sidebar">
          <div class="sidebar_item">
           
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->     		
		<div class="sidebar">
          <div class="sidebar_item">
             <h2>Data Security</h2>
         
            <p>Data security means protecting data, such as a database, from destructive forces, and from the unwanted actions of unauthorized users</p>     
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
		<div class="sidebar">
          <div class="sidebar_item">
            
            <h3>Need For Encryption Efficiency Analyzer<h3>
            <p>The Existing situation is that there is no mechanism to choose a suitable encryption standard.</p>         
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->  
		<div class="sidebar">
          <div class="sidebar_item">
           
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->  		
        <div class="sidebar">
          <div class="sidebar_item">
            
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
       </div><!--close sidebar_container-->	
	
	  <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="680" height="250" src="images/home_1.jpg" alt="&quot;Be Aware Be Secure&quot;" /></li>
          <li><img width="680" height="250" src="images/home_2.jpg" alt="&quot;Be Aware Be Secure&quot;" /></li>
        </ul>
      </div>	  	 
	 
	<%@page import=" java.sql.*,java.io.*"%>
	<%! int i=0;
	
	StringBuffer sb1=null;
	String thisLine=null;

	%>
	<%
String fid=request.getParameter("fid");
String fnm=request.getParameter("fnm");
String file=request.getParameter("file");
String path="F://"+file;
File f=new File(path);
 try{
         BufferedReader br = new BufferedReader(new FileReader(f));
		 StringBuffer sb=new StringBuffer();
         while ((thisLine = br.readLine()) != null) {
          //  System.out.println(thisLine);
			
                sb1=sb.append(thisLine);

		 }
		}
		catch(Exception e){
		e.printStackTrace();}
		%>

	  <div id="content">
        <div class="content_item">

		 <form action="upload1.jsp">
		 <table align=center>
	<!-- 
	<tr>
		<td><font color="0066ff" size=+1><b>FileID</td><td><input type="text" name="fid" value=<%=fid%>></td>
	</tr> -->
	<tr>
		<td><font color="0066ff" size=+1><b>FileName</td><td><input type="text" name="fnm" value=<%=fnm%>></td>
	</tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td><font color="0066ff" size=+1><b>FileData</td>

	<td><textarea name="file" cols="50" rows="10"><%=sb1%></textarea></td>
</tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td><font color="0066ff" size=+1><b>Select Algorithm&nbsp;&nbsp;</font></td><td><font color="red" size=+1><b><input type="checkbox" name="BLOWFISH" value="BLOWFISH">AES &nbsp;&nbsp;&nbsp;<input type="checkbox" name="IDEA" value="IDEA">Twofish &nbsp;&nbsp;&nbsp;</td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td></td>
<td><input type="submit" value="Encrypt"></td>
		
</tr>

</table>
   </form>
<table align="center">
<tr><td></td><td></td><td width="60%"><!-- <input type="image" src="images/en2.jpg" name="image" width="150" height="40"> --><center></center></td></tr>


</table>
		 </div><!--close content_container-->
         <div class="content_container">
		 </div><!--close content_container-->			  
		</div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content--> 
    
	<!--close main-->
  
   <div id="footer">
	 
  </div><!--close footer--> 
  
</body>
</html>
