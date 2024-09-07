package dao;

import object.User;
import java.util.List;

/**
 * @author Cherry
 * @data 2023.6.28
 * UseDao接口
 */

public interface UserDao {

    /**
     * 用户登录
     * @param user
     * @return
     */
    public User login(User user);

    /**
     * 用户注册
     * @param user
     * @return
     */
    public boolean register(User user);

    /**
     * 查询用户信息
     * @param userid
     * @return
     */
    public List<User> selectUser(String userid);

    /**
     * 查询用户信息
     * @return
     */
    public List<User> getAllUser();



    /**
     * 根据用户编号进行查询
     * @param userid
     * @return
     */
    public User getUser(String userid);


    /**
     * 新增用户
     * @param user
     * @return
     */
    public boolean addUser(User user);

    /**
     * 修改用户
     * @param user
     * @return
     */
    public boolean updateUser(User user);

    /**
     * 删除用户
     * @param userid
     * @return
     */
    public boolean deleteUser(String userid);


}
