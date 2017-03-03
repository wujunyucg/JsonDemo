import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 */

/**
 * @author Huaishao Luo
 * @create 2015-7-29下午7:26:22
 */
public class HomeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HomeServlet() {
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

		User user = new User();  
        user.setUsername("AB");
        user.setPassword("AD");
        List<User> users = new ArrayList<User>(); 
        users.add(user);
        
        ObjectMapper mapper = new ObjectMapper(); 
        String jsonlist = mapper.writeValueAsString(users);
        
        String s = "{\"comments\":" + jsonlist + "}";
        
        
      //json使用
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
			out.println(s);
		
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
