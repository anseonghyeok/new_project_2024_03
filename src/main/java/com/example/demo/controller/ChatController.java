package com.example.demo.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class ChatController {

    @MessageMapping("/chat")
    @SendTo("/topic/messages")
    public OutputMessage sendMessage(Message message) {
        return new OutputMessage(HtmlUtils.htmlEscape(message.getContent()));
    }

    static class Message {
        private String content;

        // getters and setters
        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }
    }

    static class OutputMessage {
        private String content;

        public OutputMessage(String content) {
            this.content = content;
        }

        // getters
        public String getContent() {
            return content;
        }
    }
}