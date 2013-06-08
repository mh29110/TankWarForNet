package
{
	import avmplus.getQualifiedClassName;
	
	import com.leeGame.asssets.Assets;
	import com.leeGame.config.CommandName;
	import com.leeGame.managers.ScreenManager;
	import com.leeGame.netBusiness.ClientSocket;
	
	import feathers.controls.Button;
	import feathers.controls.ScreenNavigator;
	import feathers.themes.AeonDesktopTheme;
	
	import flash.filesystem.File;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	import starling.utils.AssetManager;
	
	public class Main extends Sprite
	{
		public  var VERSION:String = "0.0.0";
		
		
		public function Main()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onInit);
		}
		
		protected var theme:AeonDesktopTheme;//feathers 主题
		
		public static var assets:AssetManager;
		
		private function onInit(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onInit);
			
			/*initialize feathers theme!*/
			this.theme = new AeonDesktopTheme(this.stage);
			
			/* screens navigator */
			
			
			/* assets manager */
			assets = new AssetManager();
			assets.verbose = true ;
			assets.enqueue(	"superman.jpg");
			assets.loadQueue(function(ratio:Number):void{//侦听下载比例
				trace(ratio);
				if(ratio == 1){
					trace("load complete");
				}
			}
			);
			
			/*initialize pureMvc frameWork*/
			MyFacade.getInstance().startUp(this);
			
			/* socket*/
			ClientSocket.getInstance().connect();
			
			
			
			
		}
	}
}