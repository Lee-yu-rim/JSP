package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());  //동기화 처리
	
	//클라이언트 접속 시 실행
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("웹소켓 연결 : " + session.getId());
	}
	
	//메세지를 전달 받으면 실행
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메세지 전송 : " + session.getId() + ": " + message);
		synchronized(clients) {  //메세지 전달 받는 순서 동기화 처리
			for(Session client : clients) {
				if(!client.equals(session)) {  //메세지를 보낸 본인은 제외
					client.getBasicRemote().sendText(message);  //접속 중인 모든 사람에게 메세지 전송
				}
			}
		}
	}
	
	//클라이언트와 연결이 끊기면 실행
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹소켓 연결 종료 : " + session.getId());
	}
	
	//에러 발생 시 실행
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}
}
