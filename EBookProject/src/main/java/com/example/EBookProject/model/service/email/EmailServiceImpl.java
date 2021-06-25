package com.example.EBookProject.model.service.email;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.EBookProject.model.email.EmailDTO;

@Service
public class EmailServiceImpl implements EmailService {

	@Inject
	JavaMailSender mailSender; // 메일 발송 객체
	
	@Override
	public void sendMail(EmailDTO dto) {
		try {
			MimeMessage msg=mailSender.createMimeMessage(); // 이메일 객체
			
			// 이메일 수신자
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
			
			// 이메일 발신자
			msg.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			
			// 이메일 제목
			msg.setSubject(dto.getSubject(),"utf-8");
			
			// 이메일 내용
			msg.setText(dto.getMessage(),"utf-8");
			
			// 이메일 전송
			mailSender.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
