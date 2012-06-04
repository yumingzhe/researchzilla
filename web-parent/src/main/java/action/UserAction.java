package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import service.SiteUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-30
 * Time: 上午9:11
 */
public class UserAction extends ActionSupport {
    private String uid;

    private String pagenumber;

    private int currentPage;//当前页码数
    private int pageSize;//每页显示数据量
    private int totalCount;//信息总数
    private int totalPage;//页面总数
    private SiteUserService siteUserService;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
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

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    @Override
    public String execute() throws Exception {
        return super.execute();
    }

    public String getallusers() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        List list = siteUserService.getAllSiteUser();
        request.setAttribute("siteusers", list);

        return "acquireall";
    }
    public String getsomeusers()throws Exception{
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
        pageSize=10;
        List list=siteUserService.getSomeSiteUser( pageSize,currentPage);
        totalPage=siteUserService.getSiteUserTotalPage(pageSize);
        //    System.out.println("totalpage"+totalPage);
        request.setAttribute("someusers",list);
        request.setAttribute("totalpage",totalPage);
        request.setAttribute("currentpage",currentPage);
        return "acquiresomeuser";
    }
    public String getoneuser() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(uid);
        SiteUser siteUser = siteUserService.getSiteUserByUID(id);
        request.setAttribute("onesiteuser", siteUser);

        return "acquireone";
    }
    public String deleteoneuser() throws Exception{

        int id=Integer.parseInt(uid);
        SiteUser siteUser = siteUserService.getSiteUserByUID(id);
        siteUser.setBanned(true);
        siteUserService.updateSiteUser(siteUser);
        return "deleteone";
    }

}
