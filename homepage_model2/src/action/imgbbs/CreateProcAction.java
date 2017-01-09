package action.imgbbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import action.Action;
import model.imgbbs.ImgbbsDAO;
import model.imgbbs.ImgbbsDTO;
import utility.UploadSave;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//--업로드용 변수 선언(폴더명)
		String upDir = "/views/imgbbs/storage";
		String tempDir = "/views/imgbbs/temp";
		//절대경로
		upDir = request.getRealPath(upDir);
		tempDir = request.getRealPath(tempDir);
		//사진저장을 위한 객체생성.
		ImgbbsDTO dto = new ImgbbsDTO();
		UploadSave upload = new UploadSave(request,-1,-1, tempDir);
		dto.setName(UploadSave.encode(upload.getParameter("name")));
		dto.setTitle(UploadSave.encode(upload.getParameter("title")));
		dto.setContent(UploadSave.encode(upload.getParameter("content")));
		dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
		//사진의 파일이름과 데이터베이스와의 매칭
		FileItem fileItem = upload.getFileItem("filename");
		int size = (int)fileItem.getSize();
		String filename = null;
		if(size>0){
			filename = UploadSave.saveFile(fileItem, upDir);
		}
		//dto에 파일이름을 저장
		dto.setFilename(filename);
		boolean flag = false;
		ImgbbsDAO dao = new ImgbbsDAO();
		flag = dao.create(dto);
		request.setAttribute("flag", flag);
		return "/views/imgbbs/createProc.jsp";
	}

}
