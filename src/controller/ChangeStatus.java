package controller;

import domain.Person;
import domain.PersonInfo;
import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeStatus extends RequestHandler {

    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) {

        PersonService personService = super.getPersonService();
        request.getSession().setAttribute("status",request.getParameter("status"));
        request.getSession().setAttribute("otherText",request.getParameter("otherText"));
        personService.setStatus((String)request.getSession().getAttribute("personId"),request.getParameter("status"),request.getParameter("otherText"));
        return "status.jsp";
    }
}
