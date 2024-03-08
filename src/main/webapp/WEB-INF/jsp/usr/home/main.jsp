<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>

<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stomp-websocket/lib/stomp.min.js"></script> -->

<head>
    <title>Simple Chat Application</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stomp-websocket/lib/stomp.min.js"></script>
    <script type="text/javascript">
        var stompClient = null;

        function connect() {
            var socket = new SockJS('/chat');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/messages', function (message) {
                    showMessage(JSON.parse(message.body).content);
                });
            });
        }

        function sendMessage() {
            var messageContent = document.getElementById('messageInput').value;
            if (messageContent) {
                stompClient.send("/app/chat", {}, JSON.stringify({'content': messageContent}));
                document.getElementById('messageInput').value = '';
            }
        }

        function showMessage(message) {
            var messageList = document.getElementById('messageList');
            var messageElement = document.createElement('li');
            messageElement.appendChild(document.createTextNode(message));
            messageList.appendChild(messageElement);
        }
    </script>
</head>
<body onload="connect();">
    <div>
        <ul id="messageList"></ul>
        <input type="text" id="messageInput" placeholder="Type a message..."/>
        <button onclick="sendMessage();">Send</button>
    </div>
</body>




<%@ include file="../common/foot.jspf"%>
