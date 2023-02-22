package dngo.boomlingo.springwebrtc.configurers;


import dngo.boomlingo.springwebrtc.Room;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
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
        for(Room room : rooms){
            if(room.getUsername().equals(messageBody.getString("username"))){
                roomToUse = room;
            }
        }

        if(roomToUse == null){
            roomToUse = new Room();
        }
        if(messageBody.keySet().contains("username")){
            roomToUse.setUsername(messageBody.getString("username"));
        }

        if(messageBody.keySet().contains("offer") && messageBody.keySet().contains("username")){
            roomToUse.setUserSession(session);
        } else if (messageBody.keySet().contains("answer") && messageBody.keySet().contains("username")) {
            roomToUse.getSessions().add(session);
            if(roomToUse.getUserSession() != null && roomToUse.getUserSession().isOpen()){
                roomToUse.getUserSession().sendMessage(message);
            }
        } else if (messageBody.keySet().contains("answer")) {
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
