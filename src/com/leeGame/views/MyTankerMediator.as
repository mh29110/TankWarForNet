package com.leeGame.views
{
	import com.leeGame.controllers.UserOperaterCommand;
	import com.leeGame.models.PlayerVOProxy;
	import com.leeGame.views.components.objects.Player;
	
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
		
		public function get player():Player
		{
			return super.getViewComponent() as Player;
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName()){
				case PlayerVOProxy.CHANGEDIR:
					player.dir = (facade.retrieveProxy(PlayerVOProxy.NAME) as PlayerVOProxy).playerVo.dir;
					break;
			}
		}
		
		
		override public function listNotificationInterests():Array
		{
			return [PlayerVOProxy.CHANGEDIR];
		}
		
		override public function onRemove():void
		{
			super.onRemove();
		}
		
	}
}