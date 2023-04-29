<%@ page import="com.example.myLibrary.model.Author" %>
<%@ page import="java.util.List" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Author</title>
</head>
<% List<Author> authors = (List<Author>) request.getAttribute("authors"); %>
<body>
<a href="/"> Back </a>
<h2>Authors</h2><a href="/createAuthor">Create Author</a>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>age</th>
        <th>action</th>
    </tr>
    <% if(authors!= null && !authors.isEmpty()) {%>
    <% for (Author author : authors) { %>
    <tr>
        <td><%=author.getId()%></td>
        <td><%=author.getName()%></td>
        <td><%=author.getSurname()%></td>
        <td><%=author.getEmail()%></td>
        <td><%=author.getAge()%></td>
        <td><a href="/removeAuthor?id=<%=author.getId()%>">Delate</a>
            / <a href="updateAuthor?id=<%=author.getId()%>">Update</a></td>
    </tr>

    <%}%>
    <%}%>
</table>
</body>
</html>

