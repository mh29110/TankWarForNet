package com.leeGame.views
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class AppMediator extends Mediator implements IMediator
	{
		public static const Name:String  = "app mediator";
		public function AppMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			configUI();
			load();
		}
		
		private function configUI():void
		{
			
		}
		
		/**
		 * 载入 地图和玩家 并 注册
		 * 
		 */
		private function load():void
		{
			
		}
		
		public function get appMain():Main{
			return viewComponent as Main;
		}
		
		override public function handleNotification(notification:INotification):void
		{
			// TODO Auto Generated method stub
			super.handleNotification(notification);
		}
		
		override public function listNotificationInterests():Array
		{
			// TODO Auto Generated method stub
			return super.listNotificationInterests();
		}
		
	}
}