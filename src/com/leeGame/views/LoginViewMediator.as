package com.leeGame.views
{
	import com.leeGame.controllers.LoginResultCommand;
	import com.leeGame.controllers.LoginTryCommand;
	import com.leeGame.models.data.LoginVo;
	import com.leeGame.views.components.LoginView;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class LoginViewMediator extends Mediator
	{
		public static const NAME:String = "login mediator name";
		public function LoginViewMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			loginView.loginBtn.addEventListener(Event.TRIGGERED,onTriggered);
		}
		
		private var loginVo:LoginVo = new LoginVo();
		private function onTriggered(event:Event):void
		{
				loginVo.name = loginView.nameTxt.text;
				sendNotification(LoginTryCommand.NAME,loginVo);
		}
		
		/**
		 * 覆盖提取方法 
		 * @return 
		 * 
		 */
		public function get loginView():LoginView
		{
			return super.getViewComponent() as LoginView;
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName()){
				case LoginResultCommand.NAME:
					if(notification.getBody().result == 1){
						trace("视图改变，登录成功");
						facade.removeMediator(NAME);
					}else{
						trace("视图改变，登录失败");
					}
					break;
			}
		}
		
		override public function listNotificationInterests():Array
		{
			return [LoginResultCommand.NAME];
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			
			if(loginView.parent){
				loginView.parent.removeChild(loginView);
			}
		}
		
	}
}