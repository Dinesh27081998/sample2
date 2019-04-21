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
            <h2>Encryption</h2>
            <p>Encryption provides Data Security.It also provides privacy to an organisation's Website,database . </p>
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
	 
	<%@page import="java.sql.*,java.io.*,crypt.Blowfish,crypt.IDEA"%>
	<%! int i=0;
	
	StringBuffer sb1=null;
	String thisLine=null;String encryptedData=null,encryptedData1=null,encryptedData2=null;
	String algm=null,algm1=null,algm2=null;
	String ebyte=null,dbyte=null;

	%>
	<%! Connection con=null;
	Statement st=null,st1=null,st2=null,st3=null;
	ResultSet rs=null,rs1=null,rs2=null,rs3=null;%>
	<%
String fid=request.getParameter("fid");
String fnm=request.getParameter("fnm");
String file=request.getParameter("file");
algm=request.getParameter("BLOWFISH");
algm1=request.getParameter("IDEA");
System.out.println("algm="+algm);
System.out.println("algm1="+algm1);
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crypt","root","root");
st=con.createStatement();
st1=con.createStatement();
st2=con.createStatement();
st3=con.createStatement();
if(algm.equals("BLOWFISH")){

rs=st.executeQuery("select *from graph where fid=1");
if(rs.next())
{
	
      byte key[]=Blowfish.generateSymmetricKey();
	  byte raw[]=Blowfish.getRawKey(key);
		byte[] ibyte = file.getBytes();

           long startTime = System.nanoTime();
		
		byte[] ebyte=Blowfish.encrypt(raw, ibyte);
		long endTime = System.nanoTime();
		System.out.println("DES="+(endTime - startTime)); 
		double blow = (double)(endTime - startTime)/1000000000.0;
		double min=blow/60;
	System.out.println("blow="+blow);
		//System.out.println("="+min);
      System.out.println();

		Blowfish d=new Blowfish();
		d.setKey(raw);
		d.setData(ebyte);
		 encryptedData = new String(ebyte);
		 String raw1=new String(raw);
		 System.out.println("size="+encryptedData.length());
		System.out.println("Encrypted message "+encryptedData);
		session.setAttribute("raw",raw);
		session.setAttribute("edata",ebyte);
	int i=st.executeUpdate("update graph set blowfish="+encryptedData.length()+" where fid=1 ");
		int i1=st.executeUpdate(" update graph1 set blowfish="+(endTime - startTime)+" where fid=1 ");
		if(i>0){System.out.println("update Blowfish");}
}
}
if(algm1.equals("IDEA")){

rs=st.executeQuery("select *from graph where fid=1");
if(rs.next())
{
	 IDEA i=new IDEA("IDEA");
	
      byte key[]= IDEA.setSymmetricKey();
	  byte raw[]=IDEA.getRaw(key);
		byte[] ibyte = file.getBytes();

           long startTime = System.nanoTime();
		ebyte=i.encrypt(file, raw);
long endTime = System.nanoTime();
		long startTime1 = System.nanoTime();
		dbyte=i.decrypt(ebyte,raw);
      long endTime1 = System.nanoTime();
		
		System.out.println("IDEA="+(endTime - startTime)); 
		double blow = (double)(endTime - startTime)/1000000000.0;
		double min=blow/60;
		System.out.println("ebyte="+ebyte);
	System.out.println("dbyte="+dbyte);
		//System.out.println("="+min);
      System.out.println();

		i.setKey(raw);
		i.setData(ebyte);
		 //encryptedData1= new String(ebyte);
		 String raw1=new String(raw);
		 System.out.println("size="+ebyte.length());
		System.out.println("Encrypted message "+encryptedData1);
		//session.setAttribute("raw1",raw1);
		session.setAttribute("ddata",dbyte);
	int j=st1.executeUpdate(" update graph set IDEA="+ebyte.length()+" where fid=1 ");
		int i2=st1.executeUpdate(" update graph1 set IDEA="+(endTime - startTime)+" where fid=1 ");
			int i1=st1.executeUpdate(" update graph2 set IDEA="+(endTime1 - startTime1)+" where fid=1 ");
		if(i1>0){System.out.println("update IDEA");}
}
}

%>

	  <div id="content">
        <div class="content_item">

		 <form action="upload2.jsp" method="post"><br><br>
		 <table align=center>
	
	<!-- <tr>
		<td><font color="0066ff" size=+1><b>FileID</td><td><input type="text" name="fid" value=<%=fid%>></td>
	</tr> -->
	<tr>
		<td><font color="0066ff" size=+1><b>FileName</td><td><input type="text" name="fnm" value=<%=fnm%>></td>
	</tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td><font color="0066ff" size=+1><b>FileData</td>

	<td><textarea name="file" cols="20" rows="10"><%=encryptedData%></textarea><textarea name="file1" cols="20" rows="10"><%=ebyte%></textarea></td>
</tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td><font color="0066ff" size=+1> Select Algorithm&nbsp;&nbsp;</font></td><td><font color="red" size=+1><b><input type="checkbox" name="BLOWFISH" value="BLOWFISH"> AES &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="IDEA" value="IDEA"> Twofish &nbsp;&nbsp;&nbsp;</td></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td></td></td></tr><tr></tr><tr></tr><tr></tr>
<tr><td></td>
<td><input type="submit" value="Decrypt"></td>
		
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
    

  
    <div id="footer">
	 
  </div>
</body>
</html>
