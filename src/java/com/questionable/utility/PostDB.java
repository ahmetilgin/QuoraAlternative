/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.questionable.utility;

import com.questionable.models.Post;
import com.questionable.models.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author viseshprasad
 */
public class PostDB {

    public static int addPost(Post post) throws IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO post (id, question, content, user_id, category_id, created_date, modified_date, status,likeCount) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? )";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, post.getId());
            ps.setString(2, post.getQuestion());
            ps.setString(3, post.getContent());
            ps.setInt(4, post.getUser().getId());
            ps.setInt(5, post.getCategory().getId());
            ps.setString(6, post.getCreated_date());
            ps.setString(7, post.getModified_date());
            ps.setString(8, post.getStatus());
            ps.setInt(9,post.getLikeCount());
            System.out.println(post.getCategory()+"  "+post.getContent() + " " + post.getUser());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
        }
    }

    public static Post getPost(int id) throws IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM post "
                + "WHERE id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            Post post = null;
            if (rs.next()) {
                post = new Post();
                //id, user_name, password, user_name, type, reg_date
                post.setId(rs.getInt("id"));
                post.setQuestion(rs.getString("question"));
                post.setContent(rs.getString("content"));
                post.setUser(UserDB.getUser(rs.getInt("user_id")));
                post.setCategory(CategoryDB.getCategory(rs.getInt("category_id")));
                post.setCreated_date(rs.getString("created_date"));
                post.setModified_date(rs.getString("modified_date"));
                post.setStatus(rs.getString("status"));
                post.setLikeCount(rs.getInt("likeCount"));
              
            }
            return post;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Post> getPosts() throws IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM post ORDER BY likeCount DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Post> posts = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setQuestion(rs.getString("question"));
                post.setContent(rs.getString("content"));
                post.setUser(UserDB.getUser(rs.getInt("user_id")));
                post.setCategory(CategoryDB.getCategory(rs.getInt("category_id")));
                post.setCreated_date(rs.getString("created_date"));
                post.setModified_date(rs.getString("modified_date"));
                post.setStatus(rs.getString("status"));
                post.setLikeCount(rs.getInt("likeCount"));
                posts.add(post);
            }
            return posts;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static ArrayList<Post> getPostsByUser(int user_id) throws IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM post "
                + "WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            ArrayList<Post> posts = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setQuestion(rs.getString("question"));
                post.setContent(rs.getString("content"));
                post.setUser(UserDB.getUser(rs.getInt("user_id")));
                post.setCategory(CategoryDB.getCategory(rs.getInt("category_id")));
                post.setCreated_date(rs.getString("created_date"));
                post.setModified_date(rs.getString("modified_date"));
                post.setStatus(rs.getString("status"));
                post.setLikeCount(rs.getInt("likeCount"));
                posts.add(post);
            }
            return posts;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static ArrayList<Post> getPostsByStatus(String status) throws IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM post "
                + "WHERE status = ? ORDER BY likeCount DESC";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            ArrayList<Post> posts = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setQuestion(rs.getString("question"));
                post.setContent(rs.getString("content"));
                post.setUser(UserDB.getUser(rs.getInt("user_id")));
                post.setCategory(CategoryDB.getCategory(rs.getInt("category_id")));
                post.setCreated_date(rs.getString("created_date"));
                post.setModified_date(rs.getString("modified_date"));
                post.setStatus(rs.getString("status"));
                post.setLikeCount(rs.getInt("likeCount"));
                
                posts.add(post);
            }
            return posts;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static int updatePost(int post_id, Post post) throws IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE post SET "
                + "question = ?, "
                + "content = ?, "
                + "user_id = ?, "
                + "category_id = ?, "
                + "created_date = ?, "
                + "modified_date = ?, "
                + "status = ? "
                + "WHERE id = ?";

        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, post.getQuestion());
            ps.setString(2, post.getContent());
            ps.setInt(3, post.getUser().getId());
            ps.setInt(4, post.getCategory().getId());
            ps.setString(5, post.getCreated_date());
            ps.setString(6, post.getModified_date());
            ps.setString(7, post.getStatus());
            ps.setInt(8, post_id);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }
        public static int deleteComment(int comment_id)  throws SQLException{
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
           String query = "DELETE FROM comment "
                + "WHERE id = ?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, comment_id);
            return ps.executeUpdate();
        }
        public static int upLikeCountPost(int post_id) throws SQLException {
    
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE post SET "
                + "likeCount = likeCount + 1 "
                + "WHERE id = ?";
        ps = connection.prepareStatement(query);
        try {
            ps.setInt(1,post_id);
        } catch (SQLException ex) {
            Logger.getLogger(PostDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ps.executeUpdate();

        }
        public static int deletePost(int post_id) throws IOException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        //DELETE FROM post WHERE id = 22;
        String query = "DELETE FROM post "
                + "WHERE id = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, post_id);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

      public static int downLikeCountPost(int post_id) throws SQLException {
    
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE post SET "
                + "likeCount = likeCount - 1 "
                + "WHERE id = ?";
        ps = connection.prepareStatement(query);
        try {
            ps.setInt(1,post_id);
        } catch (SQLException ex) {
            Logger.getLogger(PostDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ps.executeUpdate();

    }
  public static ArrayList<Post> getPostsWithCategory(String category) throws IOException, SQLException {

//SELECT column_name(s)
//FROM table1
//INNER JOIN table2 ON table1.column_name = table2.column_name;
         
        // String query = "select DISTINCT post.id,post.user_id,post.question,post.content ,post.created_date,post.modified_date ,post.status,post.likeCount from post INNER JOIN category ON post.category_id = category.id WHERE category.name like '%?%'";
        //String query = "SELECT * FROM category " +  "WHERE name like '%?%'";

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

         String query = "select DISTINCT * from post INNER JOIN category ON post.category_id = category.id WHERE category.name like '%"+category+"%'";

        try {
            ps = connection.prepareStatement(query);
//            ps.setString(1, "%"+category+"%");
            System.out.println(ps.toString());
         
            rs = ps.executeQuery();
            ArrayList<Post> posts = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setQuestion(rs.getString("question"));
                post.setContent(rs.getString("content"));
                post.setUser(UserDB.getUser(rs.getInt("user_id")));
                post.setCategory(CategoryDB.getCategory(rs.getInt("category_id")));
                post.setCreated_date(rs.getString("created_date"));
                post.setModified_date(rs.getString("modified_date"));
                post.setStatus(rs.getString("status"));
                post.setLikeCount(rs.getInt("likeCount"));
                
                posts.add(post);
            }
            return posts;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

}
  }

