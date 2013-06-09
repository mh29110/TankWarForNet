package com.leeGame.views.components.objects
{
	import com.leeGame.config.Config;
	import com.leeGame.models.data.BulletVo;
	import com.leeGame.views.components.objects.skinsManager.BasicSkin;
	
	public class Bullet extends SkinObject
	{
		public function Bullet(skin:BasicSkin)
		{
			super(skin);
		}
		
		public function move():void
		{
			switch(dir)
			{
				case SkinObject.UP:
					y-=Config.SPEED;
					break;
				case SkinObject.DOWN:
					y +=Config.SPEED;					
					break;
				case SkinObject.LEFT:
					x -=Config.SPEED;					
					break;
				case SkinObject.RIGHT:
					x +=Config.SPEED;					
					break;
				default:
					break;
			}
		}
	}
}