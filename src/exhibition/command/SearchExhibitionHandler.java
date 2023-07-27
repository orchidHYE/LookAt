package exhibition.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class SearchExhibitionHandler implements CommandHandler {

	//필드
	private SearchExhibitionService searchExhibitionService = new SearchExhibitionService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//파라미터받기
		
		//비즈니스로직 처리
		//Model
		//View
		return null;
	}

}
