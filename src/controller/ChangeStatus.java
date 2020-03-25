package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeStatus extends RequestHandler {

    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) {

        switch (request.getParameter("status")) {
            case "offline":
                request.getSession().setAttribute("status", "offline");
                break;

            case "away":
                request.getSession().setAttribute("status", "away");
                break;

            case "other":
                request.getSession().setAttribute("status", "other");
                request.getSession().setAttribute("otherText", request.getParameter("otherText"));
                break;

            default:
                request.getSession().setAttribute("status", "online");
        }
        String destination = "status.jsp";
        return destination;
    }
}
