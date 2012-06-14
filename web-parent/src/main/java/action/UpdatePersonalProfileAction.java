package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.UserEntityDao;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import pojo.UserEntity;
import service.SiteUserService;
import service.UserEntityService;

import java.util.Date;

/**
 * User: yumingzhe
 * Date: 6/7/12
 * Time: 10:02 AM
 */
public class UpdatePersonalProfileAction extends ActionSupport {
    private String uid;
    private String realname;
    private String age;
    private Date birthday;
    private String gender;
    private String hobby;
    private String education;
    private String mobilePhone;
    private String personalprofile;
    private String personaldetail;
    private String researchprojects;
    private String researchinterest;
    private String personalhonor;
    private String professionaltitle;
    private UserEntityService userEntityService;
    private SiteUserService siteUserService;

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public UserEntityService getUserEntityService() {
        return userEntityService;
    }

    public void setUserEntityService(UserEntityService userEntityService) {
        this.userEntityService = userEntityService;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getPersonalprofile() {
        return personalprofile;
    }

    public void setPersonalprofile(String personalprofile) {
        this.personalprofile = personalprofile;
    }

    public String getPersonaldetail() {
        return personaldetail;
    }

    public void setPersonaldetail(String personaldetail) {
        this.personaldetail = personaldetail;
    }

    public String getResearchprojects() {
        return researchprojects;
    }

    public void setResearchprojects(String researchprojects) {
        this.researchprojects = researchprojects;
    }

    public String getResearchinterest() {
        return researchinterest;
    }

    public void setResearchinterest(String researchinterest) {
        this.researchinterest = researchinterest;
    }

    public String getPersonalhonor() {
        return personalhonor;
    }

    public void setPersonalhonor(String personalhonor) {
        this.personalhonor = personalhonor;
    }

    public String getProfessionaltitle() {
        return professionaltitle;
    }

    public void setProfessionaltitle(String professionaltitle) {
        this.professionaltitle = professionaltitle;
    }

    @Override
    public String execute() throws Exception {
        SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(uid));
        UserEntity userEntity = siteUser.getUserEntity();
        if (userEntity == null)
            userEntity = new UserEntity();
        if (this.realname != null && !this.realname.equals(""))
            userEntity.setRealName(this.realname);
        if (this.age != null && !this.age.equals(""))
            userEntity.setAge(Integer.parseInt(this.age));
        if (this.gender != null && !this.gender.equals(""))
            userEntity.setGender(this.gender);
        if (this.hobby != null && !this.hobby.equals(""))
            userEntity.setHobby(this.hobby);
        if (this.education != null && !this.education.equals(""))
            userEntity.setEducation(this.education);
        if (this.personalprofile != null && !this.personalprofile.equals(""))
            userEntity.setPersonalprofile(this.personalprofile);
        if (this.personaldetail != null && !this.personaldetail.equals(""))
            userEntity.setPersonaldetail(this.personaldetail);
        if (this.researchinterest != null && !this.researchinterest.equals(""))
            userEntity.setResearchinterest(this.researchinterest);
        if (this.researchprojects != null && !this.researchprojects.equals(""))
            userEntity.setResearchprojects(this.researchprojects);
        if (this.personalhonor != null && !this.personalhonor.equals(""))
            userEntity.setPersonalhonor(this.personalhonor);
        if (this.professionaltitle != null && !this.professionaltitle.equals(""))
            userEntity.setProfessionaltitle(this.professionaltitle);
        if (this.mobilePhone != null && !this.mobilePhone.equals(""))
            userEntity.setMobilePhone(Long.parseLong(this.mobilePhone));
        siteUser.setUserEntity(userEntity);
        userEntity.setSiteUser(siteUser);
        siteUserService.updateSiteUser(siteUser);
        ServletActionContext.getRequest().getSession().setAttribute("user", siteUser);
        return SUCCESS;
    }
}
