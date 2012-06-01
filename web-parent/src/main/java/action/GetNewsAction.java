package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Message;
import service.MessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**.
 * User: wangyan
 * Date: 12-5-24
 * Time: 下午9:45
 */
public class GetNewsAction extends ActionSupport {
    private String newsid;
    private String pagenumber;

    private int currentPage;//当前页码数
    private int pageSize;//每页显示数据量
    private int totalCount;//信息总数
    private int totalPage;//页面总数

    private MessageService messageService;

    public String getNewsid() {
        return newsid;
    }

    public void setNewsid(String newsid) {
        this.newsid = newsid;
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

    public MessageService getMessageService() {
        return messageService;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();

        List list=messageService.getSomeNews();
        session.setAttribute("news",list);

        return SUCCESS;
    }

    public String getAllResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        List list = messageService.getAllNews();
        request.setAttribute("allnewses", list);
        return "acquireall";
    }
    public String getSomeResult()throws Exception{
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
        List list=messageService.getNews( pageSize,currentPage);
        totalPage=messageService.getNewsTotalPage(pageSize);
        request.setAttribute("somenewses",list);
        request.setAttribute("totalpage",totalPage);
        request.setAttribute("currentpage",currentPage);
        return "acquiresome";
    }
    public String getOneResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(newsid);
        Message news= messageService.getOneNewsByID(id);
        request.setAttribute("onenews", news);
        return "acquireone";
    }
}
