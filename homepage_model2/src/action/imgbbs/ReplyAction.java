package action.imgbbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import model.imgbbs.ImgbbsDAO;
import model.imgbbs.ImgbbsDTO;

public class ReplyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));
		ImgbbsDAO dao = new ImgbbsDAO();
		ImgbbsDTO dto = dao.readReply(no);
		request.setAttribute("dto", dto);
		request.setAttribute("no", no);
		return "/views/imgbbs/replyForm.jsp";
	}

}
