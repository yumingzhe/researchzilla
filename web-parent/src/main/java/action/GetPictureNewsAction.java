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
public class GetPictureNewsAction extends ActionSupport {
    private String picturenewsid;
    private String pagenumber;

    private int currentPage;//当前页码数
    private int pageSize;//每页显示数据量
    private int totalCount;//信息总数
    private int totalPage;//页面总数
    private PictureNewsService pictureNewsService;

    public String getPicturenewsid() {
        return picturenewsid;
    }

    public void setPicturenewsid(String picturenewsid) {
        this.picturenewsid = picturenewsid;
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
        return super.execute();    //To change body of overridden methods use File | Settings | File Templates.
    }

    public String getAllResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        List list=pictureNewsService.getAllPictureNews();

        request.setAttribute("allpicturenews",list);
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
        List list=pictureNewsService.getPictureNews( pageSize,currentPage);
        totalPage=pictureNewsService.getPictureNewsTotalPage(pageSize);
        //    System.out.println("totalpage"+totalPage);
        request.setAttribute("somepicturenewses",list);
        request.setAttribute("totalpage",totalPage);
        request.setAttribute("currentpage",currentPage);
        return "acquiresome";
    }
    public String getOneResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(picturenewsid);
        PictureNews picturenews= pictureNewsService.getOnePictureNewsByID(id);
        request.setAttribute("onepicturenews", picturenews);
        return "acquireone";
    }
}
