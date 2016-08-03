package com.hyuna.common.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	/*���� ���ε� �޼���*/
	public static String fileUpload(MultipartFile file, HttpServletRequest request)throws IOException{
		logger.info("fileUpload ȣ�� ����");
		
		String real_name = null;
		//MultipartFile Ŭ������ getFile()�޼���� Ŭ���̾�Ʈ�� ���ε��� ���ϸ�
		String org_name = file.getOriginalFilename();
		logger.info("org_name:"+org_name);
		
		//���ϸ� ����(�ߺ����� �ʰ�)
		if(org_name !=null && (!org_name.equals(""))){
			real_name = "board_"+ System.currentTimeMillis() +"_"+ org_name; //������ �����̸�
			String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage");
			
			File fileDir = new File(docRoot);
			if(!fileDir.exists()){
				fileDir.mkdir();
			}
			File fileAdd = new File(docRoot+"/"+real_name);
			logger.info(fileAdd);
			file.transferTo(fileAdd);
			
		}
		return real_name;
	}
	
	public static void fileDelete(String fileName, HttpServletRequest request) throws IOException{
		logger.info("fileDelete ȣ�� ����");
		boolean result = false;
		String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage");
		
		File fileDelete = new File(docRoot+"/"+fileName);
		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
					
		}
		logger.info(result);
	}
}
