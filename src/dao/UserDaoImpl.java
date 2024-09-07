package dao;

import object.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Cherry
 * @data 2023.6.28
 * UseDao接口实现类
 */
public class UserDaoImpl implements UserDao {

    /**
     * 用户登录
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        Connection conn = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            //获取数据库的连接
            conn = BaseDao.getConnection();
            //url
            String sql = "select * from user where userid = ? and password = ?";
            //预处理
            prst = conn.prepareStatement(sql);
            //执行SQL
            prst.setObject(1, user.getUserid());
            prst.setObject(2, user.getPassword());
            rs = prst.executeQuery();
            User currentUser = null;
            if (rs.next()) {
                currentUser.setUserid(rs.getString("userid"));
                currentUser.setPassword(rs.getString("password"));
                currentUser.setEmail(rs.getString("email"));
                currentUser.setIsadmin(rs.getInt("isadmin"));
                return currentUser;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    /**
     * 用户注册
     * @param user
     * @return
     */
    @Override
    public boolean register(User user) {
        String sql = "insert into user values (?,?,?,?,?)";

        List<Object> list = new ArrayList<>();
        list.add(user.getUserid());
        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getBorrowNum());
        list.add(user.getIsadmin());

        boolean flag = BaseDao.addUpdateDeletes(sql,list.toArray());
        if(flag){
            return true;
        }else{
            return false;
        }

    }


    @Override
    public List<User> selectUser(String id) {
        String sql = "select * from user where userid = ? ";
        Connection conn = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            conn = BaseDao.getConnection();
            prst = conn.prepareStatement(sql);
            if(id != null){
                prst.setString(1,id);
            }
            rs = prst.executeQuery();
            List<User> list = new ArrayList<>();
            while (rs.next()){
                User user = new User();
                user.setUserid(rs.getString("userid"));
                user.setEmail(rs.getString("email"));
                user.setPassword((rs.getString("password")));
                user.setIsadmin(rs.getInt("isadmin"));

                list.add(user);
            }
            return list;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            BaseDao.close(conn,prst,rs);
        }
    }

    @Override
    public List<User> getAllUser() {
        Connection conn = null;
        PreparedStatement prst = null;
        ResultSet rs = null;

        try {
            conn = BaseDao.getConnection();
            String sql = "select * from user";
            prst = conn.prepareStatement(sql);
            List<User> list = new ArrayList<>();
            rs = prst.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setUserid(rs.getString("userid"));
                user.setEmail(rs.getString("email"));
                user.setPassword((rs.getString("password")));
                user.setBorrowNum(rs.getInt("borrowNum"));
                user.setIsadmin(rs.getInt("isadmin"));
                list.add(user);
            }
            return list;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            BaseDao.close(conn,prst,rs);
        }
    }


    /**
     * 按照userid查询用户
     * @param userid
     * @return
     */
    @Override
    public User getUser(String userid) {
        Connection conn = null;
        PreparedStatement prst = null;
        ResultSet rs = null;

        try {
            conn = BaseDao.getConnection();
            String sql = "select * from user where userid = ?";
            prst = conn.prepareStatement(sql);
            prst.setString(1,userid);
            rs = prst.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setUserid(rs.getString("userid"));
                user.setEmail(rs.getString("email"));
                user.setPassword((rs.getString("password")));
                user.setBorrowNum(rs.getInt("borrowNum"));
                user.setIsadmin(rs.getInt("isadmin"));
                return user;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            BaseDao.close(conn,prst,rs);
        }
        return null;
    }


    /**
     * 添加用户
     * @param user
     * @return
     */
    @Override
    public boolean addUser(User user) {
//
//        String sql = "insert into user values(0,?,?,?,?,?)";
//        List<Object> list = new ArrayList<>();
//        list.add(user.getUserid());
//        list.add(user.getPassword());
//        list.add(user.getEmail());
//        list.add(user.getIsadmin());
        String sql = "insert into user values(?,?,?,?,?)";
        List<Object> list = new ArrayList<>();
        list.add(user.getUserid());
        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getBorrowNum());//borrowUnm
        list.add(user.getIsadmin());//
        boolean flag = BaseDao.addUpdateDeletes(sql,list.toArray());
        if(flag){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @Override
    public boolean updateUser(User user) {
        String sql = "update user set password=?,email=?,borrowNum=?,isadmin=? where userid=?";
        List<Object> list = new ArrayList<>();

        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getBorrowNum());
        list.add(user.getIsadmin());
        list.add(user.getUserid());
        boolean flag = BaseDao.addUpdateDeletes(sql,list.toArray());
        if(flag){
            return true;
        }else{
            return false;
        }
    }


    /**
     * 删除用户
     * @param userid
     * @return
     */
    @Override
    public boolean deleteUser(String userid) {

        String sql = "delete from user where userid = ?";
        List<Object> list = new ArrayList<>();
        list.add(userid);
        boolean flag = BaseDao.addUpdateDeletes(sql,list.toArray());
        if(flag){
            return true;
        }else{
            return false;
        }
    }
}
