package pojo;

import java.sql.Timestamp;

/**
 * User:wangyan
 * Date: 12-5-19
 * Time: 上午10:09
 */
public class Subject {
    private int id;
    private String subjecttopic;
    private String researchdirection;
    private String researchmember;
    private String starttime;
    private String prograss;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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
}
