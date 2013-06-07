package com.leeGame.controllers
{
	import com.leeGame.views.AppMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.MacroCommand;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartUpCommand extends MacroCommand
	{
		
		
		override protected function initializeMacroCommand():void
		{
			super.initializeMacroCommand();
			addSubCommand(InitViewCommand);
			addSubCommand(InitModelCommand);
		}
		
	}
}