package pojo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class UserEntity implements Serializable {
    private int uid;
    private String realName;//真实姓名
    private int age;
    private Date birthday;
    private Timestamp registerDate;
    private int userType;
    private String gender;
    private String personalWebsite;
    private String country;//国籍
    private long qq;
    private long mobilePhone;
    private String description;
    private String hobby;//爱好
    private String education;//学历
    private SiteUser siteUser;
    private String personalprofile;//个人简介
    private String personaldetail;//个人详细介绍
    private String researchinterest;//研究兴趣
    private String researchprojects;//科研项目
    private String personalhonor;//个人荣誉
    private String professionaltitle;//职称

    public String getProfessionaltitle() {
        return professionaltitle;
    }

    public void setProfessionaltitle(String professionaltitle) {
        this.professionaltitle = professionaltitle;
    }

    public String getPersonalhonor() {
        return personalhonor;
    }

    public void setPersonalhonor(String personalhonor) {
        this.personalhonor = personalhonor;
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

    public String getPersonaldetail() {
        return personaldetail;
    }

    public void setPersonaldetail(String personaldetail) {
        this.personaldetail = personaldetail;
    }

    public String getPersonalprofile() {
        return personalprofile;
    }

    public void setPersonalprofile(String personalprofile) {
        this.personalprofile = personalprofile;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public SiteUser getSiteUser() {
        return siteUser;
    }

    public void setSiteUser(SiteUser siteUser) {
        this.siteUser = siteUser;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Timestamp getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Timestamp registerDate) {
        this.registerDate = registerDate;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPersonalWebsite() {
        return personalWebsite;
    }

    public void setPersonalWebsite(String personalWebsite) {
        this.personalWebsite = personalWebsite;
    }

    public long getQq() {
        return qq;
    }

    public void setQq(long qq) {
        this.qq = qq;
    }

    public long getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(long mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
