package com.leeGame.models
{
	import com.leeGame.models.data.LoginVo;
	import com.leeGame.netBusiness.ClientSocket;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class LoginProxy extends Proxy
	{
		public static const NAME:String = "login proxy name ";
		public function LoginProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
		}
		
		public function login(vo:LoginVo):void
		{
			data = vo;
trace(data.name);
/* 申请登录*/
			ClientSocket.getInstance().sendMessage(10001,vo);
		}
	}
}