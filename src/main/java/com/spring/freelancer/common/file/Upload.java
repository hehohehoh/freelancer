package com.spring.freelancer.common.file;

import java.io.File;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class Upload {

	static final int THUMB_WIDTH = 200;
    static final int THUMB_HEIGHT = 200;
	
	public static void imageUpload(String uploadPath, 
			String fileName, byte[] fileData, String namePath ) throws Exception{
		
		String imgPath = uploadPath + namePath;
		File dir = new File(imgPath);
		dir.mkdirs();
		File target = new File(imgPath, fileName);
		FileCopyUtils.copy(fileData, target);
		
		String thumbFileName = "s_" + fileName;
		
		File image = new File(imgPath + File.separator + fileName);
		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);
		
		if(image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		
		
	}

}
