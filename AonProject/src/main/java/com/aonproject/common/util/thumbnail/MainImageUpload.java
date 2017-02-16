package com.aonproject.common.util.thumbnail;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class MainImageUpload {
	public static void main(String[] args) {
		
		try {
			// 원본 이미지의 경로, 파일명
			File originalFileName = new File("D:"+File.separator+"/original_image.jpg");
			// 섬네일 이미지의 경로, 파일명
			File thumbnailFileName = new File("D:"+File.separator+"thumbnail_image.jpg");
			// 섬네일 가로 사이즈
			int width = 50;
			// 섬네일 세로 사이즈
			int height = 50;
			
			// 섬네일 이미지 생성
			BufferedImage originalImg = ImageIO.read(originalFileName);
			BufferedImage thumbnailImg = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
			// 섬네일 그리기
			Graphics2D g = thumbnailImg.createGraphics();
			g.drawImage(originalImg, 0, 0, width, height, null);
			// 파일 생성
			ImageIO.write(thumbnailImg, "jpg", thumbnailFileName);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
