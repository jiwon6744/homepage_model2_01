package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import model.bbs.BbsDAO;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));

		BbsDAO dao = new BbsDAO();
		boolean flag = dao.checkRefno(bbsno);
		request.setAttribute("flag", flag);
		return "/views/bbs/deleteForm.jsp";
	}
}
