package com.hyuna.common.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger=Logger.getLogger(FileUploadUtil.class);
	/*파일 업로드 메서드*/
	public static String fileUpload(MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("fileUpload 호출 성공");
		String real_name=null;
		//MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일명
		String org_name=file.getOriginalFilename();//사용자에게 이름을 받아옴.
		logger.info("org_name"+org_name);
		
		//중복되지 않도록 파일명을 변경한다.
		if(org_name!=null && (!org_name.equals(""))){//사용자에게서 받아온 이름을 바꿈.
			real_name="board_"+System.currentTimeMillis()+"_"+org_name;//저장할 파일이름
			String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage");//upload할 폴더
			
			/*파일경로가 없으면 파일경로의 폴더를 생성한다.*/
			File fileDir=new File(docRoot);
			if(!fileDir.exists()){
				fileDir.mkdir();
			}
			File fileAdd=new File(docRoot+"/"+real_name);//파일생성
			logger.info(fileAdd);
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	
	/*파일 업로드 재정의*/
	public static String fileUpload(MultipartFile file, HttpServletRequest request, int seq) throws IllegalStateException, IOException{
		logger.info("fileUpload 호출 성공");
		String real_name=null;
		String org_name=file.getOriginalFilename();
		logger.info("org_name"+org_name);
		String foldername="";
		if(seq==1){
			foldername="main";
		}else if(seq==2){
			foldername="thumb";			
		}else if(seq==3){
			foldername="detail";			
		}
		//중복되지 않도록 파일명을 변경한다.
		if(org_name!=null && (!org_name.equals(""))){
			real_name=foldername+"_"+org_name;//저장할 파일이름
			String docRoot = request.getSession().getServletContext().getRealPath(foldername);//upload할 폴더
			
			/*파일경로가 없으면 파일경로의 폴더를 생성한다.*/
			File fileDir=new File(docRoot);
			if(!fileDir.exists()){
				fileDir.mkdir();
			}
			File fileAdd=new File(docRoot+"/"+real_name);//파일생성
			logger.info(fileAdd);
			file.transferTo(fileAdd);
		}
		return real_name;		
	}

}
