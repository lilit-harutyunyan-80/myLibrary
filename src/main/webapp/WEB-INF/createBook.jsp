<%@ page import="com.example.myLibrary.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create Book</title>
</head>
<%List<Book> books = (List<Book>) request.getAttribute("books"); %>
<body>
<a href="/books"> Back </a>

<h2>Create Book</h2>
<form action="/createBook" method="post">
  name: <input type="text" name="name"><br>
  title: <input type="text" name="title"><br>
  description: <input type="text" name="description"><br>
  price: <input type="number" name="price"><br>
  author:
  <select name="authorId">
    <% for (Book book : books) { %>
    <option value="<%=book.getId()%>"><%=book.getTitle()%> <%=book.getDescription()%> <%=book.getPrice()%></option>
    <% }%>
  </select>
  <input type="submit" value="create">
</form>
</body>
</html>
