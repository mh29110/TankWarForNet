package com.leeGame.views.components
{
	import com.leeGame.asssets.Assets;
	import com.leeGame.views.components.objects.Player;
	import com.leeGame.views.components.objects.skinsManager.SkinManager;
	
	import feathers.controls.Screen;
	
	import starling.display.Image;
	import starling.events.Event;
	
	public class GameView extends Screen
	{
		private var obj:Player;
		public function GameView()
		{
			super();
			configUI();
		}
		
		private function configUI():void
		{
			var img:Image = new Image(Main.assets.getTexture("superman"));
			img.x = img.y = 200;
			addChild(img);
			
			var ball:Image = new Image(Assets.getTexture("BallGround"));
			ball.x = 200;ball.y = 400;
			addChild(ball);		
			
			obj = new Player(new SkinManager(1));
			addChild(obj);
			obj.x = 300;
			obj.y = 300;
			obj.dir = 2;
			obj.addEventListener(Event.ENTER_FRAME,onEnter);
		}
		
		private function onEnter(e:Event):void
		{
			trace(obj);
			obj.dir = 2;
			obj.move();
		}
	}
}