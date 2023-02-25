package;

import flixel.FlxG;
import flixel.graphics.atlas.FlxNode;
import flixel.FlxState;
import flixel.text.FlxText;

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

		var numBars = FlxG.random.int(2, 20);
		for (i in 0...numBars)
		{
			var screenSaverHero = new ScreenSaverHero(320, 240);
			add(screenSaverHero);
		}

		var controllableHero = new ControllableHero(320, 240);
		add(controllableHero);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
