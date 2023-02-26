package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.graphics.atlas.FlxNode;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var screenSaverHeroGroup = new FlxTypedGroup<ScreenSaverHero>();
	var controllableHero = new ControllableHero(320, 300);
	var wallGroup = new FlxTypedGroup<Wall>();

	override public function create()
	{
		super.create();

		var myHero = new Hero(300, 300);
		add(myHero);

		var text = new flixel.text.FlxText(235, 200, 0, "Salvete, omnes!", 24);
		text.color = 0x0080FF;
		text.font = "Time New Roman";
		add(text);

		var numSSHeroes = FlxG.random.int(10, 20);
		for (i in 0...numSSHeroes)
		{
			var screenSaverHero = new ScreenSaverHero(320, 180);
			screenSaverHeroGroup.add(screenSaverHero);
			add(screenSaverHero);
		}

		add(controllableHero);

		var wallTop = new Wall(80, 60, 480, 5);
		var wallBottom = new Wall(80, 420, 480, 5);
		var wallLeft = new Wall(80, 60, 5, 360);
		var wallRight = new Wall(560, 60, 5, 365);
		wallGroup.add(wallTop);
		wallGroup.add(wallBottom);
		wallGroup.add(wallLeft);
		wallGroup.add(wallRight);
		add(wallTop);
		add(wallBottom);
		add(wallLeft);
		add(wallRight);
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(controllableHero, wallGroup);
		FlxG.overlap(controllableHero, screenSaverHeroGroup, notifyCollision);

		super.update(elapsed);
	}

	function notifyCollision(controllableHero, screenSaverHero)
	{
		screenSaverHero.kill();
	}
}
