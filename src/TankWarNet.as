package
{
	import avmplus.getQualifiedClassName;
	
	import com.leeGame.managers.ScreenManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	
	import starling.core.Starling;

	[SWF(width="800",height="600",backgroundColor="0x0")]
	public class TankWarNet extends Sprite
	{
		[Embed(source="superman.jpg")]
		private var Splash:Class;
		
		private var preImg:Bitmap;
		public function TankWarNet()
		{
			/* splash image*/
			preImg = new Splash();
			addChild(preImg);
			this.loaderInfo.addEventListener(Event.COMPLETE,onInit);
		}
		private var starling:Starling;
		protected function onInit(event:Event):void
		{
			removeChild(preImg);
			trace("flash sprite initialize!");
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			starling = new Starling(Main,stage);
			starling.start();
			starling.showStats = true;
			starling.showStatsAt("right");
			Global._stage = starling.stage;
			
			stage.addEventListener(MouseEvent.CLICK,onClicked);//for test
		}
		
		protected function onClicked(event:MouseEvent):void
		{
			trace("TankWarNet.onClicked(event)::",getQualifiedClassName(event.target));
			
		}
	}
}