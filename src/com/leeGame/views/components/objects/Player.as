package com.leeGame.views.components.objects
{
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.utils.Timer;
	import com.leeGame.views.components.objects.skinsManager.BasicSkin;
	
	public class Player extends SkinObject
	{
		public static  var GOOD:int = 1;
		public function Player(skin:BasicSkin)
		{
			super(skin);
			this.part = GOOD;
		}
	
	}
}


