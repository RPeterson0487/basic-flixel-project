package;

import flixel.math.FlxVelocity;
import flixel.FlxSprite;

class Fireball extends FlxSprite
{
	static inline var FIREBALL_SPEED:Float = 10;

	var target:FlxSprite;

	public function new(xPos:Float = 0, yPos:Float = 0, fireballSize, target)
	{
		super(xPos, yPos);
		this.target = target;
		makeGraphic(fireballSize, fireballSize);
	}

	override function update(elapsed:Float)
	{
		FlxVelocity.moveTowardsObject(this, target, FIREBALL_SPEED);

		super.update(elapsed);
	}
}
