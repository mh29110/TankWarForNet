package com.leeGame.views.components
{
	import com.leeGame.asssets.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class GameView extends Sprite
	{
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
		}
	}
}