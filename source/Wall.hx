package;

import flixel.FlxSprite;

class Wall extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, w:Int = 0, h:Int = 0)
	{
		super(x, y);

		makeGraphic(w, h);

		immovable = true;
	}
}
