package controller;

import domain.Person;
import domain.PersonInfo;
import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class Friendlist extends RequestHandler {


    @Override
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) {
        PersonService personService = super.getPersonService();
        String json = friendListToJson(personService.getPersonInfo((String) request.getSession().getAttribute("personId")).getFriendList());

        request.setAttribute("friendsJson", json);
        response.setContentType("application/json");
        try {
            response.getWriter().write(json);
        }
        catch (Exception e)
        {

        }

        return "";
    }

    private String friendListToJson(Map<String, Person> friendList) {
        PersonService personService = super.getPersonService();
        String json = "[";
        boolean first = true;
        for (Map.Entry<String, Person> entry : friendList.entrySet()) {
            if(!first)
            {
                json += ",";
            }
            else {
                first = false;
            }
            PersonInfo pi = personService.getPersonInfo(entry.getKey());
            String statusVal;
            if (pi.getStatus().equals("other")) {
                statusVal = pi.getOtherText();
            } else {
                statusVal = pi.getStatus();
            }
            json += "{ \"friendName\": \"" + entry.getValue().getFirstName() + " " + entry.getValue().getLastName() + "\",";
            json += "\"friendStatus\": \"" + statusVal + "\"}";
        }
        json += "]";
        return json;
    }
}
