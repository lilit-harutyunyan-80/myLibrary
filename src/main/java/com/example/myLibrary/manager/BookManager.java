package com.example.myLibrary.manager;

import com.example.myLibrary.db.DBConnectionProvider;
import com.example.myLibrary.model.Book;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BookManager {

    private DBConnectionProvider DBConnectionProvider;
    private Connection connection = DBConnectionProvider.getInstance().getConnection();
    private BookManager bookManager = new BookManager();

    public void save(Book book) {
        try (Statement statement = connection.createStatement()) {
            String sql = "INSERT INTO book(title,description,price,author_id) VALUES('%s','%s','%d',%d)";
            statement.executeUpdate(String.format(sql, book.getTitle(), book.getDescription(), book.getPrice(),
                    book.getId()), Statement.RETURN_GENERATED_KEYS);
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                book.setId(generatedKeys.getInt(1));
            }
            System.out.println("book inserted into DB");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book getById(int id) {
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("Select * from book where id = " + id);
            if (resultSet.next()) {
                return getBookFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Book> getAll() {
        List<Book> books = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("Select * from book");
            while (resultSet.next()) {
                books.add(getBookFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public List<Book> getAllByAuthorId(int authorId) {
        List<Book> books = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("Select * from book where author_id=" + authorId);
            while (resultSet.next()) {
                books.add(getBookFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    private Book getBookFromResultSet(ResultSet resultSet) throws SQLException {
        Book book = new Book();
        book.setId(resultSet.getInt("id"));
        book.setTitle(resultSet.getString("title"));
        book.setDescription(resultSet.getString("description"));
        book.setPrice(resultSet.getInt("price"));
        int authorId = resultSet.getInt("author_id");
        book.setAuthor(bookManager.getById(authorId).getAuthor());
        return book;
    }


    public void removeById(int authorId) {
        String sql = "DELETE FROM author WHERE id = " + authorId;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}


