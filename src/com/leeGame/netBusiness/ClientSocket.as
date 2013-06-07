package com.leeGame.netBusiness
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;

	public class ClientSocket
	{
		private var clientSocket:Socket;
		public function ClientSocket()
		{
			clientSocket = new Socket();
			addEventListeners();
		}
		
		public function connect():void{
			if (clientSocket.connected) {
				return;
			}
			
			clientSocket.connect("127.0.0.1",5566);
		}
		public function sendMessage():void{
			/* 发送数据 */
			
		}
		
		/**
		 * 处理服务器返回数据 
		 * @param event
		 * 
		 */
		protected function onReceiveData(event:ProgressEvent):void
		{
			trace("ClientSocket.onReceiveData(event)");
		}
		
		private function addEventListeners():void
		{
			clientSocket.addEventListener(Event.CONNECT,onConnected);
			clientSocket.addEventListener(ProgressEvent.SOCKET_DATA,onReceiveData);
			clientSocket.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
			clientSocket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
		}
		
		private static var _instance:ClientSocket;
		public static function getInstance():ClientSocket{
			if(_instance == null){
				_instance = new ClientSocket();
			}
			return _instance;
		}
		
		protected function onSecurityError(event:SecurityErrorEvent):void
		{
			trace("ClientSocket.onSecurityError(event)");
		}
		
		protected function onIOError(event:IOErrorEvent):void
		{
			trace("ClientSocket.onIOError(event)");
		}
		
	
		
		protected function onConnected(event:Event):void
		{
			trace("ClientSocket.onConnected(event)");
		}
		
	}
}