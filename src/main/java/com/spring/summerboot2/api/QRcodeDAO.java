package com.spring.summerboot2.api;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class QRcodeDAO{
	
	public String makeQR(String merchant_uid, String id, String no, String date, String startTime, String useTime, String site, String savePath) {
		//String savePath = "C:/Users/wjdal/SummerBoot2/SummerBoot-MVC/src/main/webapp/resources/assets/img/qr/";
		
		String payInfo = id+"/"+no+"/"+date+"/"+startTime+"/"+useTime+"/"+site;
		String fileName = merchant_uid + ".png";
		
		int width = 300;
		int height = 300;
		
		try {
            BitMatrix bitMatrix = new QRCodeWriter().encode(payInfo,BarcodeFormat.QR_CODE,width,height);

            BufferedImage qrImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    qrImage.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
                }
            }

            File qrFile = new File(savePath+fileName);
            ImageIO.write(qrImage, "png", qrFile);

        } catch (Exception e) {
            e.printStackTrace();
        }
		return fileName;
	}
}
