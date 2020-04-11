var webChatSocket;
var messages = document.getElementById("messages");

function openChatSocket(userId){
    webChatSocket = new WebSocket("ws://localhost:8080/chat/"+userId);

    webChatSocket.onopen = function(event){
        console.log("connection opened");
    };

    webChatSocket.onmessage = function(event){
        writeResponse(event.data);
    };

    webChatSocket.onclose = function(event){
        console.log("connection closed");
    };
}
/*
function sendComment(postId){
    var name = document.getElementById("userName").value;
    var rating = document.getElementById("points"+postId).value;
    var comment = document.getElementById("comment_text"+postId).value;
    var json = '{"postId": "' + postId + '"' +
        ', "name": "' + name + '"'+
        ', "rating": "'+ rating + '"' +
        ', "comment": "' + comment + '"}';

    webSocket.send(json);
}*/

function stomme() {
    alert("test");
}

function closeChatSocket(){
    webChatSocket.close();
}
/*

function writeResponse(text){
    var obj = JSON.parse(text);
    var postId = obj.postId;
    var bigdiv = document.getElementById("comments-wrapper"+ postId);
    bigdiv.innerHTML += '<div class="comment clearfix">\n' +
        '                        <div class="comment-details">\n' +
        '                        <span class="comment-name">'+obj.name+'</span>\n' +
        '                        <span class="comment-date">'+obj.rating +'/10</span>\n' +
        '                        <p>'+obj.comment+'</p>\n' +
        '                        </div>\n' +
        '                        </div>';

}*/
