package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import action.Action;
import model.member.MemberDAO;
import model.member.MemberDTO;
import utility.UploadSave;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String upDir = "/views/member/storage";
		String tempDir = "/views/member/temp";
		request.setCharacterEncoding("utf-8");

		upDir = request.getRealPath(upDir);
		tempDir = request.getRealPath(tempDir);

		//upload 빈즈를 생성한다.
		UploadSave upload = new UploadSave(request, -1, -1, tempDir);

		//form의 값을 받는다.
		String id = UploadSave.encode(upload.getParameter("id"));
		String email = upload.getParameter("email");
		String str = "";
		String viewPage = "/views/member/prcreateProc.jsp";

		MemberDAO dao = new MemberDAO();
		if (dao.duplicateId(id)) {
			str = "중복된 아이디 입니다. 다시 입력해주세요.";
			request.setAttribute("str", str);
		} else if (dao.duplicateEmail(email)) {
			str = "중복된 이메일 입니다. 다시 입력해주세요.";
			request.setAttribute("str", str);
		} else {
			MemberDTO dto = new MemberDTO();
			dto.setId(UploadSave.encode(upload.getParameter("id")));
			dto.setMname(UploadSave.encode(upload.getParameter("mname")));
			dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
			dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));

			dto.setPasswd(upload.getParameter("passwd"));
			dto.setTel(upload.getParameter("tel"));
			dto.setEmail(upload.getParameter("email"));
			dto.setZipcode(upload.getParameter("zipcode"));
			dto.setJob(upload.getParameter("job"));

			//form의 선택한 파일 받기
			FileItem fileItem = upload.getFileItem("fname");
			int size = (int) fileItem.getSize();
			String fname = null;
			if (size > 0) {
				//파일이 있으면 파일을 저장한다.
				fname = UploadSave.saveFile(fileItem, upDir);
			} else {
				//업로드를 안하면 기본사진을 넣어준다.
				fname = "member.jpg";
			}
			// fname 에 저장한 데이터를 dto에 set한다.
			dto.setFname(fname);
			boolean flag = dao.create(dto);
			request.setAttribute("flag", flag);
			
			viewPage ="/views/member/createProc.jsp";
		}
		return viewPage;
	}
}
