<%@page language="java" contentType="application/x-msdownload" pageEncoding="gb2312"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="Utils.Report"%>
<%@ page language="java" import="java.io.*"%>
<%@ page import="java.net.URLEncoder"%>

<%@ page language="java" import="com.itextpdf.text.Document"%>
<%@ page language="java" import="com.itextpdf.text.DocumentException"%>
<%@ page language="java" import="com.itextpdf.text.Paragraph"%>
<%@ page language="java" import="com.itextpdf.text.pdf.PdfWriter"%>

<%   
  response.reset();
  response.setContentType("application/x-download");   

Document document = new Document();
		String text = "";
		try{
			PdfWriter.getInstance(document, new FileOutputStream("c:/Report.pdf")); 
			document.open();
			document.addTitle("Debug Report");
			document.addAuthor("sjtu");
			document.add(new Paragraph("Debug Report:"));
			Vector<Report> reports = (Vector<Report>) request.getSession()
									.getAttribute("reports");
			for (int i = 0; i < reports.size(); i++) {
				document.add(new Paragraph(" "));
				Report report = reports.get(i);
				text = Integer.toString(i + 1);
				text += ". " +  report.getFilePath();
				document.add(new Paragraph(text));
				text = "Line:" + report.getLine();
				document.add(new Paragraph(text));
				text = "Infomation:" + report.getInfo();
				document.add(new Paragraph(text));
			}
			
		}
		catch(DocumentException de){
			
		}
		catch(IOException ioe){
			
		}

		document.close();
  
String filedownload = "c:/Report.pdf";   
 String filedisplay = "Report.pdf";   
 filedisplay = URLEncoder.encode(filedisplay,"UTF-8");   
  response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);   
  
  java.io.OutputStream outp = null;   
  java.io.FileInputStream in = null;   
  try   
  {   
  outp = response.getOutputStream();   
  in = new FileInputStream(filedownload);   
  
  byte[] b = new byte[1024];   
  int i = 0;   
  
  while((i = in.read(b)) > 0)   
  {   
  outp.write(b, 0, i);   
  }   
//     
outp.flush();   
out.clear();   
out = pageContext.pushBody();   
}   
  catch(Exception e)   
  {   
  System.out.println("Error!");   
  e.printStackTrace();   
  }   
  finally   
  {   
  if(in != null)   
  {   
  in.close();   
  in = null;   
  }     
  }   
%>  

