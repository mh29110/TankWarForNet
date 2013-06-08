package com.leeGame.views
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * 主角视图代理 
	 * 侦听 MyTankerProxy 数据的变化：如转向，
	 * 侦听玩家控制 如键盘事件
	 * 
	 * @author leejia
	 * 
	 */
	public class MyTankerMediator extends Mediator
	{
		public static const NAME:String = "mytanker mediator name";
		public function MyTankerMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		override public function getViewComponent():Object
		{
			// TODO Auto Generated method stub
			return super.getViewComponent();
		}
		
		override public function handleNotification(notification:INotification):void
		{
			super.handleNotification(notification);
		}
		
		override public function listNotificationInterests():Array
		{
			return super.listNotificationInterests();
		}
		
		override public function onRemove():void
		{
			super.onRemove();
		}
		
	}
}