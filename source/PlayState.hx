package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	static var CHXPOS:Float = 320;
	static var CHYPOS:Float = 300;
	static var HEROXPOS:Float = 300;
	static var HEROYPOS:Float = 300;
	static var TEXTXPOS:Float = 235;
	static var TEXTYPOS:Float = 200;
	static var TEXTTEXT:String = "Salvete, omnes!";
	static var TEXTSIZE:Int = 24;
	static var NUMSSHEROMIN:Int = 10;
	static var NUMSSHEROMAX:Int = 20;
	static var SSHXPOS:Float = 320;
	static var SSHYPOS:Float = 180;

	var controllableHero = new ControllableHero(CHXPOS, CHYPOS);
	var screenSaverHeroGroup = new FlxTypedGroup<ScreenSaverHero>();
	var wallGroup = new FlxTypedGroup<Wall>();

	override public function create()
	{
		super.create();

		var myHero = new Hero(HEROXPOS, HEROYPOS);
		add(myHero);

		var text = new flixel.text.FlxText(TEXTXPOS, TEXTYPOS, 0, TEXTTEXT, TEXTSIZE);
		text.color = 0x0080FF;
		text.font = "Time New Roman";
		add(text);

		var numSSHeroes = FlxG.random.int(NUMSSHEROMIN, NUMSSHEROMAX);
		for (i in 0...numSSHeroes)
		{
			var screenSaverHero = new ScreenSaverHero(SSHXPOS, SSHYPOS);
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
