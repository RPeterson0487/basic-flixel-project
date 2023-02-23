package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var myHero = new Hero(300, 300);
		add(myHero);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}