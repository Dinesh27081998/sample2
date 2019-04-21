<%@ page import="javax.swing.JFrame"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="org.jfree.chart.ChartPanel" %>
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>

<%! String s1[];
String sql1,sq21;
%>
<%
ArrayList l=new ArrayList(); 
ArrayList l1=new ArrayList(); 
	String a2 = request.getQueryString();
	//session.setAttribute("gp",a2);
Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/visual","root","root");
 Statement s2=con.createStatement();
 Statement s11=con.createStatement();
 Statement s13=con.createStatement();
 String unm=(String)session.getAttribute("user");
String query=("SELECT nodes FROM userprofile where usern='"+unm+"');
ResultSet r=s2.executeQuery(query);
if(r.next())
{
String s=r.getString(1);
 s1=s.split(";");

	for(int i=0;i<s1.length;i++)
	{
	l.add(s1[i]);
}
}
String sq1="create table temp1(eid varchar(30),";
		String sq2="";
		int c=0;
		for(int i=0; i<l.size();i++)
		{ 
			System.out.println("ss="+l.get(i));

			if(i==0){
				sq2=sq2+l.get(i)+" "+"varchar(30)"; 
			
			}
			else{
				sq2=sq2+", "+l.get(i)+" "+"varchar(30)"; 
			}
		}
		
		String sq3=")";
		String sql=sq1+sq2+sq3;
		System.out.println(sq1+sq2+sq3);
		 s11.executeUpdate("delete from temp1");
               s11.executeUpdate(sql);

			
			   
			   
			   for(int i=0;i<s1.length;i++)
	             {
		System.out.println("v="+l.get(i));
	Statement s12=con.createStatement();
String query1=("SELECT count(*)FROM url where keywords='"+l.get(i)+"'");
ResultSet r5=s12.executeQuery(query1);

if(r5.next())
		{

	  System.out.println("s="+r5.getString(1));
	l1.add(r5.getString(1));
		}
	}
	  l.clear();

sql1="insert into temp1 values ('Keyword',";
		 sq21="";
		//int c=0;
		for(int i=0; i<l1.size();i++)
		{

			if(i==0){
				sq21=sq21+l1.get(i); 
			}
			else{
				sq21=sq21+", "+l1.get(i); 
			}
		}
		
		String sq31=")";
		System.out.println("s1="+sql1+sq21+sq31);


   int i=s13.executeUpdate(sql1+sq21+sq31);
   System.out.println("i="+i);

	  l1.clear();
System.out.println(l1.size());

response.sendRedirect("graph_filter_perf.jsp");
%>