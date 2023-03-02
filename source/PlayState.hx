package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	/** Starting X coordinate of ControllableHero sprite.**/
	static var CHXPOS:Float = 320;

	/** Starting Y coordinate of ControllableHero sprite.**/
	static var CHYPOS:Float = 300;

	/** X coordinate of Haxe logo hero.**/
	static var HEROXPOS:Float = 300;

	/** Y coordinate of Haxe logo hero.**/
	static var HEROYPOS:Float = 300;

	/** X coordinate of text.**/
	static var TEXTXPOS:Float = 235;

	/** Y coordinate of text.**/
	static var TEXTYPOS:Float = 200;

	/** The displayed text.**/
	static var TEXTTEXT:String = "Salvete, omnes!";

	/** The size of the text.**/
	static var TEXTSIZE:Int = 24;

	/** The minimum starting number of ScreensaverHero sprites.**/
	static var NUMSSHEROMIN:Int = 10;

	/** The maximum starting number of ScreensaverHero sprites.**/
	static var NUMSSHEROMAX:Int = 20;

	/** The X coordinate the ScreenSaverHero sprites start.**/
	static var SSHXPOS:Float = 320;

	/** The Y coordinate the ScreenSaverHero sprites start.**/
	static var SSHYPOS:Float = 180;

	/**The size of the bounding box. This is a percentage of the play screen
		in decimal (e.g. .75 or .5).**/
	static var BOXSIZE:Float = .75;

	/** How thick the walls of the bounding box are.**/
	static var WALLWIDTH:Int = 5;

	// Class level variables for collision detection.
	var controllableHero:ControllableHero;
	var screenSaverHeroGroup = new FlxTypedGroup<ScreenSaverHero>();
	var wallGroup = new FlxTypedGroup<Wall>();

	override public function create()
	{
		super.create();
		controllableHero = new ControllableHero(CHXPOS, CHYPOS);

		// Static Haxe logo Hero.
		var myHero = new Hero(HEROXPOS, HEROYPOS);
		add(myHero);

		var text = new flixel.text.FlxText(TEXTXPOS, TEXTYPOS, 0, TEXTTEXT, TEXTSIZE);
		text.color = 0x0080FF;
		text.font = "Time New Roman";
		add(text);

		// Generates random number of ScreenSaverHero sprites facing and moving
		// in different directions.
		var numSSHeroes = FlxG.random.int(NUMSSHEROMIN, NUMSSHEROMAX);
		for (i in 0...numSSHeroes)
		{
			var screenSaverHero = new ScreenSaverHero(SSHXPOS, SSHYPOS);
			screenSaverHeroGroup.add(screenSaverHero);
			add(screenSaverHero);
		}

		boxWall();
		add(wallGroup);

		add(controllableHero);
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(controllableHero, wallGroup);
		FlxG.overlap(controllableHero, screenSaverHeroGroup, notifyCollision);

		super.update(elapsed);
	}

	/**
		Uses Wall sprites to create a bounding box the ConrollableHero sprite
		can't pass through.  The size of the bounding box is determined by the
		BOXSIZE class level static variable.
	**/
	function boxWall()
	{
		var leftX = (FlxG.width * (1 - BOXSIZE)) / 2;
		var leftY = (FlxG.height * (1 - BOXSIZE)) / 2;
		var xLength = FlxG.width * BOXSIZE;
		var yLength = FlxG.height * BOXSIZE;

		var wallTop = new Wall(leftX, leftY, Std.int(xLength), WALLWIDTH);
		var wallBottom = new Wall(leftX, (leftY + yLength), Std.int(xLength), WALLWIDTH);
		var wallLeft = new Wall(leftX, leftY, WALLWIDTH, Std.int(yLength));
		var wallRight = new Wall((leftX + xLength), leftY, WALLWIDTH, (Std.int(yLength) + WALLWIDTH));

		wallGroup.add(wallTop);
		wallGroup.add(wallBottom);
		wallGroup.add(wallLeft);
		wallGroup.add(wallRight);
	}

	/**
		Looks for collisions between the ControllableHero and any
		ScreenSaverHero sprites. When a collision is detected, the
		ScreenSaverHero sprite is deleted.

		@param	controllableHero	The ControllableHero sprite
		@param	screenSaverHero		The ScreenSaverHero sprite
	**/
	function notifyCollision(controllableHero, screenSaverHero)
	{
		screenSaverHero.kill();
	}
}
