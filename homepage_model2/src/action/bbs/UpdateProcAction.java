package action.bbs;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import action.Action;
import model.bbs.BbsDAO;
import model.bbs.BbsDTO;
import utility.UploadSave;

public class UpdateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String upDir = "/views/bbs/storage";
		String tempDir = "/views/bbs/temp";
		
		upDir = request.getRealPath(upDir);
		tempDir = request.getRealPath(tempDir);
		
		UploadSave upload = new UploadSave(request,-1,-1,tempDir);
		String col = upload.getParameter("col");
		String word = UploadSave.encode(upload.getParameter("word"));
		String nowPage = upload.getParameter("nowPage");
		String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
		
		BbsDTO dto = new BbsDTO();
		dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno"))); // 정수 변환
		dto.setWname(UploadSave.encode(upload.getParameter("wname"))); // 한글 처리
		dto.setTitle(UploadSave.encode(upload.getParameter("title")));
		dto.setContent(UploadSave.encode(upload.getParameter("content")));
		dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
		
		FileItem fileItem = upload.getFileItem("filename"); // 선택한 파일을 받아온다.
		int filesize = (int)fileItem.getSize(); // 사이즈를 구한다
		String filename = null;
		if(filesize>0){ // 새로운 파일을 업로드했다.
			UploadSave.deleteFile(upDir, oldfile);//기존파일을 삭제
			filename = UploadSave.saveFile(fileItem, upDir); // 순수 파일명만 저장
		}
		dto.setFilesize(filesize);
		dto.setFilename(filename);

		Map map = new HashMap();
		map.put("bbsno", dto.getBbsno());
		map.put("passwd", dto.getPasswd());
		
		BbsDAO dao = new BbsDAO();
		boolean pflag = dao.passCheck(map);
		// 패스워드 체크하는 부분.
		
		boolean flag = false;
		if (pflag) {
			flag = dao.update(dto);
		}
		request.setAttribute("flag", flag);
		request.setAttribute("pflag",pflag);
		request.setAttribute("col",col);
		request.setAttribute("word",word);
		request.setAttribute("nowPage",nowPage);
		
		return "/views/bbs/updateProc.jsp";
	}

}
