package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Feedback;
import pojo.SiteUser;
import service.FeedbackService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 下午6:04
 */
public class FeedbackAction extends ActionSupport{
    private String title;
    private String content;

    private String feedbackid;
    private String pagenumber;

    private int currentPage;//当前页码数
    private int pageSize;//每页显示数据量
    private int totalCount;//信息总数
    private int totalPage;//页面总数
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

    public String getFeedbackid() {
        return feedbackid;
    }

    public void setFeedbackid(String feedbackid) {
        this.feedbackid = feedbackid;
    }

    public String getPagenumber() {
        return pagenumber;
    }

    public void setPagenumber(String pagenumber) {
        this.pagenumber = pagenumber;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public FeedbackService getFeedbackService() {
        return feedbackService;
    }

    public void setFeedbackService(FeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();

        Feedback feedback = new Feedback();
        feedback.setFeedbacktopic(this.title);
        feedback.setFeedbackcontent(this.content);
        feedback.setPublishtime(new Timestamp(new Date().getTime()));
        feedback.setFeedbackauthor(((SiteUser) session.getAttribute("user")).getUsername());

        feedbackService.saveFeedback(feedback);
        return SUCCESS;
    }
    public String getallfeedbacks() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        List list = feedbackService.getAllFeedback();
        request.setAttribute("feedbacks", list);

        return "acquireall";
    }
    public String getsomefeedbacks()throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        String pageString=request.getParameter("pagenumber");
        System.out.println("pagenumber"+pageString);
        if(pageString==null||pageString.length()==0){
            pageString="1";
        }
        currentPage=0;
        try{
            currentPage=Integer.parseInt(pageString);
        }catch(Exception e){
            e.printStackTrace();
        }
        if(currentPage==0){
            currentPage=1;
        }
        pageSize=5;
        List list=feedbackService.getFeedback( pageSize,currentPage);
        totalPage=feedbackService.getFeedbackTotalPage(pageSize);
        request.setAttribute("somefeedbacks",list);
        request.setAttribute("totalpage",totalPage);
        request.setAttribute("currentpage",currentPage);
        return "acquiresomefeedback";
    }
    public String getOneFeedback() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(feedbackid);
        Feedback feedback = feedbackService.getOneFeedbackByID(id);
        request.setAttribute("onefeedback", feedback);

        return "acquireone";
    }
    public String deleteOneFeedback() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(feedbackid);
        feedbackService.deleteOneFeedbackByID(id);

        return "deleteone";
    }

}
