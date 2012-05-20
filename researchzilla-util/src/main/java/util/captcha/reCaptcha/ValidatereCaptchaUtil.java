package util.captcha.reCaptcha;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

/**
 * User: yumingzhe
 * Date: 5/20/12
 * Time: 6:59 PM
 */
public class ValidatereCaptchaUtil {
    public static boolean validateCaptcha(String challenge_field, String response_field, String remoteAddress) {
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6LczEMwSAAAAAJPmIBFF1KxNBsY8ZrVYKht0k239");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddress, challenge_field, response_field);
        if (reCaptchaResponse.isValid())
            return true;
        else
            return false;
    }
}
