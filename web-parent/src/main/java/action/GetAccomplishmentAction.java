package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.PictureNews;
import service.PictureNewsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-31
 * Time: 上午9:59
 */
public class GetAccomplishmentAction extends ActionSupport {
    private String accomplishmentid;
    private String pagenumber;

    private int currentPage;//当前页码数
    private int pageSize;//每页显示数据量
    private int totalCount;//信息总数
    private int totalPage;//页面总数
    private PictureNewsService pictureNewsService;

    public String getAccomplishmentid() {
        return accomplishmentid;
    }

    public void setAccomplishmentid(String accomplishmentid) {
        this.accomplishmentid = accomplishmentid;
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

    public PictureNewsService getPictureNewsService() {
        return pictureNewsService;
    }

    public void setPictureNewsService(PictureNewsService pictureNewsService) {
        this.pictureNewsService = pictureNewsService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session=request.getSession();
        List list=pictureNewsService.getFiveAccomplishment();
        session.setAttribute("fiveaccomplishments",list);
        return SUCCESS;
    }

    public String getAllResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        List list=pictureNewsService.getAllAccomplishment();
        request.setAttribute("allaccomplishments",list);
        return "acquireall";
    }
    public String getSomeResult()throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        String pageString=request.getParameter("pagenumber");
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
        pageSize=6;
        List list=pictureNewsService.getAccomplishment( pageSize,currentPage);
        totalPage=pictureNewsService.getAccomplishmentTotalPage(pageSize);

        request.setAttribute("someaccomplishments",list);
        request.setAttribute("totalpage",totalPage);
        request.setAttribute("currentpage",currentPage);
        return "acquiresome";
    }
    public String getOneResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(accomplishmentid);
        PictureNews accomplishment= pictureNewsService.getOneAccomplishmentByID(id);
        request.setAttribute("oneaccomplishment", accomplishment);
        return "acquireone";
    }
}
