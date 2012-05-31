package pojo;

import java.io.File;
import java.sql.Timestamp;

/**
 * User:wangyan
 * Date: 12-5-19
 * Time: 上午9:37
 */
public class Message {
    private int id;
    private String type;
    private String author;
    private String publisher;
    private String topic;
    private String content;
    private Timestamp publishtime;
    private File accesory;
    private String filepath;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(Timestamp publishtime) {
        this.publishtime = publishtime;
    }

    public File getAccesory() {
        return accesory;
    }

    public void setAccesory(File accesory) {
        this.accesory = accesory;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }
}
