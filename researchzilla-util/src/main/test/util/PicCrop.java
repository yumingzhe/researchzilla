package util;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

public class PicCrop {
    public static void main(String[] args) {
        FileInputStream fileInputStream = null;
        ImageInputStream imageInputStream = null;
        try {
            fileInputStream = new FileInputStream("/home/yumingzhe/a.jpg");
            Iterator iterator = ImageIO.getImageReadersByFormatName("jpg");
            ImageReader imageReader = (ImageReader) iterator.next();
            imageInputStream = ImageIO.createImageInputStream(fileInputStream);
            imageReader.setInput(imageInputStream, true);
            ImageReadParam param = imageReader.getDefaultReadParam();
            Rectangle rect = new Rectangle(0, 0, 100, 100);
            param.setSourceRegion(rect);
            BufferedImage bi = imageReader.read(0, param);
            ImageIO.write(bi, "jpg", new File("/home/yumingzhe/b.jpg"));
            imageInputStream.close();
            fileInputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
