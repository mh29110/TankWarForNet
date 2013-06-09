package com.leeGame.controllers
{
	import com.leeGame.views.AppMediator;
	import com.leeGame.views.BulletsMediator;
	import com.leeGame.views.LoginViewMediator;
	import com.leeGame.views.components.LoginView;
	
	import org.osmf.logging.Log;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class InitViewCommand extends SimpleCommand
	{
		public static const INITVIEWCOMMAND:String = "init view command";
		public function InitViewCommand()
		{
			super();
		}
		/**
		 * @param notification
		 *  
		 */
		override public function execute(notification:INotification):void 
		{
			var main:Main = notification.getBody() as Main;
			facade.registerMediator(new AppMediator(AppMediator.Name,main));
trace((facade.retrieveMediator(AppMediator.Name).getViewComponent() as Main).VERSION);


			


			var login:LoginView = new LoginView();
			main.stage.addChild(login);
			facade.registerMediator(new LoginViewMediator(LoginViewMediator.NAME,login));
			
		}
	}
}