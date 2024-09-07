package object;

import java.io.Serializable;

public class User implements Serializable {

    public static final long serialVersionUID = 1L;
    private String userid;
    private String password;
    private String email;
    private Integer borrowNum;
    private Integer isadmin;

    public String getUserid() {
        return userid;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public Integer getBorrowNum() {
        return borrowNum;
    }


    public Integer getIsadmin() {
        return isadmin;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setBorrowNum(Integer borrowNum) {
        this.borrowNum = borrowNum;
    }

    public void setIsadmin(Integer isadmin) {
        this.isadmin = isadmin;
    }

    public User(String userid, String password, String email, Integer borrowNum,
                 Integer isadmin) {
        this.userid = userid;
        this.password = password;
        this.email = email;
        this.borrowNum = borrowNum;
        this.isadmin = isadmin;
    }

   public User(){

   }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", borrowNum'" + borrowNum + '\'' +
                ", isadmin=" + isadmin +
                '}';
    }
}
