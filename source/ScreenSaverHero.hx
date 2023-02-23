package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class ScreenSaverHero extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		makeGraphic(20, 10);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
