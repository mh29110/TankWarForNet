package com.leeGame.managers
{
	import com.leeGame.views.components.GameView;
	import com.leeGame.views.components.LoginView;
	
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import com.leeGame.views.components.EndView;

	public class ScreenManager
	{
		public static const WELCOMESCREEN:String = "welcome screen";
		public static const ENDSCREEN:String = "gameover screen";
		public static const GAMEVIEW:String = "gameover screen";
		
		private var nav:ScreenNavigator;
		
		private var welcome:ScreenNavigatorItem;
		private var game:ScreenNavigatorItem;
		private var end:ScreenNavigatorItem;
		
		public function ScreenManager()
		{
			nav = Global._navigator = new ScreenNavigator();
			Global._stage.addChild(nav);
			
			
			
			addScreens();
		}
		
		private function addScreens():void
		{
			welcome = new ScreenNavigatorItem(LoginView,{completed:follow});
			nav.addScreen(WELCOMESCREEN,welcome);
			
			game = new ScreenNavigatorItem(GameView,{completed:follow});
			nav.addScreen(GAMEVIEW,game);
			
			end = new ScreenNavigatorItem(new EndView,{});
			
			nav.showScreen(WELCOMESCREEN);
			
			function  follow():void{
				trace("gameview initialize");
			}
		}
	}
}