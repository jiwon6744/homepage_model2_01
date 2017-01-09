package action.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import action.Action;
import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import utility.UploadSave;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//--업로드용 변수선언(폴더명) 실제폴더 존재해야함
		request.setCharacterEncoding("utf-8");
		String upDir = "/views/bbs/storage";
		String tempDir = "/views/bbs/temp";

		//--절대경로 생성
		upDir = request.getRealPath(upDir);
		tempDir = request.getRealPath(tempDir);

		BbsDTO dto = new BbsDTO();
		UploadSave upload = new UploadSave(request, -1, -1, tempDir);
		dto.setWname(UploadSave.encode(upload.getParameter("wname")));
		dto.setTitle(UploadSave.encode(upload.getParameter("title")));
		dto.setContent(UploadSave.encode(upload.getParameter("content")));
		dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

		FileItem fileItem = upload.getFileItem("filename");
		int size = (int) fileItem.getSize();
		String filename = null;
		if (size > 0){
			filename = UploadSave.saveFile(fileItem, upDir);
		}
		dto.setFilesize(size);
		dto.setFilename(filename);
		BbsDAO dao = new BbsDAO();
		boolean flag = dao.create(dto);
		request.setAttribute("flag",flag);
		return "/views/bbs/createProc.jsp";
	}

}
