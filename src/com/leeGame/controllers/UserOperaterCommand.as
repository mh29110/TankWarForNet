package com.leeGame.controllers
{
	import com.leeGame.models.PlayerVOProxy;
	import com.leeGame.models.data.PlayerVo;
	import com.leeGame.views.components.objects.SkinObject;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class UserOperaterCommand extends SimpleCommand implements ICommand
	{
		public static var NAME:String = "user controller command";
		public function UserOperaterCommand()
		{
		}
		
		override public function execute(notification:INotification):void
		{
			var playerProxy:PlayerVOProxy = facade.retrieveProxy(PlayerVOProxy.NAME) as PlayerVOProxy;
			var dir:int = 0;
			switch(notification.getBody() as int){
				case 65:
					dir = SkinObject.LEFT;
					break;
				case 87:
					dir = SkinObject.UP;
					break;
				case 68:
					dir = SkinObject.RIGHT;
					break;
				case 83:
					dir = SkinObject.DOWN;
					break;
			}
			playerProxy.setDir(dir);
		}
	}
}