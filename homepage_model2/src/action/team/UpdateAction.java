package action.team;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import model.team.TeamDAO;
import model.team.TeamDTO;

public class UpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int teamno = Integer.parseInt(request.getParameter("teamno"));
		TeamDAO dao = new TeamDAO();
		TeamDTO dto = dao.read(teamno);
		//System.out.println(dto.getSkillstr());
		request.setAttribute("dto", dto);
		return "/views/team/updateForm.jsp";
	}

}
