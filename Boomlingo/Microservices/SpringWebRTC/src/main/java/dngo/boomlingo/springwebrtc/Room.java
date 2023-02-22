package dngo.boomlingo.springwebrtc;

import org.springframework.web.socket.WebSocketSession;

import java.util.ArrayList;
import java.util.List;

public class Room {
    private String username;
    private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
    private WebSocketSession userSession;

    public Room(){
        username = "default";
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<WebSocketSession> getSessions() {
        return sessions;
    }

    public void setSessions(List<WebSocketSession> sessions) {
        this.sessions = sessions;
    }

    public WebSocketSession getUserSession() {
        return userSession;
    }

    public void setUserSession(WebSocketSession userSession) {
        this.userSession = userSession;
    }

    @Override
    public String toString(){
        StringBuilder result = new StringBuilder();

        result.append("Username: ").append(username).append("\nUser session id: ");
        if(userSession != null){
            result.append(userSession.getId()).append("\nConnected sessions: ");
        }else{
            result.append("no session assigned").append("\nConnected sessions: ");
        }
        for(WebSocketSession session: sessions){
            result.append("\n").append(session.getId());
        }

        return result.toString();
    }

}
