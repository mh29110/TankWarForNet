package com.leeGame.controllers
{
	import com.leeGame.models.DataProxy;
	import com.leeGame.models.LoginProxy;
	import com.leeGame.models.PlayerVOProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class InitModelCommand extends SimpleCommand
	{
		public function InitModelCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			super.execute(notification);
			facade.registerProxy(new LoginProxy(LoginProxy.NAME));
			facade.registerProxy(new DataProxy());
			facade.registerProxy(new PlayerVOProxy());
		}
		
	}
}