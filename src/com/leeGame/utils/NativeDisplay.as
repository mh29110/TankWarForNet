package com.leeGame.utils
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class NativeDisplay
	{
		public function NativeDisplay()
		{
		}
		public static function createNativeINPUTTextfield(message:String):TextField{
			var textField:TextField = new TextField(); 
			var textFormat:TextFormat = new TextFormat("Verdana", 12, 0xFFFFFF); 
			textField.defaultTextFormat = textFormat; 
			textField.type = TextFieldType.INPUT;
			textField.wordWrap = true;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.background = true;
			textField.backgroundColor = 0x440000; 
			return textField;
		}
	}
}