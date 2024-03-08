package com.example.demo.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.example.demo.vo.ChatMessage;

@Controller
public class ChatController {

    @MessageMapping("/message")
    @SendTo("/topic/messages")
    public ChatMessage sendMessage(ChatMessage chatMessage) {
        return chatMessage;
    }
    
    @MessageMapping("/join")
    @SendTo("/topic/messages")
    public ChatMessage join(ChatMessage chatMessage) {
        String message = chatMessage.getFrom() + " joined!";
        return new ChatMessage("Server", message);
    }
}