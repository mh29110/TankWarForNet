package com.leeGame.controllers
{
	import com.leeGame.models.LoginProxy;
	import com.leeGame.models.data.LoginVo;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class LoginTryCommand extends SimpleCommand
	{
		public static const NAME:String = "try login command";
		public function LoginTryCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			super.execute(notification);
			var loginProxy:LoginProxy = facade.retrieveProxy(LoginProxy.NAME) as LoginProxy;
			loginProxy.login(notification.getBody() as LoginVo);
		}
		
	}
}