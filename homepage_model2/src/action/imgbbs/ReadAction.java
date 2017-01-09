package action.imgbbs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import model.imgbbs.ImgbbsDAO;
import model.imgbbs.ImgbbsDTO;

public class ReadAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		
		/*조회수 증가*/
		ImgbbsDAO dao = new ImgbbsDAO();
		dao.upViewcnt(no);
		ImgbbsDTO dto = dao.read(no);
		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");
		List list = dao.imgRead(no);
		String[] files = (String[])list.get(0);
		int[] noArr = (int[])list.get(1);
		
		request.setAttribute("noArr", noArr);
		request.setAttribute("files", files);
		request.setAttribute("list",list);
		request.setAttribute("dto", dto);
		request.setAttribute("no", no);
		return "/views/imgbbs/read.jsp";
	}

}
