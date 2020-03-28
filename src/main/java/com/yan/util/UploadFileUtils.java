package com.yan.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 * 
 * 上传工具类
 * 
 */
public class UploadFileUtils {

	/**
	 * 将上传的图片保存到本地f盘的工具类
	 * @param request    请求
	 * @param file   文件
	 * @return 完整文件路径
	 */
	
	 
     
	public static String uploadImage(MultipartHttpServletRequest request, MultipartFile file ,String filePath,String fileName) {
 
		
		 
		// 上传
		try {
			if (file != null) {
				String origNameyuan = file.getOriginalFilename();// 文件原名称
		        String suffix = origNameyuan.substring(origNameyuan.lastIndexOf(".") + 1);//后缀
		        System.out.println(suffix);
				//System.out.println("上传的文件原名称:" + origName);
				String date = DateUtils.formatDateToString(new Date(), DateUtils.DATE_FORMAT_YMDHMS);
				String origName = fileName+date+"."+suffix;//新的文件名称
				// 存放图片文件的路径
				String fileSrc = "";//绝对路径
				String fileSrc2 = ""; //相对路径
				
				try {
					//根据路径生成文件夹
					CreatPath.CreateFile(filePath);
					File uploadedFile = new File(filePath + "//" + origName);
					System.out.println("upload===" + filePath);
					OutputStream os = new FileOutputStream(uploadedFile);
					InputStream is = file.getInputStream();
					byte buf[] = new byte[1024];// 可以修改 1024 以提高读取速度
					int length = 0;
					while ((length = is.read(buf)) > 0) {
						os.write(buf, 0, length);
					} // 关闭流
					os.flush();
					is.close();
					os.close();
					fileSrc =filePath + "/" + origName;
					fileSrc2=fileSrc.replace("F://File/pic", "");
					System.out.println("保存成功！路径：" + filePath + "/" + origName);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return fileSrc2;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
