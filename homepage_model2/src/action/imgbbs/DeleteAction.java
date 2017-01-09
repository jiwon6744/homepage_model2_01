package action.imgbbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import model.imgbbs.ImgbbsDAO;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));

		ImgbbsDAO dao = new ImgbbsDAO();
		boolean flag = dao.chechRefno(no);
		request.setAttribute("flag", flag);
		
		return "/views/imgbbs/deleteForm.jsp";
	}
}
