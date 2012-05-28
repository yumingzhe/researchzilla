package pojo;
import java.io.File;
/**
 * User:wangyan
 * Date: 12-5-19
 * Time: 上午10:31
 */
public class WebsiteMessage {
    private int id;
    private String websitename;
    private File background;
    private String defaultlanguage;
    private String maintenanceaddress;
    private int visits;

    public int getVisits() {
        return visits;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWebsitename() {
        return websitename;
    }

    public void setWebsitename(String websitename) {
        this.websitename = websitename;
    }

    public File getBackground() {
        return background;
    }

    public void setBackground(File background) {
        this.background = background;
    }

    public String getDefaultlanguage() {
        return defaultlanguage;
    }

    public void setDefaultlanguage(String defaultlanguage) {
        this.defaultlanguage = defaultlanguage;
    }

    public String getMaintenanceaddress() {
        return maintenanceaddress;
    }

    public void setMaintenanceaddress(String maintenanceaddress) {
        this.maintenanceaddress = maintenanceaddress;
    }

    public int getVisits(int i) {
        return visits;
    }

    public void setVisits(int visits) {
        this.visits = visits;
    }
}
