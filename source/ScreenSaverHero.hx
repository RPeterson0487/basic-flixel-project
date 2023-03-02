package;

import flixel.util.FlxSpriteUtil;
import flixel.FlxG;
import flixel.FlxSprite;

/**
	Creates a ScreenSaverHero sprite at a given location is pointed and moving
	in a random direction from the start point at a set speed. As the sprite
	moves through the field, its color changes based on its location. Speed and
	direction are contollable by the keyboard arrow keys.
**/
class ScreenSaverHero extends FlxSprite
{
	/**The Width of the ScreenSaverHero sprite.**/
	static inline var SSHWIDTH = 20;

	/**The length of the ScreenSaverHero sprite.**/
	static inline var SSHHEIGHT = 10;

	/** The speed  of the ScreenSaverHero sprite.**/
	var speed = 50;

	public function new(xPos:Float = 0, yPos:Float = 0)
	{
		super(xPos, yPos);
		makeGraphic(SSHWIDTH, SSHHEIGHT);
		startVelocity();
	}

	override function update(elapsed:Float)
	{
		rainbowRegion();
		FlxSpriteUtil.screenWrap(this);
		velocityControl();
		super.update(elapsed);
	}

	/**
		Starting velocity is controlled by the class level speed variable and a
		ranomly determined direction.
	**/
	private function startVelocity()
	{
		angle = FlxG.random.float(0, 359);
		velocity.setPolarDegrees(speed, angle);
	}

	/**
		Color is determined by the ScreenSaverHero sprite's X coordinate in a
		region based on the play screen divided by the colors in the array of
		colors.
	**/
	private function rainbowRegion()
	{
		var colors = [0xFF0000, 0xFF7F00, 0xFFFF00, 0x00FF00, 0x0000FF, 0x4B0082, 0x9400D3];
		var region = Std.int(Math.min(x / (FlxG.width / colors.length), colors.length - 1));
		color = colors[region];
	}

	/**
		Speed and direction are controlled by the keyboard arrow keys. UP and
		DOWN increase and decrease the speed, including in reverse. LEFT and
		RIGHT rotate the ScreenSaverHero sprite counter clockwise and Clockwise,
		which also changes its direction of movement.
	**/
	private function velocityControl()
	{
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
	}
}
