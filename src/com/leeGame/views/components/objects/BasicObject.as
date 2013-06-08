package com.leeGame.views.components.objects
{
	import starling.display.Sprite;
	
	public class BasicObject extends Sprite
	{
		protected var _canHit:Boolean;  //所有对象都需要碰撞开关
		
		public var part :int = 0;  //所有对象都有阵营；
		
		
		public function BasicObject()
		{
			super();
		}
		
		public function set canHit(val:Boolean):void
		{
			_canHit= val;
		}
		public function get canHit():Boolean
		{
			return _canHit;
		}
		
		/**
		 *清除自己 
		 * 
		 */
		public function clear():void
		{
//			Global._scene.removeObject(this);
		}
		/**
		 *描述基本类能做什么，空的留着给子类重写，用于游戏场景调用render方法渲染游戏；核动力 
		 * 
		 */
		public function go():void
		{
			
		}
	}
}