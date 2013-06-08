package com.leeGame.netBusiness
{
	import com.leeGame.controllers.LoginResultCommand;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;

	public class ClientSocket
	{
		private var client:Socket;
		public function ClientSocket()
		{
			client = new Socket();
			addEventListeners();
		}
		
		public function connect():void{
			if (client.connected) {
				return;
			}
			
			client.connect("127.0.0.1",5566);
		}
		public function sendMessage(cmd:uint,vo:Object):void{
			/* 在家里测试时 ，先不写通信*/
			MyFacade.getInstance().sendNotification(LoginResultCommand.NAME,{result:1});
			
			if(client.connected == false){
				return ;
			}
			/* 发送数据 */
			switch (cmd){
				/* 10001 申请登录*/
				case 10001:
					trace("发送消息，申请登录");
					client.writeBoolean(true);
					client.flush();
					break;
				case 10002:
					break;
			}
			
		}
		
		/**
		 * 处理服务器返回数据 
		 * @param event
		 * 
		 */
		protected function onReceiveData(event:ProgressEvent):void
		{
			trace("ClientSocket.onReceiveData(event)");
			MyFacade.getInstance().sendNotification(LoginResultCommand.NAME,{result:1});
		}
		
		private function addEventListeners():void
		{
			client.addEventListener(Event.CONNECT,onConnected);
			client.addEventListener(ProgressEvent.SOCKET_DATA,onReceiveData);
			client.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
			client.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
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