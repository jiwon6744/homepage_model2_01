package action.team;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import model.team.TeamDAO;
import model.team.TeamDTO;
import utility.UploadSave;

public class DeleteProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int teamno = Integer.parseInt(request.getParameter("teamno"));
		String oldfile = request.getParameter("oldfile");
		TeamDAO dao = new TeamDAO();
		boolean flag = dao.delete(teamno);
		if (flag){
			String upDir = request.getRealPath("/views/team/storage"); // 이게 뭐하는 코드?
			UploadSave.deleteFile(upDir, oldfile);
		}
		request.setAttribute("flag", flag);
		return "/views/team/deleteProc.jsp";
	}
}
