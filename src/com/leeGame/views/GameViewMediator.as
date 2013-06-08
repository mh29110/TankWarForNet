package com.leeGame.views
{
	import com.leeGame.views.components.GameView;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import starling.events.KeyboardEvent;
	import starling.events.TouchEvent;
	
	public class GameViewMediator extends Mediator
	{
		public static var NAME:String = "game view mediator name";
		public function GameViewMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			
			gameView.stage.addEventListener(KeyboardEvent.KEY_DOWN,_keydown);
			
			gameView.addEventListener(TouchEvent.TOUCH,onTouch);
				
		}
		
		private function onTouch(e:TouchEvent):void
		{
			trace(e.data);
		}
		
		private function _keydown(e:KeyboardEvent):void
		{
			trace(e.keyCode, String.fromCharCode(e.charCode));
		}
		
		public function get gameView():GameView
		{
			return super.getViewComponent() as GameView;
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
			
			if(gameView.parent){
				gameView.parent.removeChild(gameView);
			}
		}
		
	}
}