package mvc.controller;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

public class ControllerUsingFile extends HttpServlet {
	
	//<커맨드, 핸들러인스턴스> 매핑 정보 저장
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	public void init() throws ServletException{
		//configFile 초기화 파라미터를 읽어온 후, 설정 파일 경로를 구한다.
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		String configFilePath =getServletContext().getRealPath(configFile);
		try(FileReader fis = new FileReader(configFilePath)) {
			prop.load(fis);
		}catch(IOException e) {
			throw new ServletException(e);
		}
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			//1. 프로퍼티 이름을 커맨드 이름으로 사용
			String command = (String) keyIter.next();
			//2. 커맨드 이름에 해당하는 핸들러 클래스 이름을 프로퍼티에서 구함
			String handlerClassName = prop.getProperty(command);
			
			try {
				//3.핸들러 클래스 이름을 이용해서 Class객체를 구함
				Class<?> handlerClass = Class.forName(handlerClassName);
				//4.Class로부터 핸들러 객체를 생성함
				 CommandHandler handlerInstance = 
	                        (CommandHandler) handlerClass.newInstance();
				//5.commandHandlerMap에(커맨드, 핸들러객체)에 대한 매핑 정보를 저장.
				commandHandlerMap.put(command, handlerInstance);
			}catch(Exception e) {
				throw new ServletException(e);
			}
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		process(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			process(request,response);
		}

	private void process(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
			String command = request.getParameter("cmd");
			CommandHandler handler = commandHandlerMap.get(command);
			if(handler == null) {
				handler = new NullHandler();
			}
			String viewPage = null;
			try {
				viewPage = handler.process(request, response);
		}catch(Exception e) {
			throw new ServletException(e);
		}
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
