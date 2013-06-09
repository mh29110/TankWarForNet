package com.leeGame.models
{
	
	import com.leeGame.models.data.BulletVo;
	import com.leeGame.views.components.objects.Bullet;
	import com.leeGame.views.components.objects.skinsManager.SkinManager;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class BulletsProxy extends Proxy implements IProxy {
		
		public static const NAME:String = "BulletProxy";
		
		public static const CREATANEWBULLET:String = "creat_a_new_bullet";
		public static const BULLETMOVE:String = "bullet_move";
		public static const COLLISION:String = "collsion";
		
		public var time:Timer = new Timer(17);
		//存放从对象池中拿出的子弹
		public var currentBullet:Array = [];
		
		public function BulletsProxy( data:Object=null) {
			super(NAME, data);
			time.start();
			time.addEventListener(TimerEvent.TIMER, onTime);
		}
		
		//控制所有的子弹
		public function onTime(e:TimerEvent):void {
			sendNotification(BULLETMOVE);
			for (var i:int = 0; i < currentBullet.length; i++) {
				//发送移动信息
				
				//发送与坦克判断信息
//				sendNotification(TankWarFacade.BULLETHITTANK, currentBullet[i]);
				//发送与障碍物碰撞信息
//				sendNotification(TankWarFacade.BULLETHITOBSTACLE, currentBullet[i]);
				//移除屏幕/与屏幕边缘碰撞
//				if (currentBullet[i].x < 0 || currentBullet[i].x > 900 || currentBullet[i].y < 0 || currentBullet[i] > 600) {
//					sendNotification(COLLISION, currentBullet[i]);
//					currentBullet.splice(i, 1);
//					break;
//				}
			}
			
		}
		
		//生成子弹
		public function creatBullet(_obj:Object):void {
			var  bulletVo:BulletVo = new BulletVo();
			currentBullet.push(bulletVo);
			bulletVo.x = _obj.x;
			bulletVo.y = _obj.y; 
			bulletVo.dir = _obj.dir;
			//发送创建一个子弹信息
			sendNotification(CREATANEWBULLET, bulletVo);
		}
		
	}
}