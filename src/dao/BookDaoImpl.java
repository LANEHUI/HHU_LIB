package dao;

import dao.BookDao;
import object.Book;
import dao.BaseDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDaoImpl implements BookDao {

    /**
     * 查询多个书籍信息
     * @param
     * @param
     * @return
     */
    @Override
    public List<Book> getAllBook(String userid) {
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            con = BaseDao.getConnection();
            String sql = "select * from book where readerid = ?";

            ps = con.prepareStatement(sql);
            ps.setObject(1,userid);
            List<Book> list = new ArrayList<>();
            rs = ps.executeQuery();
            while(rs.next()){
                Book book = new Book();
                book.setBookid(rs.getString("bookid"));
                book.setBookname(rs.getString("bookname"));
                book.setAuthor(rs.getString("author"));
                book.setPublish(rs.getString("publish"));
                book.setPrice(rs.getDouble("price"));
                book.setBorrowDate(rs.getDate("borrowDate"));
                book.setDeadline(rs.getDate("deadline"));
                book.setHaslent(rs.getBoolean("haslent"));
                book.setReaderid(rs.getString("readerid"));


                list.add(book);
            }
            return list;
        }

        catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.close(con,ps,rs);
        }
        return null;
    }


    /**
     * 查询多个书籍信息
     * @param sql
     * @param arr
     * @return
     */
    @Override
    public List<Book> select(String sql, Object[] arr) {
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            con= BaseDao.getConnection();
            ps= con.prepareStatement(sql);
            if(arr!=null){
                for (int i = 0; i <arr.length ; i++) {
                    ps.setObject(i+1,arr[i]);

                }
            }
            rs=ps.executeQuery();
            List<Book> list=new ArrayList<>();
            while (rs.next()){
                Book book=new Book();
                book.setBookid(rs.getString("bookid"));
                book.setAuthor(rs.getString("author"));
                book.setBookname(rs.getString("bookname"));
                book.setPrice(rs.getDouble("price" ));
                book.setPublish(rs.getString("publish"));
                book.setDeadline(rs.getDate("deadline"));
                book.setBorrowDate(rs.getDate("borrowDate"));
                book.setReaderid(rs.getString("readerid"));
                book.setHaslent(rs.getBoolean("haslent"));
                list.add(book);
            }return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    /**
     * 按照标号查书
     * @param bookid
     * @return
     */
    @Override
    public Book getBook(String bookid) {
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            con=BaseDao.getConnection();
            String sql="select * from book where bookid = ?";
            ps=con.prepareStatement(sql);
            ps.setString(1,bookid);
            rs=ps.executeQuery();
            while (rs.next()){
                Book book=new Book();
                book.setBookid(rs.getString("bookid"));
                book.setAuthor(rs.getString("author"));
                book.setBookname(rs.getString("bookname"));
                book.setPrice(rs.getDouble("price" ));
                book.setPublish(rs.getString("publish"));
                book.setDeadline(rs.getDate("deadline"));
                book.setBorrowDate(rs.getDate("borrowDate"));
                book.setReaderid(rs.getString("readerid"));
                book.setHaslent(rs.getBoolean("haslent"));
                return book;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
           e.printStackTrace();
        }finally {
            BaseDao.close(con,ps,rs);
        }
        return null;

    }

    /**
     * 新增图书
     * @param book
     * @return
     */
    @Override
    public boolean addBook(Book book) {
        String sql="insert into book values(?,?,?,?,?,?,?,?,?)";
        List<Object> list=new ArrayList<>();

        list.add(book.getBookid());
        list.add(book.getBookname());
        list.add(book.getAuthor());
        list.add(book.getPublish());
        list.add(book.getPrice());
        list.add(book.isHaslent());
        list.add(book.getReaderid());
        list.add(book.getBorrowDate());
        list.add(book.getDeadline());

        boolean flag=BaseDao.addUpdateDeletes(sql, list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public boolean updateBook(Book book) {
        String sql="update book set publish=?,price=?,haslent=?,borrowDate=?,readerid=?,deadline=?" +
                " where bookid=?";
        List<Object> list=new ArrayList<>();
        list.add(book.getPublish());
        list.add(book.getPrice());
        list.add(book.isHaslent());
        list.add(book.getBorrowDate());
        list.add(book.getReaderid());
        list.add(book.getDeadline());
        list.add(book.getBookid());
        boolean flag=BaseDao.addUpdateDeletes(sql, list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public boolean deleteBook(String bookid) {
        String sql="delete from book where bookid = ?";
        List<Object> list=new ArrayList<>();
        list.add(bookid);
        boolean flag=BaseDao.addUpdateDeletes(sql, list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }
}
