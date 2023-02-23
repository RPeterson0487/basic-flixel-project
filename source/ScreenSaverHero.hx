package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class ScreenSaverHero extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		makeGraphic(20, 10);
	}

	override function update(elapsed:Float)
	{
		if (x >= 0 && x < 91)
			color = 0xFF0000;
		else if (x >= 91 && x < 182)
			color = 0xFF7F00;
		else if (x >= 182 && x < 273)
			color = 0xFFFF00;
		else if (x >= 273 && x < 364)
			color = 0x00FF00;
		else if (x >= 364 && x < 455)
			color = 0x0000FF;
		else if (x >= 455 && x < 546)
			color = 0x4B0082;
		else
			color = 0x9400D3;

		super.update(elapsed);
	}
}
