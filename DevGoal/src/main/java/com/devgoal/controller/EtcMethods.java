package com.devgoal.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.devgoal.dao.AdminEmailHistoryDAO;

public class EtcMethods {
	
	//Check session
	public int checkSession(HttpSession session, HttpServletRequest request) {
		
		session = request.getSession(false);
		
		if(session.getAttribute("id") != null && 
		   session.getAttribute("role") != null && 
		  !session.getAttribute("id").toString().equals("") && 
		  !session.getAttribute("role").toString().equals("")) {
			
			return 0;
		}
		
		return -1;
	}
	
	//Response JSON object
	public void responseJSONObject(JSONObject jsonObject, HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(jsonObject);
		out.flush();
	}
	
	//Response JSON array
	public void responseJSONArray(JSONArray jsonArray, HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(jsonArray);
		out.flush();
	}
	
	//Hash
	public String HASH(String text) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA3-512");
			byte[] hash = digest.digest(text.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			
			for(int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}
			
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//Check images type and save images
	public String checkImages(Part images) {
		
		String files = "";
		
		try {
			
			String filename = randomSalt();
			InputStream is = null;
			byte[] data = null;
			String path = new PathConfig().image_path;
			FileOutputStream fos = null;
			String pathStr = "";
			
			
				
			if(images.getContentType().equals("image/jpeg") || images.getContentType().equals("image/png")) {
				
				is = images.getInputStream();
				data = new byte[is.available()];
				is.read(data);
				
				pathStr = path+filename+images.getSubmittedFileName().substring(images.getSubmittedFileName().length()-4, images.getSubmittedFileName().length());
				
				fos = new FileOutputStream(pathStr);
				fos.write(data);
		    	fos.close();
		    	
		    	files = filename+images.getSubmittedFileName().substring(images.getSubmittedFileName().length()-4, images.getSubmittedFileName().length());
		    	
			} 
			// else {
			// 	System.out.println("File must be (JPG/PNG) only");
			// }
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return files;
		
	}
	
	//Random salt
	public String randomSalt() {
		
		Random random = new Random();
		String hex = new String();
		
        int val = random.nextInt(100000000, 999999999);
        hex = Integer.toHexString(val);
        
       return hex;
	}
	
	public void sendEmail(String user_id, String toEmail, String title, String text) {
		
		final String username = "dev.goal62@gmail.com";
		final String password = "ftvetefoyhukuifj";
//		final String password = "!Devgoal62!";
		
		new AdminEmailHistoryDAO().insertEmailHistory(user_id, username, toEmail, text);
		
	        Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", "587");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.starttls.enable", "true");
	        
	        Session session = Session.getInstance(prop,
	                new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication(username, password);
	                    }
	                });

	        try {

	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("DevGoal"));
	            message.setRecipients(
	                    Message.RecipientType.TO,
	                    InternetAddress.parse(toEmail)
	            );
	            message.setSubject("Dev Goal | "+title);
	            message.setText(text);

	            Transport.send(message);
	        } catch (MessagingException e) {
	        	e.printStackTrace();
	        }
	}
	
	public void sendEmailNoUserId(String toEmail, String title, String text) {
		
		final String username = "dev.goal62@gmail.com";
		final String password = "ftvetefoyhukuifj";
//		final String password = "!Devgoal62!";
		
	        Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", "587");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.starttls.enable", "true");
	        
	        Session session = Session.getInstance(prop,
	                new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication(username, password);
	                    }
	                });

	        try {

	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("DevGoal"));
	            message.setRecipients(
	                    Message.RecipientType.TO,
	                    InternetAddress.parse(toEmail)
	            );
	            message.setSubject("Dev Goal | "+title);
	            message.setText(text);

	            Transport.send(message);
	        } catch (MessagingException e) {
	        	e.printStackTrace();
	        }
	}
	
//	//Check skill value and check text level edited from front-end
//		public ArrayList<HashMap<String, String>> checkSkill(String skill) {
//			
//			ArrayList<HashMap<String, String>> skillObject = new ArrayList<HashMap<String, String>>();
//		    JSONArray jsonArray;
//		    HashMap<String, String> subSkillObject;
//		    String form;
//		    
//			try {
//				//Check form and level skill
//				if(skill != null && !skill.equals("")) {
//					jsonArray = new JSONArray(skill);
//					
//					for (int i = 0; i < jsonArray.length(); i++) {
//						
//						//if chk ค่า null & ว่าง
//						if(!jsonArray.getJSONArray(i).get(0).toString().equals("")) {
//							
//							subSkillObject = new HashMap<String, String>();
//							
//							form = jsonArray.getJSONArray(i).get(0).toString().replace(" ", "");
//							form = form.replace("-", "");
//							form = form.replace("_", "");
//							form = form.substring(0, 1).toUpperCase()+form.substring(1, form.length()).toLowerCase();
//							
//							subSkillObject.put("skill", form);
//							
//							
//							if(jsonArray.getJSONArray(i).get(1).toString().equals("ระดับเริ่มต้น")) {
//								subSkillObject.put("level", "1");
//								skillObject.add(subSkillObject);
//								
//							} else if(jsonArray.getJSONArray(i).get(1).toString().equals("ระดับปานกลาง")) {
//								subSkillObject.put("level", "2");
//								skillObject.add(subSkillObject);
//								
//							} else if(jsonArray.getJSONArray(i).get(1).toString().equals("ระดับสูง")) {
//								subSkillObject.put("level", "3");
//								skillObject.add(subSkillObject);
//								
//							} else {
//								System.out.println("Skill level has been changed");
//							}
//							
//						}
//						
//				    }
//				
//				}
//				
//				
//			} catch (JSONException e) {
//				e.printStackTrace();
//			}
//			
//			return skillObject;
//			
//		}
	
	public ArrayList<HashMap<String, String>> checkSkill(String skill) {
		
		ArrayList<HashMap<String, String>> skillObject = new ArrayList<HashMap<String, String>>();
	    JSONArray jsonArray;
	    HashMap<String, String> subSkillObject;

	    try {

	    	if(skill != null && !skill.equals("")) {
				jsonArray = new JSONArray(skill);
				
				for (int i = 0; i < jsonArray.length(); i++) {

					if(!jsonArray.getJSONArray(i).get(0).toString().equals("")) {
						
						subSkillObject = new HashMap<String, String>();
						
						subSkillObject.put("skill", jsonArray.getJSONArray(i).get(0).toString());
						
						
						if(jsonArray.getJSONArray(i).get(1).toString().equals("ระดับเริ่มต้น")) {
							subSkillObject.put("level", "1");
							skillObject.add(subSkillObject);
							
						} else if(jsonArray.getJSONArray(i).get(1).toString().equals("ระดับปานกลาง")) {
							subSkillObject.put("level", "2");
							skillObject.add(subSkillObject);
							
						} else if(jsonArray.getJSONArray(i).get(1).toString().equals("ระดับสูง")) {
							subSkillObject.put("level", "3");
							skillObject.add(subSkillObject);
							
						}
						
					}
					
			    }
			
			}
			
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return skillObject;
		
	}
		
		//Check email form
		public boolean isValid(String email) {
	        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
	                            "[a-zA-Z0-9_+&*-]+)*@" +
	                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
	                            "A-Z]{2,7}$";
	                              
	        Pattern pat = Pattern.compile(emailRegex);
	        if (email == null) {
	            return false;
	        }
	        
	        return pat.matcher(email).matches();
	    }
		
		public String checkPDF(Part pdf) {
			
			String fileName = "";
			
			try {
				
				String filename = randomSalt();
				InputStream is = null;
				byte[] data = null;
				String path = new PathConfig().resume_path;
				FileOutputStream fos = null;
				String pathStr = "";
				
				
					
				if(pdf.getContentType().equals("application/pdf")) {
					
					is = pdf.getInputStream();
					data = new byte[is.available()];
					is.read(data);
					
					pathStr = path+filename+pdf.getSubmittedFileName().substring(pdf.getSubmittedFileName().length()-4, pdf.getSubmittedFileName().length());
					
					fos = new FileOutputStream(pathStr);
					fos.write(data);
			    	fos.close();
			    	
			    	fileName = filename+pdf.getSubmittedFileName().substring(pdf.getSubmittedFileName().length()-4, pdf.getSubmittedFileName().length());
			    	
				} 
				// else {
				// 	System.out.println("File must be (PDF) only");
				// }
					
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return fileName;
		}

}
