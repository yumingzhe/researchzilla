package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Feedback;
import service.FeedbackService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 下午6:04
 */
public class FeedbackAction extends ActionSupport{
    private String title;
    private String content;

    private FeedbackService feedbackService;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public FeedbackService getFeedbackService() {
        return feedbackService;
    }

    public void setFeedbackService(FeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }

    @Override
    public void validate() {
        if(this.title==null){
            this.addFieldError(title,"you must input title");
        }
        if(this.content==null){
            this.addFieldError(content,"you must input content");
        }
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();

        Feedback feedback = null;
        feedback.setFeedbacktopic(this.title);
        feedback.setFeedbackcontent(this.content);
        feedback.setPublishtime(new Timestamp(new Date().getTime()));
        feedback.setFeedbackauthor((String) session.getAttribute("username"));

        feedbackService.saveFeedback(feedback);
        return SUCCESS;
    }
}
