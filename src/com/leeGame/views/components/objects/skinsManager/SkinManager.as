package com.leeGame.views.components.objects.skinsManager
{
	import com.leeGame.config.Config;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	
	/**
	 *自己制作的皮肤，使用像素copy 
	 * @author Administrator
	 * 
	 */
	public class SkinManager extends BasicSkin
	{
		private var src :Texture;
		
		
		private var objSkin:Image  ;
		private  var bmpd :Texture  ;
		private var i :int = 1;
		private   var timer:Timer ;
		private var p :Point  ;
		private var skinIndex :int =0 ;//使用传参来制作皮肤，0代表源图第一行坦克，1代表源图第二行坦克
		
		public function SkinManager(skin_index:int =1 )
		{
			p= new Point(0,0);
			skinIndex = skin_index;
			src= Main.assets.getTexture("superman");//源位图
			switch (skinIndex)//万恶的源图排序混乱，只能单个表示，最好排序并用编号提出，避免写SWITCH；
			{
				case 1:
					bmpd = Texture.fromTexture(src ,new Rectangle(32,32,32,32));
					break;
				case Config.STONE:
					bmpd = Texture.fromTexture(src ,new Rectangle(32*3,3*32,32,32));
					break;
				case Config.BACK:
					bmpd = Texture.fromTexture(src ,new Rectangle(32*0,0*32,32,32));
					break;
				case Config.ADDSPEED://6
					bmpd = Texture.fromTexture(src ,new Rectangle(32*6,2*32,32,32));
					break;//因为漏打了这个BREAK；导致皮肤叠加，修BUG了一下午
				case Config.BLOOD://7
					bmpd = Texture.fromTexture(src ,new Rectangle(32*3,2*32,32,32));
					break;
				case Config.DISAPPEAR ://8隐身道具
					bmpd = Texture.fromTexture(src ,new Rectangle(32*1,0*32,32,32));
					break;
				case Config.SHOOT://9疾射道具
					bmpd = Texture.fromTexture(src ,new Rectangle(32*4,2*32,32,32));
					break;
			}
			objSkin= new Image(bmpd);
			addChild(objSkin);
			
			
			
		}
		override public function clear():void
		{
			
		}
	}
}

