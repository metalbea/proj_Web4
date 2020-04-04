package domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PersonInfo {
    private String userId;
    private String status;
    private String otherText;
    private Map<String,Person> friendList;

    public PersonInfo(String userId) {
        this.userId = userId;
        this.status = "offline";
        this.otherText = "";
        this.friendList = new HashMap<>();
    }

    public String getUserId() {
        return userId;
    }

    public String getStatus() {
        return status;
    }

    public String getOtherText() {
        return otherText;
    }

    public Map<String, Person> getFriendList() {
        return friendList;
    }

    public void setOtherText(String otherText) {
        if(otherText!=null) {
            this.otherText = otherText;
        }
        else
        {
            this.otherText = "";
        }
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Person getFriend(String userId)
    {
        return friendList.get(userId);
    }

    public void addFriend(Person friend)
    {
        friendList.put(friend.getUserId(),friend);
    }
}
