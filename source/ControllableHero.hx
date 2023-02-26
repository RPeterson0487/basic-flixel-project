package;

import flixel.FlxG;
import flixel.FlxSprite;

class ControllableHero extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		makeGraphic(20, 20, 0xFFD4AF37);
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.pressed.UP)
			velocity.y = -50;
		else if (FlxG.keys.pressed.DOWN)
			velocity.y = 50;
		else if (FlxG.keys.pressed.LEFT)
			velocity.x = -50;
		else if (FlxG.keys.pressed.RIGHT)
			velocity.x = 50;
		else
		{
			velocity.x = 0;
			velocity.y = 0;
		}

		super.update(elapsed);
	}
}
