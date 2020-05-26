package model;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;

public class SendEmail {
	Properties props;
	Session session;
	final String emailMaster = "petshero.contato@gmail.com";
	final String senhaMaster = "saojudaspi";
	
	public SendEmail() {
		props = new Properties();
		configure();
	}
	
	public void configure() {
		
		props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        
        session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(emailMaster, senhaMaster);//email e senha usuário 
                    }
                });
	}
	
	public void enviarEmail(String nome, String from, String subject, String msg) {
		try {
			MimeMessage message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress(from));
			Address[] toUser = InternetAddress.parse(emailMaster); //Destinatário(s)
			message.setRecipients(Message.RecipientType.TO, toUser);
			message.setReplyTo(InternetAddress.parse(from));
			
			String HTML = "<table style=\"width:600px; border:1px solid #000000;\"><tr><td style=\"padding:10px;\">";
			HTML += "<p><strong>Nome:</strong> " + nome + "</p>";
			HTML += "<p><strong>Email:</strong> " + from + "</p>";
			HTML += "<p><strong>Assunto:</strong> " + subject + "</p>";
			HTML += "<p><strong>Mensagem:</strong> " + msg + "</p>";
			HTML += "</td></tr></table>";
			
            message.setSubject("Página de contato PetsHero - " + subject);
            message.setContent(HTML, "text/html; charset=utf-8");

            //send message  
            Transport.send(message);
		} catch (MessagingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
