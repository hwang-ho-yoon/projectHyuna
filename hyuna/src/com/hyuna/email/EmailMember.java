package com.hyuna.email;

import java.util.Random;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import com.hyuna.vo.MemberVO;

public class EmailMember {
String resultMsg;
	
public void setSendEmail(MemberVO mvo){
	long beginTime = System.currentTimeMillis();
	
	SimpleEmail simpleEmail = new SimpleEmail();
	//smtp 서버 연결 설정.(구글 아이디, 비번)
	simpleEmail.setHostName("smtp.gmail.com");
	simpleEmail.setSmtpPort(587);
	simpleEmail.setAuthentication("whdals414", "tlqkaqk1");
	String rt = "Failure";
	
	try {		
		//smtp SSL,TLS설정
		simpleEmail.setSSL(true);
		simpleEmail.setTLS(true);
		
		//받는 사람설정
		simpleEmail.addTo(mvo.getMem_mail(), mvo.getMem_name(), "utf-8");
		//보내는 사람설정
		simpleEmail.setFrom("whdals414@gamil.com", "현아", "utf-8");
		//제목설정
		simpleEmail.setSubject("현아에 가입하셨습니다");
		//본문설정
		simpleEmail.setMsg(mvo.getMem_name()+" 님의 가입을 환영합니다.");
		rt = simpleEmail.send();
		resultMsg = "success";
		
	}catch(EmailException e){
		e.printStackTrace();
		resultMsg = "failure";
	}
	finally {
		long execTime = System.currentTimeMillis() - beginTime;
		System.err.println("exec time:"+execTime+"ms");
		System.err.println("RT msg:"+rt);
	}
	
}
	public void setPwdEmail(MemberVO mvo){
		long beginTime = System.currentTimeMillis();
		
		SimpleEmail simpleEmail = new SimpleEmail();
		//smtp 서버 연결 설정.(구글 아이디, 비번)
		simpleEmail.setHostName("smtp.gmail.com");
		simpleEmail.setSmtpPort(587);
		simpleEmail.setAuthentication("whdals414", "tlqkaqk1");
		String rt = "Failure";

		try {		
			//smtp SSL,TLS설정
			simpleEmail.setSSL(true);
			simpleEmail.setTLS(true);
			
			//받는 사람설정
			simpleEmail.addTo(mvo.getMem_mail(), mvo.getMem_name(), "utf-8");
			//보내는 사람설정
			simpleEmail.setFrom("whdals414@gamil.com", "현아", "utf-8");
			//제목설정
			simpleEmail.setSubject("임시비밀번호 발송");
			//본문설정
			simpleEmail.setMsg(mvo.getMem_pwd());
			rt = simpleEmail.send();
			resultMsg = "success";
			
		}catch(EmailException e){
			e.printStackTrace();
			resultMsg = "failure";
		}
		finally {
			long execTime = System.currentTimeMillis() - beginTime;
			System.err.println("exec time:"+execTime+"ms");
			System.err.println("RT msg:"+rt);
		}
		
	}
	public String getResult(){
		return resultMsg;
	}
	public String getRandomPassword( int length ){
        char[] charaters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
        StringBuffer sb = new StringBuffer();
        Random rn = new Random();
        for( int i = 0 ; i < length ; i++ ){
            sb.append( charaters[ rn.nextInt( charaters.length ) ] );
        }
        return sb.toString();
    }
}
