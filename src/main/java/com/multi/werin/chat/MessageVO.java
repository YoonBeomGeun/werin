package com.multi.werin.chat;

public class MessageVO {
	private int message_id;
	private int room_id;
	private String message_receiver;
	private String message_sender;
	private String message_content;
	private String message_sent_at;

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getMessage_receiver() {
		return message_receiver;
	}

	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}

	public String getMessage_sender() {
		return message_sender;
	}

	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public String getMessage_sent_at() {
		return message_sent_at;
	}

	public void setMessage_sent_at(String message_sent_at) {
		this.message_sent_at = message_sent_at;
	}

	@Override
	public String toString() {
		return "MessageVO [message_id=" + message_id + ", room_id=" + room_id + ", message_receiver=" + message_receiver
				+ ", message_sender=" + message_sender + ", message_content=" + message_content + ", message_sent_at="
				+ message_sent_at + "]";
	}

}
