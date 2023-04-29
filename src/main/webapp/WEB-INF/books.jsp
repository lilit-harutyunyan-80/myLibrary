<%@ page import="com.example.myLibrary.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.myLibrary.model.User" %>
<%@ page import="com.example.myLibrary.model.UserType" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Books</title>
</head>
<% List<Book> books = (List<Book>) request.getAttribute("books");
  User user = (User) session.getAttribute("user");%>
<body>
<a href="/"> Back </a>
<h2>Books</h2> <a href="/createBook">Create Book</a>
<table border="1">
  <tr>
    <th>id</th>
    <th>title</th>
    <th>description</th>
    <th>price</th>
    <th>authorId</th>
    <% if (user.getUserType() == UserType.ADMIN) { %>
    <th>action</th>
    <%}%>

  </tr>
  <% if(books != null && !books.isEmpty()) {%>
  <% for (Book book : books) { %>
  <tr>
    <td><%=book.getId()%></td>
    <td><%=book.getTitle()%></td>
    <td><%=book.getDescription()%></td>
    <td><%=book.getPrice()%></td>
    <td><%=book.getAuthor().getName()%></td>
    <% if (user.getUserType() == UserType.ADMIN) { %>

    <td><a href="/removeBook?id=<%=book.getId()%>">Delete</a>
      / <a href="updateBook?id=<%=book.getId()%>">Update</a> </td>
    <%}%>
  </tr>
  <%}%>
  <%}%>
</table>
</body>
</html>
