package action.bbs;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import model.bbs.BbsDAO;
import utility.UploadSave;

public class DeleteProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));
		String passwd = request.getParameter("passwd");
		String oldfile = request.getParameter("oldfile");

		Map map = new HashMap();
		map.put("bbsno", bbsno);
		map.put("passwd", passwd);
		BbsDAO dao = new BbsDAO();
		boolean pflag = dao.passCheck(map);
		boolean flag = false;
		if (pflag) {
			flag = dao.delete(bbsno);
		}
		if (flag){
			String upDir = request.getRealPath("/views/bbs/storage"); // 이게 뭐하는 코드?
			UploadSave.deleteFile(upDir, oldfile);
		}
		request.setAttribute("pflag", pflag);
		request.setAttribute("flag",flag);
		
		return "/views/bbs/deleteProc.jsp";
	}

}
