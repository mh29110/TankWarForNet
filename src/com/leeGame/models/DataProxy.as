package com.leeGame.models
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class DataProxy extends Proxy
	{
		public static var NAME:String  = "data proxy name ";
		public function DataProxy(proxyName:String=null, data:Object=null)
		{
			super(NAME, data);
		}
		
	}
}