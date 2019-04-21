<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@ page import="javax.swing.JFrame"%>
<%@ page import="org.jfree.chart.ChartPanel" %>
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>

<%! String s1[];%>
<%
   	
//	String a2 = request.getQueryString();
	//session.setAttribute("gp",a2);

String query=("SELECT fid,Blowfish,IDEA FROm graph2 where fid=1");


//String query=("SELECT device,de,d1 FROM temp1");


try{
	//Connection con=databasecon.getconnectio,n();
 //Statement st=con.createStatement();
JDBCCategoryDataset dataset=new JDBCCategoryDataset ("jdbc:mysql://localhost:3306/crypt","com.mysql.jdbc.Driver","root","root");

  JFrame frame = new JFrame("Charts");



 //query=sq1+sq2+sq3;

dataset.executeQuery(query);

JFreeChart chart = ChartFactory.createBarChart3D("Algorithm Performance","Algorithm Names","NanoSeconds",dataset,PlotOrientation.VERTICAL,true, true, false);


ChartUtilities.saveChartAsJPEG(new File("D://Graph//filter2.jpg"), chart, 600, 400);
//response.sendRedirect("graph_view.jsp");


%>
<img src="Graph/filter2.jpg" alt="cover_main" width="400" height="300" />

<%}
catch (IOException e)
{
	e.printStackTrace();
System.out.println("Problem in creating chart.");
}
%>