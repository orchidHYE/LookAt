package auth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.LoginFailException;
import auth.service.ResetPwdService;
import auth.service.SetService;
import auth.service.UserPwd;
import member.service.DuplicateIdException;
import mvc.command.CommandHandler;

public class ResetPwdHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "view/member/setPwd.jsp";
	private ResetPwdService resetPwdService = new ResetPwdService();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("ResetPwdHandler-process");
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		}else if(req.getMethod().equalsIgnoreCase("POST")){
			return processSubmit(req, res);
		}else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		}
		return null;
	}
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		 System.out.println("ResetPwdHandler-processSubmit 진입");
		 req.getParameter("settel");
		 String setpw = req.getParameter("setpw");
	     String setrepw = req.getParameter("setrepw");
	     
	     Map<String, Boolean> errors = new HashMap<String, Boolean>();
	     req.setAttribute("errors", errors);
	     
	     if(setpw == null || setpw.isEmpty()) {
	        	errors.put("setpw", Boolean.TRUE);
	        }
	     if(setrepw == null || setrepw.isEmpty()) {
	        	errors.put("setrepw", Boolean.TRUE);
	        }
	     if(!errors.isEmpty()) {
	        	return req.getContextPath()+FORM_VIEW;
	        }
	     try {
	            // 데이터베이스에서 회원 정보 검색
	            int user = resetPwdService.resetPwd(setpw, setrepw); // MemberDao에서 해당 회원 검색하는 메서드 사용
	           req.setAttribute("user", user);
	            System.out.println(user);
	            if(user == 0) {
	            	errors.put("nameOrTelNotMatch", Boolean.TRUE);
	            	return req.getContextPath()+FORM_VIEW;
	            }
	            return req.getContextPath() +"/view/member/login.jsp";
	        } catch (RuntimeException e) {
	        	errors.put("nameOrTelNotMatch", Boolean.TRUE);
	        	return req.getContextPath()+FORM_VIEW;
	       
	        }
	}
	}


