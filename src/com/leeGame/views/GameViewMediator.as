package com.leeGame.views
{
	import com.leeGame.models.BulletsProxy;
	import com.leeGame.models.PlayerVOProxy;
	import com.leeGame.models.data.PlayerVo;
	import com.leeGame.views.components.GameView;
	import com.leeGame.views.components.objects.Bullet;
	import com.leeGame.views.components.objects.Player;
	import com.leeGame.views.components.objects.SkinObject;
	import com.leeGame.views.components.objects.skinsManager.SkinManager;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.TouchEvent;
	
	public class GameViewMediator extends Mediator
	{
		public static var NAME:String = "game view mediator name";
		public function GameViewMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			
			configUI();
		}
		
		private function configUI():void
		{
			facade.registerProxy(new BulletsProxy());
			gameView.stage.addEventListener(KeyboardEvent.KEY_DOWN,_keydown);
			gameView.stage.addEventListener(KeyboardEvent.KEY_UP,_keyUp);
			
			var playerVo:PlayerVo = new PlayerVo();
			var player:Player = new Player(new SkinManager(SkinManager.PLAYER));
			player.x = playerVo.x = 400;
			player.y = playerVo.y = 400;
			gameView.addChild(player);
			facade.registerProxy(new PlayerVOProxy(PlayerVOProxy.NAME,playerVo));
			
			
			
			facade.registerMediator(new MyTankerMediator(MyTankerMediator.NAME,player));
			
		}
		
		private var keyCodeArr : Array=[];//移动优化数组、或许有更好的解决方式
		private function _keydown(e:KeyboardEvent):void
		{
			trace(e.keyCode, String.fromCharCode(e.charCode));
			
			if(keyCodeArr.indexOf(e.keyCode)==-1)
			{
				keyCodeArr.push(e.keyCode);
			}
			
			var playerProxy:PlayerVOProxy = facade.retrieveProxy(PlayerVOProxy.NAME) as PlayerVOProxy;
			var dir:int = 0;
			switch(e.keyCode){
				case 65:
					dir = SkinObject.LEFT;
					playerProxy.setDir(dir);
					break;
				case 87:
					dir = SkinObject.UP;
					playerProxy.setDir(dir);
					break;
				case 68:
					dir = SkinObject.RIGHT;
					playerProxy.setDir(dir);
					break;
				case 83:
					dir = SkinObject.DOWN;
					playerProxy.setDir(dir);
					break;
				case 32:
					(facade.retrieveProxy(BulletsProxy.NAME) as BulletsProxy).creatBullet(playerProxy.playerVo);
					break;
				case 74:
					(facade.retrieveProxy(BulletsProxy.NAME) as BulletsProxy).creatBullet(playerProxy.playerVo);
					break;
				
			}
			
		}
		
		protected function _keyUp(e:KeyboardEvent):void
		{
//			var playerProxy:PlayerVOProxy = facade.retrieveProxy(PlayerVOProxy.NAME) as PlayerVOProxy;
//			keyCodeArr.splice(keyCodeArr.indexOf(e.keyCode),1);	
//			
//			var codeArr:Array = [65,87,83,68]
//			if(keyCodeArr.length>0&&codeArr.indexOf(e.keyCode)!=-1)
//			{	
//				playerProxy.setDir(keyCodeArr[keyCodeArr.length-1]);//会导致dir异常，坦克消失
//				if(keyCodeArr.length==0||(keyCodeArr.length==1)&&keyCodeArr[0]==74)//参入其他键位后会停止不了。。问题
//				{
////					playervo.moving = false;
//				}
//			}else if(e.keyCode == 74)
//			{//******采用状态开关控制射击，而非检测按键，这样可以使得 方向键与射击键独立开来；***********
////				self .shootBoolean  = false;
//			}
			
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
			return [];
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