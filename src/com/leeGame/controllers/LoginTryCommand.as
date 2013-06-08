package com.leeGame.controllers
{
	import com.leeGame.models.LoginProxy;
	import com.leeGame.models.data.LoginVo;
	import com.leeGame.views.AppMediator;
	import com.leeGame.views.LoginViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import starling.display.Image;
	
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
			
			
			
			var img:Image = new Image(Main.assets.getTexture("superman"));
			img.x = img.y = 200;
			facade.retrieveMediator(AppMediator.Name).getViewComponent().addChild(img);
		}
		
	}
}