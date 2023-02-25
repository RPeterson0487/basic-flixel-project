package;

import flixel.util.FlxSpriteUtil;
import flixel.FlxG;
import flixel.FlxSprite;

class ScreenSaverHero extends FlxSprite
{
	var speed = 50;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		makeGraphic(20, 10);
		controlVelocity();
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

		FlxSpriteUtil.screenWrap(this);

		if (FlxG.keys.pressed.LEFT)
		{
			angle -= 1;
			velocity.setPolarDegrees(speed, angle);
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			angle += 1;
			velocity.setPolarDegrees(speed, angle);
		}
		else if (FlxG.keys.pressed.UP)
		{
			speed += 1;
			velocity.setPolarDegrees(speed, angle);
		}
		else if (FlxG.keys.pressed.DOWN)
		{
			speed -= 1;
			velocity.setPolarDegrees(speed, angle);
		}

		super.update(elapsed);
	}

	function controlVelocity()
	{
		angle = FlxG.random.float(0, 359);
		velocity.setPolarDegrees(speed, angle);
	}
}
