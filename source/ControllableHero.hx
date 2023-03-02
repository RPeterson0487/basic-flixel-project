package;

import flixel.FlxG;
import flixel.FlxSprite;

/** A single ControllableHero sprite that moves by pusing the arrow keys on the
	keyboard.**/
class ControllableHero extends FlxSprite
{
	/** The set width of the controllable hero.**/
	static var CHWIDTH:Int = 20;

	/** The set height of the controllable hero.**/
	static var CHHEIGHT:Int = 20;

	/** The set color of the controllable hero.**/
	static var CHCOLOR = 0xFFD4AF37;

	/** The controllable hero's speed.**/
	static var CHSPEED = 50;

	/** The controllable hero's deceleration when no arrow key is pressed.**/
	static var CHDRAG = 800;

	/**
		Creates a Controllable Hero at a specified position.

		@param	xPos	The initial x position of the hero.
		@param	yPos	The initial y position of the hero.
	**/
	public function new(xPos:Float = 0, yPos:Float = 0)
	{
		super(xPos, yPos);
		makeGraphic(CHWIDTH, CHHEIGHT, CHCOLOR);
		drag.x = drag.y = CHDRAG;
	}

	override function update(elapsed:Float)
	{
		movement();
		super.update(elapsed);
	}

	/**
		Movement of the ControllableHero sprite is controlled by the arrow keys.
		UP, DOWN, LEFT, and RIGHT arrow keys will move the sprite in that
		direction, including diagonally. Releasing the key brings the sprite to
		a stop.

		The code used here is from the Haxe documentation tutorial.
		@see https://haxeflixel.com/documentation/tutorial/
	**/
	private function movement()
	{
		// Helper variables to help with the controls in this function.
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		// Track which keys are pressed.
		up = FlxG.keys.anyPressed([UP]);
		down = FlxG.keys.anyPressed([DOWN]);
		left = FlxG.keys.anyPressed([LEFT]);
		right = FlxG.keys.anyPressed([RIGHT]);

		// Cancel out key presses of opposing directions.
		if (up && down)
		{
			up = down = false;
		}
		if (left && right)
		{
			left = right = false;
		}

		// This is the actual movements, including diagonal.
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
