package
{
	import avmplus.getQualifiedClassName;
	
	import com.leeGame.asssets.Assets;
	import com.leeGame.config.CommandName;
	
	import feathers.controls.Button;
	import feathers.themes.AeonDesktopTheme;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	
	public class Main extends Sprite
	{
		public  var VERSION:String = "0.0.0";
		
		
		public function Main()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onInit);
		}
		
		protected var theme:AeonDesktopTheme;//feathers 主题
		
		private function onInit(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onInit);
			
			/*initialize feathers theme!*/
			this.theme = new AeonDesktopTheme(this.stage);
			
			
			/*initialize pureMvc frameWork*/
			MyFacade.getInstance().startUp(this);
			
			var img:Image = new Image(Assets.getTexture("BallGround"));
			addChild(img);
		}
	}
}