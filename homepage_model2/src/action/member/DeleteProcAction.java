package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import model.member.MemberDAO;
import utility.UploadSave;

public class DeleteProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String upDir = request.getRealPath("/views/member/storage");
		String id = request.getParameter("id");
		String oldfile = request.getParameter("oldfile");
		if (oldfile != null && oldfile.equals("member.jpg")) {
			oldfile = null;
		}
		HttpSession session = request.getSession();
//		String id = request.getParameter("id");
//		if (id == null) {
//			id = (String) session.getAttribute("id");
//		}
		MemberDAO dao = new MemberDAO();
		boolean flag = dao.delete(id);
		if (flag) {
			UploadSave.deleteFile(upDir, oldfile);
			String session_id = (String) session.getAttribute("id");
			if(!session_id.equals("admin"))
			session.invalidate();
			// 20분정도 기본적으로 연결되어있는데 그 session을 끊는 역할을 한다.
		}
		request.setAttribute("flag", flag);

		return "/views/member/deleteProc.jsp";
	}

}
