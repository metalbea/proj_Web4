package controller;

import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOut extends RequestHandler {

    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) {
        HttpSession session = request.getSession();
        PersonService personService = super.getPersonService();
        personService.getPersonInfo((String) session.getAttribute("personId")).setStatus("offline");
        session.invalidate();

        return "index.jsp";
    }

}
