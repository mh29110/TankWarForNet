package
{
	import com.leeGame.config.CommandName;
	import com.leeGame.controllers.InitViewCommand;
	import com.leeGame.controllers.LoginTryCommand;
	import com.leeGame.controllers.StartUpCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class MyFacade extends Facade implements IFacade
	{
		public function MyFacade()
		{
			
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(CommandName.STARTUPCOMMAND,StartUpCommand);
			registerCommand(InitViewCommand.INITVIEWCOMMAND,InitViewCommand);
			registerCommand(LoginTryCommand.NAME,LoginTryCommand);
		}
		public static function getInstance():MyFacade{
			if(instance == null){
				instance = new MyFacade();
			}
			return instance as MyFacade;
		}
		public function startUp(main:Main):void{
			sendNotification(CommandName.STARTUPCOMMAND,main);
		}
		
	}
}