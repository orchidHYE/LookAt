package exhibition.command;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.service.User;
import exhibition.model.Exhibition;
import exhibition.service.WriteExhibitionService;
import mvc.command.CommandHandler;

public class WriteExhibitionHandler implements CommandHandler {

	// write service 객체 생성
	private static final String FORM_VIEW = "/view/exhibition/writeExhibition.jsp";
	private WriteExhibitionService writeExhibitionService = new WriteExhibitionService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WriteExhibitionService의 process()진입");

		if (request.getMethod().equalsIgnoreCase("get")) { // 요청방식이 get 방식이면 FORM_VIEW 보여주기
			return processForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("post")) { // 요청방식이 post 방식이면 글 등록 처리
			return processSubmit(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED); // 405오류
			return null;
		}

	}

	// 글등록 폼을 보여주기 - 641 31라인
	private String processForm(HttpServletRequest request, HttpServletResponse response) throws IOException {

		User user = (User) request.getSession(false).getAttribute("AUTH_USER");
		
		
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login.do");
		}
		else if (user.getId().equals("admin")) { 
			  return FORM_VIEW; 
		} 
		
		return null;
	}

	// 글등록 처리 p641 35라인
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 에러 정보가 담기는 Map - p641 36라인
		Map<String, Boolean> errors = new HashMap();
		request.setAttribute("errors", errors);

		// 1.파라미터 받기
		User user = (User) request.getSession(false).getAttribute("AUTH_USER");
		HttpSession session = request.getSession();

		Exhibition writeRequest = createWriteRequest(request);
		writeRequest.validate(errors); // 필수입력검사

		// p641 43라인
		if (!errors.isEmpty()) { // 에러가 있으면
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return null;
		}
		// p641 53라인

		// 2.비즈니스 로직 <-> Service <-> DAO <-> DB
		int newArticleNo = writeExhibitionService.insert(writeRequest);

		// 3.Model => 방법1. request 방법2.session.setAttribute("속성명", Object 값);
		request.setAttribute("newArticleNo", newArticleNo);

		// 4.View - 성공시: view/newArticleSeuccess.jsp이동
		// 실패시 FORM_VIEW로 이동
		return request.getContextPath() + "/view/exhibition/writeExhibitionSuccess.jsp";
	}

	// 작성자 정보
	private Exhibition createWriteRequest(HttpServletRequest request) throws SQLException {
		Exhibition exhibition = new Exhibition();
		exhibition.setTitle(request.getParameter("title"));
		exhibition.setOpen_date(Date.valueOf(request.getParameter("open_date")));
		exhibition.setEnd_date(Date.valueOf(request.getParameter("end_date")));
		exhibition.setPlace( request.getParameter("place"));
		exhibition.setThumbnail(request.getParameter("thumbnail"));
		exhibition.setDetails_img(request.getParameter("details_img"));
		exhibition.setIntroduction(request.getParameter("introduction"));
		exhibition.setPrice_adult( Integer.parseInt(request.getParameter("price_adult")));
		exhibition.setPrice_student(Integer.parseInt(request.getParameter("price_student")));
		exhibition.setPrice_baby(Integer.parseInt(request.getParameter("price_baby")));
		exhibition.setDetails_place(request.getParameter("details_place"));
		return exhibition;
	}

}
