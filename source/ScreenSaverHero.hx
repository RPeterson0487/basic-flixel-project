package;

import flixel.util.FlxSpriteUtil;
import flixel.FlxG;
import flixel.FlxSprite;

/**
	A random number of ScreenSaverHero sprites that start facing a random
	direction and move around the screen. The speed and rotation of the sprites
	are changed by pressing the arrow keys on the keyboard. Pressing up or down
	increases and decreases the speed of the sprites, including going in
	reverse. Pressing the left and right arrow keys turns the sprites left or
	right. When a sprite reaches the edge of the playing screen, it wraps to the
	opposite side of the screen.
**/
class ScreenSaverHero extends FlxSprite
{
	/**
		The set width of the sprite.
	**/
	static inline var SSHWIDTH = 20;

	/**
		The set height of the sprite.
	**/
	static inline var SSHHEIGHT = 10;

	/**
		The current speed of all of the ScreenSaverHero sprites on the board.
		Speed is controlled by the up and down arrow keys.
	**/
	var speed = 50;

	/**
		Creates a random number of ScreenSaverHero sprites. Speed and direction
		are controlled through the controlVelocity function.
		@param	xPos	The initial x position of the sprite.
		@param	yPos	The initial y position of the sprite.
	**/
	public function new(xPos:Float = 0, yPos:Float = 0)
	{
		super(xPos, yPos);

		makeGraphic(SSHWIDTH, SSHHEIGHT);
		startVelocity();
	}

	/**
		The color, speed, and direction of the sprites are controlled through
		the update function. The color of each individual sprite is dependant
		on its x coordinate on the playing screen. The speed and direction of
		all of the sprites are changed through the keyboard arrow keys.
	**/
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

	/**
		Controls the starting speed and direction (and rotation) of each sprite.
	**/
	function startVelocity()
	{
		angle = FlxG.random.float(0, 359);
		velocity.setPolarDegrees(speed, angle);
	}
}
