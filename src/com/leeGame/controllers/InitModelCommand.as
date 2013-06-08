package com.leeGame.controllers
{
	import com.leeGame.models.DataProxy;
	import com.leeGame.models.LoginProxy;
	
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
		}
		
	}
}