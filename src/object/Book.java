package object;

import java.io.Serializable;
import java.util.Date;

public class Book implements Serializable {

    private static final long serialVersionUID = 1L;
    private String bookid;
    private String bookname;
    private String author;
    private String publish;
    private Double price;
    private boolean haslent;
    private String readerid;
    private Date borrowDate;
    private Date deadline;

    public void setReaderid(String id){
        readerid = id;
    }

    public String getReaderid(){
        return readerid;
    }

    public String getBookid() {
        return bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public String getAuthor() {
        return author;
    }

    public String getPublish() {
        return publish;
    }

    public Double getPrice() {
        return price;
    }

    public boolean isHaslent() {
        return haslent;
    }

    public Date getBorrowDate() {
        return borrowDate;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setHaslent(boolean haslent) {
        this.haslent = haslent;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", author='" + author + '\'' +
                ", publish='" + publish + '\'' +
                ", price='" + price + '\'' +
                ", haslent'" + haslent +'\''+
                ", borrowDate'" + borrowDate +'\''+
                ", deadline=" + deadline +
                '}';
    }

    public Book(String bookid, String bookname, String author, String publish, Double price,
                boolean haslent, Date borrowDate, Date deadline) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.author = author;
        this.publish = publish;
        this.price = price;
        this.haslent = haslent;
        this.borrowDate = borrowDate;
        this.deadline = deadline;
    }
    public Book(){

    }
}
