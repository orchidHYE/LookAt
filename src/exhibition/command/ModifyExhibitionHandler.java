package exhibition.command;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import exhibition.exception.ExhibitionNotFoundException;
import exhibition.exception.PermissionDeniedException;
import exhibition.model.Exhibition;
import exhibition.service.ModifyExhibitionService;
import exhibition.service.ReadExhibitionService;
import mvc.command.CommandHandler;

public class ModifyExhibitionHandler implements CommandHandler {

	private String FORM_VIEW = "/view/exhibition/modifyForm.jsp";

	// 수정폼 보여줄때 상세 내용을 가져오기 위한 Service객체 생성
	private ReadExhibitionService readExhibitionService = new ReadExhibitionService();

	// 수정처리를 위한 Service
	private ModifyExhibitionService modifyExhibitionService = new ModifyExhibitionService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("ModifyExhibitionHandler-process()진입");

		if (request.getMethod().equalsIgnoreCase("get")) { // 요청방식이 get 방식이면 FORM_VIEW 보여주기
			System.out.println("process-if-processForm");
			return processForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("post")) { // 요청방식이 post 방식이면 회원가입 처리
			System.out.println("process-else if-processSubmit");
			return processSubmit(request, response); 
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED); // 405오류
			return null;
		}

	} // process

	private String processForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ModifyExhibitionHandler-processForm() 진입");
		
		// 1.파라미터받기
		int no = Integer.parseInt(request.getParameter("no"));// 수정하고 싶은 글번호
		System.out.println("exhibitionNo: " + no);
		
		
		// 2.비즈니스로직
		// 상세정보 저장해줄 Exhibition타입의 변수 선언
		Exhibition exhibition = readExhibitionService.getDetail(no); 
		
		//수정 자격 체크, 로그인된 세션 가져와서 그 세션 중 id가 admin일 경우만 수정 가능
		User user = (User) request.getSession().getAttribute("AUTH_USER"); // 세션로그인유저정보
		if (!canModify(user, exhibition)) { // user에 저장된 아이디가 'admin'이 아니라면 수정불가
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			System.out.println(user.getId());
			return null;
		}
		
		
		// 3. request로 exhibition객체 전달
		request.setAttribute("modReq", exhibition);
		
		
		// 4.View
		return request.getContextPath() + FORM_VIEW;
	} // processForm

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws ExhibitionNotFoundException, IOException, PermissionDeniedException {
		
		System.out.println("ModifyExhibitionHandler-processSubmit() 진입");
		
		
		//수정 내용을 저장해주기 위한 코드
		Exhibition exhibition = new Exhibition();
		exhibition.setTitle(request.getParameter("title"));
		//exhibition.setOpen_date(Date.valueOf(request.getParameter("open_date")));
		//exhibition.setEnd_date(Date.valueOf(request.getParameter("end_date")));
		exhibition.setPlace( request.getParameter("place"));
		exhibition.setThumbnail(request.getParameter("thumbnail"));
		exhibition.setDetails_img(request.getParameter("details_img"));
		exhibition.setIntroduction(request.getParameter("introduction"));
		//exhibition.setPrice_adult( Integer.parseInt(request.getParameter("price_adult")));
		//exhibition.setPrice_student(Integer.parseInt(request.getParameter("price_student")));
		//exhibition.setPrice_baby(Integer.parseInt(request.getParameter("price_baby")));
		//exhibition.setDetails_place(request.getParameter("details_place"));
			
		// 3.Model
		modifyExhibitionService.modify(exhibition);
		
		//4.View
		response.sendRedirect(request.getContextPath()+ "/exhibition/read.do");
		return null;
	}// processSubmit

	private boolean canModify(User user, Exhibition exhibition) {
		return user.getId().equals("admin");
	}

	
	
}
