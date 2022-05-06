<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>all product edit product</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
 .search-container {
      float: right;
    }
   .search-container button {
      float: right;
      padding: 6px 10px;
      margin-top: 8px;
      margin-right: 16px;
      background: #ddd;
      font-size: 17px;
      border: none;
      cursor: pointer;
    }
    
 .search-container button:hover {
      background: #ccc;
    }
      input[type=text] {
      padding: 6px;
      margin-top: 8px;
      font-size: 17px;
      border: none;
    }
    @media screen and (max-width: 600px) {
      .search-container {
        float: none;
      }
       a, input[type=text],.search-container button {
        float: none;
        display: block;
        text-align: left;
        width: 100%;
        margin: 0;
        padding: 14px;
      }
     input[type=text] {
        border: 1px solid #ccc;  
      }
      }
  
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
 String msg=request.getParameter("msg");
      if("done".equals(msg))
                {%>
                   <h3 class="alert">Item Successfully Updated!</h3>
       
                <%}
      if("deleted".equals(msg))
                {%>
                  <h3 class="alert">Item Deleted Successfully</h3>
               
                <%}
        if("wrong".equals(msg))
                {%>
                <script>
                      Swal.fire("Item Already Exists!!","enter other name","error");
                 </script>
                 
                <%}

%>
<table>
        <thead>
            <tr>
        
             <div class="search-container" >
                <form action="itemSearch.jsp" method="post">
                    <input type="text" placeholder="Search" name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>    
                </form>
             </div>
       
            </tr>
          <tr>
            <th scope="col">S No.</th>
            <th scope="col">Name</th>
            
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Category</th>
          
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
            <th scope="col">Delete <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
           int sno=0;
           try{
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement stmt =con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from menuitems");
                while(rs.next())
                {
           
       %>
          <tr>
              <%sno=sno+1;%>
            <td><%out.println(sno);%></td>
            <td><%=rs.getString(2) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(3) %></td>
    
            <td><%=rs.getString(4) %></td>
            <td><a style="color:#8a1a30" href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
            <td><a onclick="checker()" style="color:#8a1a30" href="deleteItem.jsp?id=<%=rs.getString(2)%> ">Delete <i class='fas fa-trash-alt'></i></a></td>
          
          </tr>
         <%
          }
          }
      catch(Exception e)
        {
         System.out.println(e);
        }
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>
 <script>
            function checker()
            {
                var res=confirm('Are you sure want to delete this item?');
                if(res ===false)
                {
                    event.preventDefault();
                }
            }
        </script>
</body>
</html>