package;

import flixel.FlxSprite;

/**
	A wall! From Wallmart!
**/
class Wall extends FlxSprite
{
	/**
		Creates an individual wall.
		@param	xPos		The X coordinate where the wall will start.
		@param	yPos		The Y coordinate where the wall will start.
		@param	wallSizeX	The size of the wall in the x direction.
		@param	wallsizeY	The size of the wall in the y direction.
	**/
	public function new(xPos:Float = 0, yPos:Float = 0, wallSizeX:Int = 0, wallsizeY:Int = 0)
	{
		super(xPos, yPos);
		makeGraphic(wallSizeX, wallsizeY);
		immovable = true;
	}
}
