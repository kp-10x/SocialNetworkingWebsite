/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sp.backend;

import in.sp.dbqueries.DbQueries;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LikeStatus extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        
        String email1 = request.getParameter("email1");
        String date1 = request.getParameter("date1");
        String time1 = request.getParameter("time1");
        
        HttpSession session = request.getSession();
        String session_email = (String) session.getAttribute("session_email");
        
        boolean status = DbQueries.likeStatus(email1, date1, time1, session_email);
        if(status)
        {
            out.print(status);
        }
        else
        {
            out.print(status);
        }
    }
}
