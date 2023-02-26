package;

import flixel.FlxG;
import flixel.FlxSprite;

/**
	A single ControllableHero sprite that moves by pusing the arrow keys on the
	keyboard.
**/
class ControllableHero extends FlxSprite
{
	/**
		The set width of the controllable hero.
	**/
	static var CHWIDTH:Int = 20;

	/**
		The set height of the controllable hero.
	**/
	static var CHHEIGHT:Int = 20;

	/**
		The set color of the controllable hero.
	**/
	static var CHCOLOR = 0xFFD4AF37;

	/**
		The controllable hero's speed
	**/
	static var CHSPEED = 50;

	/**
		Creates a Controllable Hero at a specified position. Color of the hero
		is specified in makeGraphic's Color property.
		@param	xPos	The initial x position of the hero.
		@param	yPos	The initial y position of the hero.
	**/
	public function new(xPos:Float = 0, yPos:Float = 0)
	{
		super(xPos, yPos);

		makeGraphic(CHWIDTH, CHHEIGHT, CHCOLOR);
	}

	/**
		Directional movement is handled in ControllableHero's update function.
		When a directional key is pressed, the hero will move in that direction
		and when no key is pressed, the hero stops moving.
		Speed is controlled individually through velocity.x and velocity.y.
	**/
	override function update(elapsed:Float)
	{
		if (FlxG.keys.pressed.UP)
		{
			velocity.y = CHSPEED * -1;
		}
		else if (FlxG.keys.pressed.DOWN)
		{
			velocity.y = CHSPEED;
		}
		else if (FlxG.keys.pressed.LEFT)
		{
			velocity.x = CHSPEED * -1;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			velocity.x = CHSPEED;
		}
		else
		{
			velocity.x = 0;
			velocity.y = 0;
		}

		super.update(elapsed);
	}
}
