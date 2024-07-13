//enuem for conetion
enum SocketStatus { connecting, connected, disconnected, error }

enum SocketEvents {
  CONNECT,
  DISCONNECT,
  JOIN_CHAT,
  LEAVE_CHAT,
  SEND_MESSAGE,
  RECEIVE_MESSAGE,
  UPDATE_GROUP,
  NEW_CHAT,
  TYPING,
  STOPE,
  _TYPING,
  onlineUsers,
  notification
}

extension SocketEventsExtension on SocketEvents {
  String get value {
    switch (this) {
      case SocketEvents.CONNECT:
        return "connected";
      case SocketEvents.DISCONNECT:
        return 'disconnect';
      case SocketEvents.JOIN_CHAT:
        return 'joinChat';
      case SocketEvents.LEAVE_CHAT:
        return 'leaveChat';
      case SocketEvents.SEND_MESSAGE:
        return 'messageReceived';
      case SocketEvents.RECEIVE_MESSAGE:
        return 'messageReceived';
      case SocketEvents.UPDATE_GROUP:
        return 'update_group';
      case SocketEvents.NEW_CHAT:
        return 'new_chat';
      case SocketEvents.TYPING:
        return 'typing';
      case SocketEvents.STOPE:
        return 'stope';
      case SocketEvents._TYPING:
        return '_typing';
      case SocketEvents.onlineUsers:
        return 'onlineUsers';
      case SocketEvents.notification:
        return 'notification';
      default:
        throw Exception('Unknown SocketEvent: $this');
    }
  }
}
