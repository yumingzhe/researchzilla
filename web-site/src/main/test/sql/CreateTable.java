package sql;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 4:06 PM
 */

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

/**
 * This clas is for creating tables by pojo/*.hbm.xml files
 */

public class CreateTable {
    public static void main(String[] args) {
        SchemaExport export = new SchemaExport(new Configuration().configure());
        export.create(true, true);
    }
}
