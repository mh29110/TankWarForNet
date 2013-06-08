package com.leeGame.views
{
	import com.leeGame.views.components.GameView;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class GameViewMediator extends Mediator
	{
		public static var NAME:String = "game view mediator name";
		public function GameViewMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			
			
		}
		
		public function get gameView():GameView
		{
			return super.getViewComponent() as GameView;
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
		
		override public function onRemove():void
		{
			super.onRemove();
			
			if(gameView.parent){
				gameView.parent.removeChild(gameView);
			}
		}
		
	}
}