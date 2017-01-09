package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.NullAction;

public class Controller extends HttpServlet {
	private boolean usingTemplate = false;
	private String templatePage = null;
	private Map commandHandlerMap = new HashMap();

	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("configFile");

		System.out.println("configFile:" + configFile);
		// web.xml 에서 경로를 가지고 온다.

		Properties prop = new Properties();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(configFile);
			prop.load(fis);
			System.out.println("fis: " + fis);
			System.out.println("prop " + prop);
			// properties 안으로 load 를 한 것이다.
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException ex) {
				}
		}

		Iterator keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			System.out.println("command: " + command);

			String handlerClassName = prop.getProperty(command).trim();
			System.out.println("handlerClassName: " + handlerClassName);

			try {
				// 클래스를 JVM으로 로딩합니다.
				// mvctem.command.HelloHandler 클래스의 소스를 읽어 들입니다.
				Class handlerClass = Class.forName(handlerClassName);

				// 읽어들인 클래의 객체를 생성합니다.
				Object handlerInstance = handlerClass.newInstance();

				// MAP에 키와 각 클래스별 객체가 저장합니다.
				commandHandlerMap.put(command, handlerInstance);

			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}

		templatePage = config.getInitParameter("templatePage");
		System.out.println("templatePage: " + templatePage);

		if (templatePage != null && !templatePage.equals("")) {
			usingTemplate = true; // 템플릿 페이지 존재
		}
	}

	// 1..HTTP 요청받음, doGet(), doPost() 메소드 호출.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}
	// 1..HTTP 요청받음, doGet(), doPost() 메소드 호출. end

	// 2.클라이언트가 요구하는 기능을 분석 Start
	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String command = request.getRequestURI();
		//
		System.out.println("RequestURI: " + request.getRequestURI());

		// URI:/www_mvc/mvc/list.do
		if (command.indexOf(request.getContextPath()) == 0) {
			// URI로 잘 가지고 왔는지 확인한다. 명령어만 뽑아와야 겠다. /mvc/list.do 이게 명령어이다.
			// properties에 있는 key 값 = 명령어
			command = command.substring(request.getContextPath().length());
			System.out.println("command: " + command);
			//
		}
		// 클라이언트가 요구하는 기능을 분석 end
		Action action = (Action) commandHandlerMap.get(command);

		// 핸들러가 없는 경우
		if (action == null) {
			action = new NullAction();
		}

		String viewPage = null;
		// 3. 요청한 비즈니스 로직을 처리하는 Model 사용, buseness Logic Class
		// 4. 결과를 request 또는 session 의 setAttribute() 메소드를 사용하여 저장
		// 5. 알맞은 뷰 선택
		try {

			viewPage = action.execute(request, response);
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		// 경로상에 popup이라는 경로가 있다면 false 를 해준다.
		if(viewPage.indexOf("/popup")!=-1){
			usingTemplate = false;
		}else{
			usingTemplate = true;
		}
		
		if (usingTemplate) {
			request.setAttribute("CONTENT_PAGE", viewPage);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(usingTemplate ? templatePage : viewPage);
		// usingTemplate 가 참이면 templatePage 거짓이면 viewPage로 이동한다.
		dispatcher.forward(request, response);
	}
}