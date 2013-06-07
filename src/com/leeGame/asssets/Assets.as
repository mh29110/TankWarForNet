package com.leeGame.asssets
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;

	public class Assets
	{
		public function Assets()
		{
		}

		
		
		[Embed(source = "basketball.png")] 
		private static const BallGround:Class;
		
		private static var sTextures:Dictionary = new Dictionary();
		public static function getTexture(name:String):Texture{
			if(Assets[name] != null){
				if(sTextures[name] == null){
					var bmp:Bitmap = new Assets[name]();
					sTextures[name] = Texture.fromBitmap(bmp);
					
				}
				return sTextures[name];
			}else throw new Error("Resource not defined.");
		}
	}
}

//		[Embed(source = "../media/textures/background.png")] 