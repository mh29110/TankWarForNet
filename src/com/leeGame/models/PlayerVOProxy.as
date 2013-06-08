package com.leeGame.models
{
	import com.leeGame.models.data.PlayerVo;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class PlayerVOProxy extends Proxy
	{
		public static const NAME:String = "player vo proxy";
		public static var CHANGEDIR:String = "change dir";
		public function PlayerVOProxy(proxyName:String=null, data:Object=null)
		{
			super(NAME, new PlayerVo());
		}
		
		
		public function setDir(dir:int):void
		{
			playerVo.dir = dir;
			sendNotification(CHANGEDIR);
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
		
		override public function setData(data:Object):void
		{
			// TODO Auto Generated method stub
			super.setData(data);
		}
		
	}
}