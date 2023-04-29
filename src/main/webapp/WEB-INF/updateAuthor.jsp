<%@ page import="com.example.myLibrary.model.Author" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Update Author</title>
</head>
<body>
<% Author author = (Author) request.getAttribute("author"); %>
<a href="/authors"> Back </a>

<h2>Update Author</h2>
<form action="/updateAuthor" method="post">
  <input name="id" type="hidden" value="<%=author.getId()%>">
  name: <input type="text" name="name" value="<%=author.getName()%>"><br>
  surname: <input type="text" name="surname" value="<%=author.getSurname()%>"> <br>
  email: <input type="email" name="email" value="<%=author.getEmail()%>"> <br>
  age: <input type="number" name="age" value="<%=author.getAge()%>"> <br>
  <input type="submit" value="update">
</form>
</body>
</html>

