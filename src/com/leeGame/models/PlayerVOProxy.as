package com.leeGame.models
{
	import com.leeGame.models.data.PlayerVo;
	import com.leeGame.views.components.objects.SkinObject;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class PlayerVOProxy extends Proxy
	{
		public static const NAME:String = "player vo proxy";
		public static var CHANGEDIR:String = "change dir";
		private var _moving:Boolean = false;
		public static var MYPLAYERMOVE:String = " player moveing command";
		public function PlayerVOProxy(proxyName:String=null, data:Object=null)
		{
			super(NAME,data);
		}
		
		
		public function setDir(dir:int):void
		{
			playerVo.dir = dir;
			move();
			sendNotification(CHANGEDIR);
		}
		public function get dir():int
		{
			return playerVo.dir;
		}
		
		public function get playerVo():PlayerVo
		{
			return super.getData() as PlayerVo;
		}
		
		override public function onRemove():void
		{
			// TODO Auto Generated method stub
			super.onRemove();
		}
		
		public function get speed():Number{
			return playerVo.speed;
		}
		override public function setData(data:Object):void
		{
			// TODO Auto Generated method stub
			super.setData(data);
		}
		/**
		 *移动 
		 * 
		 */
		public function move( ):void
		{
			if(!nextCanMove()) return;//tobedo
			switch(dir)
			{
				case SkinObject.UP:
					playerVo.y-=speed;
					break;
				case SkinObject.DOWN:
					playerVo.y +=speed;					
					break;
				case SkinObject.LEFT:
					playerVo.x -=speed;					
					break;
				case SkinObject.RIGHT:
					playerVo.x +=speed;					
					break;
				default:
					break;
			}
			sendNotification(PlayerVOProxy.MYPLAYERMOVE);
		}
		
		public function nextCanMove():Boolean
		{
			var nx :Number = playerVo.x ;
			var ny :Number = playerVo.y;
			switch(dir)
			{
				case SkinObject.UP:
					ny-=speed;
					break;
				case SkinObject.DOWN:
					ny +=speed;
					break;
				case SkinObject.LEFT:
					nx -=speed;
					break;
				case SkinObject.RIGHT:
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

		public function get moving():Boolean
		{
			return _moving;
		}

		public function set moving(value:Boolean):void
		{
			_moving = value;
		}

		
	}
}