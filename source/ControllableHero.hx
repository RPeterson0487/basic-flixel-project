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
		drag.x = drag.y = 800;
	}

	override function update(elapsed:Float)
	{
		movement();

		super.update(elapsed);
	}

	private function movement()
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = FlxG.keys.anyPressed([UP]);
		down = FlxG.keys.anyPressed([DOWN]);
		left = FlxG.keys.anyPressed([LEFT]);
		right = FlxG.keys.anyPressed([RIGHT]);

		if (up && down)
		{
			up = down = false;
		}
		if (left && right)
		{
			left = right = false;
		}

		if (up || down || left || right)
		{
			var newAngle:Float = 0;
			if (up)
			{
				newAngle = -90;
				if (left)
				{
					newAngle -= 45;
				}
				else if (right)
				{
					newAngle += 45;
				}
			}
			else if (down)
			{
				newAngle = 90;
				if (left)
				{
					newAngle += 45;
				}
				else if (right)
				{
					newAngle -= 45;
				}
			}
			else if (left)
			{
				newAngle = 180;
			}
			else if (right)
			{
				newAngle = 0;
			}
			velocity.setPolarDegrees(CHSPEED, newAngle);
		}
	}
}
