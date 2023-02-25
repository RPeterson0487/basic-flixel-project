package;

import flixel.FlxSprite;

class ControllableHero extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		makeGraphic(30, 20, 0xD4AF37);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
