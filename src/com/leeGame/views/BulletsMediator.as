package com.leeGame.views
{
	import com.leeGame.models.BulletsProxy;
	import com.leeGame.views.components.GameView;
	import com.leeGame.views.components.objects.Bullet;
	import com.leeGame.views.components.objects.SkinObject;
	import com.leeGame.views.components.objects.skinsManager.SkinManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class BulletsMediator extends Mediator implements IMediator
	{
		public static var NAME:String = "bullets mediator by  main";
		public var bulletArr:Array = [];
		public function BulletsMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get gameView():GameView
		{
			return super.getViewComponent() as GameView;
		}
		
		override public function handleNotification(notification:INotification):void
		{
			super.handleNotification(notification);
			switch(notification.getName()){
				case BulletsProxy.CREATANEWBULLET:
					var bullet:Bullet = new Bullet(new SkinManager(7));
					bullet.x = notification.getBody().x;
					bullet.y = notification.getBody().y;
					bullet.dir = notification.getBody().dir;
					gameView.addChild(bullet);
					bulletArr.push(bullet);
					break;
				case BulletsProxy.BULLETMOVE:
					for (var i:int = 0; i < bulletArr.length; i++) 
					{
						bulletArr[i].move();
					}
					break;
				
			}
		}
		
		override public function listNotificationInterests():Array
		{
			return [BulletsProxy.CREATANEWBULLET,
				BulletsProxy.BULLETMOVE];
		}
		
		override public function onRemove():void
		{
			// TODO Auto Generated method stub
			super.onRemove();
		}
		
	}
}