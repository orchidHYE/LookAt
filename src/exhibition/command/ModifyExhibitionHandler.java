package exhibition.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import exhibition.exception.ArticleNotFoundException;
import exhibition.exception.ExhibitionNotFoundException;
import exhibition.exception.PermissionDeniedException;
import exhibition.model.Exhibition;
import exhibition.service.ListExhibitionService;
import exhibition.service.ModifyExhibitionService;
import exhibition.service.ReadExhibitionService;
import mvc.command.CommandHandler;

public class ModifyExhibitionHandler implements CommandHandler {

	private String FORM_VIEW = "/view/exhibition/modifyForm.jsp";
	
	//수정폼 보여줄때 상세 내용을 가져오기 위한 Service객체 생성
	private ReadExhibitionService readExhibitionService = new ReadExhibitionService();
	
	//수정처리를 위한 Service
	private ModifyExhibitionService modifyExhibitionService = new ModifyExhibitionService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ModifyExhibitionHandler-process()진입");
		
		if (request.getMethod().equalsIgnoreCase("get")) {		//요청방식이 get 방식이면 FORM_VIEW 보여주기
			return processForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("post")) {	//요청방식이 post 방식이면 회원가입 처리
			return processSubmit(request, response); //p669 31라인
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED); //405오류
			return null;
		}
	
	} //process


	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return request.getContextPath() + FORM_VIEW;
	} //processForm

	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws ExhibitionNotFoundException, IOException, ArticleNotFoundException, PermissionDeniedException {
		//1.파라미터받기
		int no = Integer.parseInt( request.getParameter("no") );//수정하고 싶은 글번호
		
		//2.비즈니스로직
		Exhibition exhibition = readExhibitionService.getDetail(no); //상세정보 저장해줄 Exhibition타입의 변수 선언
		User user = (User)request.getSession().getAttribute("AUTH_USER"); //세션로그인유저정보
		if(!canModify(user, exhibition)) { //수정불가하면
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		
		//수정을 위해 세션에서 가져온 회원id, 글번호, db에서 가져온 제목과 내용
		Exhibition modReq = new Exhibition(user.getId(), no, exhibition.getTitle(),exhibition.getOpen_date(),exhibition.getEnd_date(),exhibition.getPlace(),exhibition.getThumbnail(),exhibition.getDetails_img(),exhibition.getIntroduction());
		//3.Model-p670 53라인
		
		modifyExhibitionService.modify(modReq);
		request.setAttribute("modReq", modReq);
		
		//4.View 
		return request.getContextPath()+FORM_VIEW;
	}//processSubmit


	private boolean canModify(User user, Exhibition exhibition) {
		return user.getId().equals("admin");
	}
	
	
	
}
