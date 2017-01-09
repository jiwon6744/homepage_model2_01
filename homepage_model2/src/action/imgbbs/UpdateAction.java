package action.imgbbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import model.imgbbs.ImgbbsDAO;
import model.imgbbs.ImgbbsDTO;
import utility.UploadSave;

public class UpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));
		ImgbbsDAO dao = new ImgbbsDAO();
		ImgbbsDTO dto = dao.read(no);

		String upDir = "/views/imgbbs/storage";
		String tempDir = "/views/imgbbs/temp";

		upDir = request.getRealPath(upDir);
		tempDir = request.getRealPath(tempDir);

		UploadSave upload = new UploadSave(request, -1, -1, tempDir);
		String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
		request.setAttribute("dto",dto);
		request.setAttribute("oldfile", oldfile);
		request.setAttribute("no", no);
		return "/views/imgbbs/updateForm.jsp";
	}

}
