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

public class ReplyProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String upDir = request.getRealPath("/views/bbs/storage");
		String tempDir = request.getRealPath("/views/bbs/teamp");

		UploadSave upload = new UploadSave(request, -1, -1, tempDir);
		//페이징과 검색을 위한 값(code)
		String col = upload.getParameter("col");
		String word = UploadSave.encode(upload.getParameter("word")); // 한글을 받아올때는 한글처리를 해줘야한다.
		String nowPage = upload.getParameter("nowPage");
		//답변을 위한 부모의 값
		BbsDTO dto = new BbsDTO();
		dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
		dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
		dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));
		//부모글삭제를 제한하기 위해서 
		dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
		//form의 입력된 값가져오기
		dto.setWname(UploadSave.encode(upload.getParameter("wname")));
		dto.setTitle(UploadSave.encode(upload.getParameter("title")));
		dto.setContent(UploadSave.encode(upload.getParameter("content")));
		dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
		//filename 가져오기
		FileItem fileItem = upload.getFileItem("filename");
		int filesize = (int)fileItem.getSize();
		String filename = null;
		if(filesize>0){
			filename = UploadSave.saveFile(fileItem, upDir); // 파일을 추출한다.
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);

		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		
		BbsDAO dao = new BbsDAO();
		dao.upAnsnum(map);
		boolean flag = dao.createReply(dto);
		request.setAttribute("flag", flag);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/views/bbs/replyProc.jsp";
	}
}
