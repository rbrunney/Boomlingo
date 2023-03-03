package dngo.boomlingo.springwebrtc.configurers;


import dngo.boomlingo.springwebrtc.Room;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Component
public class SocketHandler extends TextWebSocketHandler {
    List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
    List<Room> rooms = new CopyOnWriteArrayList<>();


    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message)
            throws InterruptedException, IOException {
        System.out.println("message: " + message.getPayload());

        JSONObject messageBody = new JSONObject(message.getPayload());
        Room roomToUse = null;

        if(messageBody.keySet().contains("username")){
            for(Room room : rooms){
                if(room.getUsername().equals(messageBody.getString("username"))){
                    roomToUse = room;
                }
            }
            if(roomToUse == null){
                roomToUse = new Room();
            }
            roomToUse.setUsername(messageBody.getString("username"));
        }else{
            for(Room room : rooms){
                if(room.getUsername().equals("default")){
                    roomToUse = room;
                }
            }
            if(roomToUse == null){
                roomToUse = new Room();
            }
        }
        rooms.add(roomToUse);


        if(messageBody.keySet().contains("offer")){
            roomToUse.setUserSession(session);
            roomToUse.setMessage(message);
            for (WebSocketSession sessionToSendTo: roomToUse.getSessions()){
                if(sessionToSendTo.isOpen()){
                    sessionToSendTo.sendMessage(message);
                }
            }
        } else if (messageBody.keySet().contains("answer")) {
            if(roomToUse.getSessions().stream().noneMatch(s -> s.getId().equals(session.getId()))){
                roomToUse.getSessions().add(session);
            }
            if (roomToUse.getUserSession() != null && roomToUse.getUserSession().isOpen()) {
                roomToUse.getUserSession().sendMessage(message);
            }
            for(WebSocketSession sessionToSendTo : roomToUse.getSessions()){
                if(sessionToSendTo.isOpen() && !sessionToSendTo.getId().equals(session.getId())){
                    sessionToSendTo.sendMessage(message);
                }
            }
        } else if(messageBody.keySet().contains("join_room")){
            roomToUse.getSessions().add(session);
            for(WebSocketSession sessionToSendTo : roomToUse.getSessions()){
                if(sessionToSendTo.isOpen()){
                    sessionToSendTo.sendMessage(roomToUse.getMessage());
                    for(WebSocketMessage ice_candidate : roomToUse.getIceCandidates()){
                        sessionToSendTo.sendMessage(ice_candidate);
                    }
                }
            }
//            session.sendMessage(message);
        } else if(messageBody.keySet().contains("ice_candidate")){
            roomToUse.getIceCandidates().add(message);
            for(WebSocketSession sessionToSendTo : roomToUse.getSessions()){
                if(sessionToSendTo.isOpen()){
                    sessionToSendTo.sendMessage(message);
                }
            }
        }

//        for (WebSocketSession webSocketSession : sessions) {
//            if (webSocketSession.isOpen() && !session.getId().equals(webSocketSession.getId())) {
//                webSocketSession.sendMessage(message);
//            }
//        }
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
    }

}
