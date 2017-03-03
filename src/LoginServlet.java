import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 */

/**
 * @author Huaishao Luo
 * @create 2015-7-29下午7:08:29
 */
public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		username = username.trim();
		password = password.trim();
		
		
		//json使用
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
			String str = "";
			User user = new User();
			if (user != null && user.getUsername().equalsIgnoreCase("A") && user.getPassword().equalsIgnoreCase("A")){
				session.removeAttribute("user");
				session.setAttribute("user", user);
				str = "{ \"result\" : \"1\" }";		//登录成功时字符串返回1
			} else {
				str = "{ \"result\" : \"0\" }";		//登录失败时字符串返回0
			}
			out.println(str);
		
		} catch (Exception e) {
			e.printStackTrace();
			out.println("程序内部错误");
		} finally{
			out.flush();
			out.close();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
