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
		public static const UP :uint = 1;
		public static const RIGHT:uint = 2;
		public static const DOWN :uint = 3;
		public static const LEFT :uint = 4;
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
		 public var speed:int = 3;
		 /**
		  *移动 
		  * 
		  */
		 public function move( ):void
		 {
			 if(!nextCanMove()) return;
			 switch(_dir)
			 {
				 case UP:
					 this.y-=speed;
					 break;
				 case DOWN:
					 this.y +=speed;					
					 break;
				 case LEFT:
					 this.x -=speed;					
					 break;
				 case RIGHT:
					 this.x +=speed;					
					 break;
				 default:
					 break;
			 }
		 }
		 
		 public function nextCanMove():Boolean
		 {
			 var nx :Number =x ;
			 var ny :Number =y;
			 switch(_dir)
			 {
				 case UP:
					 ny-=speed;
					 break;
				 case DOWN:
					 ny +=speed;
					 break;
				 case LEFT:
					 nx -=speed;
					 break;
				 case RIGHT:
					 nx +=speed;
					 break;
				 default:
					 break;
			 }
			 //ny 不能进入标题部分
			 if(nx<0||ny<32||nx>Global._stage.stageWidth-32||ny>Global._stage.stageHeight-32)
			 {
				 return false;
			 }
//			 for each (var obj :BasicObject in Global._scene.allObject)//重点：对所有对象检测碰撞
//			 {
//				 if(!obj.canHit||obj==this) continue;//循环到自己，或者循环到不可以碰撞的单位，跳出循环
//				 for each (var p:Array in hitPointArr)
//				 {
//					 //					if(obj.hitTestObject(this))//如果重叠了可以移动；
//					 //					{return true;}
//					 //					else 
//					 if(obj.hitTestPoint(p[0]+nx,p[1]+ny,true))
//					 { return false;}
//				 }
//			 }
			 return true;
			 
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
