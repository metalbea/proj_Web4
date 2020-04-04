package controller;

import domain.Person;
import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddFriend extends RequestHandler {

    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) {

        PersonService personService = super.getPersonService();
        Person newFriend = personService.getPerson(request.getParameter("friendId"));
        if(newFriend!=null)
        {
            personService.getPersonInfo((String)request.getSession().getAttribute("personId")).addFriend(newFriend);
        }
        return "";
    }
}
