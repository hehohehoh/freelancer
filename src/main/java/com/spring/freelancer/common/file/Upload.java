package com.spring.freelancer.common.file;

import java.io.File;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class Upload {

	static final int THUMB_WIDTH = 200;
    static final int THUMB_HEIGHT = 200;
	
	public static String imageUpload(String uploadPath, 
			String fileName, byte[] fileData, String namePath ) throws Exception{
		
		String imgPath = uploadPath + namePath;
		File dir = new File(imgPath);
		dir.mkdirs();
		File target = new File(imgPath, fileName);
		FileCopyUtils.copy(fileData, target);
		
		String thumbFileName = "s_" + fileName;
		
		File image = new File(imgPath + File.separator + fileName);
		File thumbnail = new File(imgPath + File.separator + thumbFileName);
		
		if(image.exists()) {
			
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
			image.delete();
		}
		
		return thumbFileName;
		
		
	}
	
	public static void fileUpload(String uploadPath, 
			String fileName, byte[] fileData, String namePath ) throws Exception{
		
		String filePath = uploadPath + namePath;
		File dir = new File(filePath);
		dir.mkdirs();
		File target = new File(filePath, fileName);
		FileCopyUtils.copy(fileData, target);
		
	}

}
