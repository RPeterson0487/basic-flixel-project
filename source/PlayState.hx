package;

import flixel.text.FlxText;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var myHero = new Hero(300, 300);
		add(myHero);

		var text = new flixel.text.FlxText(235, 200, 0, "Salvete, omnes!", 24);
		text.color = 0x0080FF;
		text.font = "Time New Roman";
		add(text);

		var bar = new ScreenSaverHero(50, 50);
		add(bar);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
