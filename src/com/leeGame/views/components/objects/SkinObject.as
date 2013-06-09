package com.leeGame.views.components.objects
{
	import com.leeGame.config.Config;
	
	import flash.geom.Matrix;
	import com.leeGame.views.components.objects.skinsManager.BasicSkin;
	
	/**
	 *给对象上皮肤 与血量等显示 
	 * @author Administrator
	 * 
	 */
	public class SkinObject extends BasicObject
	{
		
		protected var _hp:int  = 5;//血量
		protected var _dir:uint = 0;
		public static const UP :uint = 87;
		public static const RIGHT:uint = 68;
		public static const DOWN :uint = 65;
		public static const LEFT :uint = 83;
		private var _skin:BasicSkin;
		
		public function SkinObject(skin:BasicSkin)
		{
			_skin = skin;
			addChild(_skin);
		}
		
		 public function set dir(direction :uint ):void
		{
			_dir = direction;
			var angle:Number;
			var tx :Number;
			var ty :Number;
			switch(_dir)//原图是向上的
			{	
				case UP:
					angle = 0;
					tx = 0;
					ty = 0;
					break;
				case LEFT:
					angle= Math.PI/2*-1;
					tx = 0;
					ty = Config.LEN;
					break;
				case RIGHT :
					angle = Math.PI/2;
					tx = Config.LEN;
					ty = 0;
					break;
				case DOWN:
					angle = Math.PI;
					tx = Config.LEN;
					ty = Config.LEN;
					break;
			}
			_skin.transformationMatrix = new Matrix(Math.cos(angle), Math.sin(angle),Math.sin(angle)*-1,Math.cos(angle),tx,ty);//这个公式
		}
		 public function get dir():uint
		 {
			 return _dir;
		 }

		public function set hp(val:int):void
		{
			_hp= val;
			if(_hp>5)
				_hp=5;
		}
		public function get hp ():int 
		{
			return _hp;
		}
		public function hurt (val:int ):void
		{
			_hp -= val;
			if(_hp <= 0) clear();
		}
	
		override public function clear():void
		{
			super.clear();
			_skin.clear();//不知是否k	
		}
	}
}
