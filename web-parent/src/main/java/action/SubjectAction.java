package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Subject;
import service.SubjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-6-5
 * Time: 下午8:07
 */
public class SubjectAction extends ActionSupport {
    private String subjecttopic;
    private String researchdirection;
    private String researchmember;
    private String starttime;
    private String prograss;

    private SubjectService subjectService;

    public String getSubjecttopic() {
        return subjecttopic;
    }

    public void setSubjecttopic(String subjecttopic) {
        this.subjecttopic = subjecttopic;
    }

    public String getResearchdirection() {
        return researchdirection;
    }

    public void setResearchdirection(String researchdirection) {
        this.researchdirection = researchdirection;
    }

    public String getResearchmember() {
        return researchmember;
    }

    public void setResearchmember(String researchmember) {
        this.researchmember = researchmember;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getPrograss() {
        return prograss;
    }

    public void setPrograss(String prograss) {
        this.prograss = prograss;
    }

    public SubjectService getSubjectService() {
        return subjectService;
    }

    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        Subject subject=new Subject();
        subject.setSubjecttopic(subjecttopic);
        subject.setResearchdirection(researchdirection);
        subject.setResearchmember(researchmember);
        subject.setStarttime(starttime);
        subject.setPrograss(prograss);
        subjectService.saveSubject(subject);

        return SUCCESS;
    }
    public String getallsubjects() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        List list = subjectService.getAllSubject();
        session.setAttribute("subjects", list);
        return "acquireall";
    }
}
