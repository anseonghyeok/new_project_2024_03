<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>


<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stomp-websocket/lib/stomp.min.js"></script> -->

<head>
    <title>Chat</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: auto;
        }
        .messaging {
            border: 1px solid #ccc;
            margin-top: 20px;
            padding: 10px;
        }
        .input-group {
            margin-bottom: 10px;
        }
        input[type="text"] {
            padding: 10px;
            margin-right: 5px;
            border: 1px solid #ccc;
            width: calc(70% - 15px); /* Adjust based on button width */
        }
        button {
            padding: 10px;
            width: 30%;
        }
        #messages {
            height: 200px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 5px;
        }
        .message {
            margin-bottom: 10px;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stomp-websocket/lib/stomp.min.js"></script>
</head>
<body>
    <div class="container">
        <h3>Chat Room</h3>
        <div class="messaging">
            <div class="input-group">
                <input type="text" id="from" placeholder="Name">
                <input type="text" id="text" placeholder="Message">
                <button onclick="sendMessage()">Send</button>
            </div>
            <div id="messages"></div>
        </div>
    </div>

    <script type="text/javascript">
        var stompClient = null;

        function connect() {
            var socket = new SockJS('/chat');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function(frame) {
                stompClient.subscribe('/topic/messages', function(message) {
                    var messageObj = JSON.parse(message.body);
                    showMessage(messageObj.from, messageObj.text);
                });
            });
        }

        function sendMessage() {
            var from = document.getElementById('from').value;
            var text = document.getElementById('text').value;
            stompClient.send("/app/message", {}, JSON.stringify({from: from, text: text}));
        }

        function showMessage(from, text) {
            var messages = document.getElementById('messages');
            var messageElement = document.createElement('div');
            messageElement.classList.add('message');
            messageElement.textContent = `${from}: ${text}`;
            messages.appendChild(messageElement);
            messages.scrollTop = messages.scrollHeight; // Auto-scroll to the latest message
        }

        connect();
    </script>
</body>
<%@ include file="../common/foot.jspf"%>
