package want.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.service.User;
import mvc.command.CommandHandler;
import want.exception.wantNotFoundException;
import want.service.WantService;

public class WantHandler implements CommandHandler{

	private WantService wantService = new WantService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("WantHandler-process()진입");

		String method = request.getMethod();
		System.out.println(method);
        String strExhibition_no = request.getParameter("exhibition_no");
        System.out.println("strExhibition_no=" + strExhibition_no);
        int exhibition_no = Integer.parseInt(strExhibition_no);
        System.out.println("exhibition_no" + exhibition_no);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("AUTH_USER");
        String member_id = user.getId();
        
        System.out.println(exhibition_no);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        
        
        if (method.equals("POST")) {
            //찜 등록
            wantService.wantInsert(member_id, exhibition_no);
            System.out.println("wantService.wantInsert 성공");
        } else if (method.equals("DELETE")) {
            //찜 삭제
            wantService.wantDelete(member_id, exhibition_no);
            System.out.println("wantService.wantDelete 성공");
        } else if (method.equals("GET")) {
            //찜 여부 체크
            boolean wantCheck = wantService.wantCheck(member_id, exhibition_no);
            System.out.println("wantCheck=" + wantCheck);
            System.out.println("wantService.wantCheck 성공");
            
            out.write("{\"wantStatus\": " + wantCheck + "}");
        }
        
        return null; // AJAX call, so we return null
	}
	
	
	/*
	//요청방식이 get 일때 찜을 누를 수 있음
	private String processInsert(HttpServletRequest request, HttpServletResponse response) {
		
		//파라미터받기
		String strNo = request.getParameter("no"); //상세하게 보고싶은 글번호
		int no = Integer.parseInt(strNo); //String을 int로 변환
		System.out.println("ReadExhibitionService - process() no= " + no);
		
		//로그인 정보 불러오기
		User user = (User) request.getSession(false).getAttribute("AUTH_USER");
		
		//비로그인시 로그인창 보여줌
		if (user == null) {
			return request.getContextPath() + "/login.do";
		}		
		
		int wantInsertResult = wantService.wantInsert(user.getMember_id(), no);
		
		return "success";
	}
	
	private String processDelete (HttpServletRequest request, HttpServletResponse response) throws wantNotFoundException {
		//파라미터 받기
		String strNo = request.getParameter("no"); //상세하게 보고싶은 글번호
		int no = Integer.parseInt(strNo); //String을 int로 변환
		System.out.println("ReadExhibitionService - process() no= " + no);
		
		//로그인 정보 불러오기
		User user = (User) request.getSession(false).getAttribute("AUTH_USER");
		
		int wantDeleteResult = wantService.wantDelete(user.getMember_id(), no);
		
		return "success";
	}
	*/
}
