package action.imgbbs;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import action.Action;
import model.imgbbs.ImgbbsDAO;
import model.imgbbs.ImgbbsDTO;
import utility.UploadSave;

public class UpdateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String upDir = "/views/imgbbs/storage";
		String tempDir = "/views/imgbbs/temp";

		upDir = request.getRealPath(upDir);
		tempDir = request.getRealPath(tempDir);

		UploadSave upload = new UploadSave(request, -1, -1, tempDir);
		// 패스워드 검증
		// 수정처리
		String col = upload.getParameter("col");
		String word = UploadSave.encode(upload.getParameter("word"));
		String nowPage = upload.getParameter("nowPage");
		String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
//		int no = Integer.parseInt(upload.getParameter("no"));
		System.out.println(oldfile);

		ImgbbsDTO dto = new ImgbbsDTO();
		dto.setNo(Integer.parseInt(upload.getParameter("no")));
		dto.setName(UploadSave.encode(upload.getParameter("name")));
		dto.setTitle(UploadSave.encode(upload.getParameter("title")));
		dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
		dto.setContent(UploadSave.encode(upload.getParameter("content")));

		FileItem fileItem = upload.getFileItem("filename");
		int filesize = (int) fileItem.getSize();
		String filename = null;
		if (filesize > 0) {// 새로운 파일을 업로드 했음
			UploadSave.deleteFile(upDir, oldfile);
			filename = UploadSave.saveFile(fileItem, upDir);
		}

		dto.setFilename(filename);

		Map map = new HashMap();
		map.put("no", dto.getNo());
		map.put("passwd", dto.getPasswd());

		ImgbbsDAO dao = new ImgbbsDAO();
		boolean pflag = dao.passCheck(map);

		boolean flag = false;
		if (pflag) {
			flag = dao.update(dto);
		}
		request.setAttribute("flag", flag);
		request.setAttribute("pflag", pflag);
		request.setAttribute("col",col);
		request.setAttribute("word",word);
		request.setAttribute("nowPage",nowPage);
		System.out.println("col" + col + "word" + word + nowPage);
		return "/views/imgbbs/updateProc.jsp";
	}

}
