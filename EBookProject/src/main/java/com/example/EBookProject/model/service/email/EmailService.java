package com.example.EBookProject.model.service.email;

import com.example.EBookProject.model.email.EmailDTO;

public interface EmailService {
	public void sendMail(EmailDTO dto); // 이메일 보내기
}
