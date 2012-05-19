package util;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 10:21 PM
 */

import org.apache.commons.lang3.RandomStringUtils;
import sun.misc.BASE64Encoder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Implement an arbitrary string hash
 */
public class MD5Util {

    public static String generateArbitraryString(int length) throws NoSuchAlgorithmException {
        return RandomStringUtils.randomAlphanumeric(length);
    }

    public static String hashString(String source) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("md5");
        BASE64Encoder base64Encoder = new BASE64Encoder();
        md5.update(source.getBytes());
        return base64Encoder.encode(md5.digest());
    }
}
