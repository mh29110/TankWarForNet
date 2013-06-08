package com.leeGame.controllers
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	
	public class LoginResultCommand implements ICommand
	{
		public static const NAME:String = "the result of login event";
		public function LoginResultCommand()
		{
		}
		
		public function execute(notification:INotification):void
		{
			if(notification.getBody().result == 0){
trace("登录失败");
			}else{
trace("login success!");
			}
		}
	}
}