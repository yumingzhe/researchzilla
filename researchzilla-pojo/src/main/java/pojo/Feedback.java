package pojo;

import java.sql.Timestamp;

/**.
 * User: wangyan
 * Date: 12-5-19
 * Time: 上午10:23
 */
public class Feedback {
    private int id;
    private String feedbacktopic;
    private String feedbackcontent;
    private String feedbackauthor;
    private Timestamp publishtime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFeedbacktopic() {
        return feedbacktopic;
    }

    public void setFeedbacktopic(String feedbacktopic) {
        this.feedbacktopic = feedbacktopic;
    }

    public String getFeedbackcontent() {
        return feedbackcontent;
    }

    public void setFeedbackcontent(String feedbackcontent) {
        this.feedbackcontent = feedbackcontent;
    }

    public Timestamp getPublishtime() {
        return publishtime;
    }

    public String getFeedbackauthor() {
        return feedbackauthor;
    }

    public void setFeedbackauthor(String feedbackauthor) {
        this.feedbackauthor = feedbackauthor;
    }

    public void setPublishtime(Timestamp publishtime) {
        this.publishtime = publishtime;
    }
}
