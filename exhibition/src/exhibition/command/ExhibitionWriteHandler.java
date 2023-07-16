package exhibition.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class ExhibitionWriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.파라미터 받기
		//2.비즈니스 로직 처리
		//3. Model
		//4. View
		return request.getContextPath() + "view/exhibition/exhibitionWrite.do";
	}
	
}
