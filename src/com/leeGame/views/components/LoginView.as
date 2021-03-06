package com.leeGame.views.components
{
	import avmplus.getQualifiedClassName;
	
	import com.leeGame.utils.NativeDisplay;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	
	public class LoginView extends Screen
	{
		public function LoginView()
		{
			super();
			initView();
		}
		public var nameTxt:TextInput;
		
		public var loginBtn:Button ;//登录按钮
		
		private function initView():void
		{
			var label:Label = new Label();
			label.x = label.y = 200;
			label.text = "Your name:";
			addChild(label);
			
			nameTxt = new TextInput();
			nameTxt.text = "Example";
			nameTxt.width = 100;
			nameTxt.height = 20;
			nameTxt.x = 280;
			nameTxt.y = 200;
			this.addChild(nameTxt);
			
			loginBtn = new Button();
			loginBtn.label = "enter";
			loginBtn.x = label.x ;
			loginBtn.y = label.y + 30;
			addChild(loginBtn);
			
		}
		
	}
}