package dao;

import java.sql.*;

public class BaseDao {

    private static String driver="com.mysql.jdbc.Driver";
    private static String url="jdbc:mysql://localhost:3306/jdbc_system";
    private static String user="root";
    private static String password="2639693493";

    /**
     * 获取数据库连接
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */

    public static Connection getConnection() throws ClassNotFoundException,SQLException{
        //加载数据库驱动
        Class.forName(driver);
        Connection con= DriverManager.getConnection(url,user,password);
        return con;
    }

    /**
     * 关闭数据库连接
     * @param con
     * @param ps
     * @param rs
     */

    public static void close(Connection con, PreparedStatement ps, ResultSet rs){
        if(rs!=null){
            try{
                rs.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        if(ps!=null){
            try{
                ps.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        if(con!=null){
            try{
                con.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    /**
     * 增删改查的方法
     * @param sql
     * @param arr
     * @return
     */
    public static boolean addUpdateDeletes(String sql,Object[] arr){
        Connection con=null;
        PreparedStatement ps=null;
        try{
            //获取连接
            con=BaseDao.getConnection();
            //预处理
            ps= con.prepareStatement(sql);
            //设置参数
            if(arr!=null&&arr.length!=0){
                for (int i = 0; i < arr.length ; i++) {
                    ps.setObject(i+1,arr[i]);
                }
            }//返回处理条数
            int count=ps.executeUpdate();
            if(count>0){//判断是否执行成功
                return true;
            }
            else {return false;}
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        try{
            System.out.println(BaseDao.getConnection());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
