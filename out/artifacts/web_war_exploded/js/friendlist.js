var xhr = new XMLHttpRequest();
function getFriendList() {
    var url = "Controller?action=Friendlist";
    xhr.open("GET", url, true);
    xhr.onreadystatechange = getFriendData;
    xhr.send();
    setTimeout(getFriendList,5000);
}

function getFriendData() {
    if (xhr.status == 200) {
        if (xhr.readyState == 4) {
            var table = document.getElementById("friendListTable"); // <div id="quote"></div>
            table.innerHTML = null;
            var jsonString = xhr.responseText;
            var friendjson = JSON.parse(jsonString);
            for(var i = 0; i < friendjson.length;i++)
            {
                table.innerHTML+= "<tr><td>" + friendjson[i].friendName + "</td><td>" + friendjson[i].friendStatus + "</td></tr>"
            }
        }
    }
}


function addNewFriend() {
    var xhr1 = new XMLHttpRequest();
    var friendId = document.getElementById('friendId').value;
    var url = "Controller?action=AddFriend&friendId=" + friendId;
    xhr1.open("GET", url, true);
    xhr1.send();

}




