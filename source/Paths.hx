package;

import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;

class Paths
{
	inline public static var SOUND_EXT = #if web "mp3" #else "ogg" #end;
	inline public static var VIDEO_EXT = "mp4";
	inline public static var WEBM_EXT = "webm";

	static var currentLevel:String;

	static public function file(file:String)
	{
		var path = 'assets/$file';
		if (currentLevel != null && OpenFlAssets.exists('$currentLevel:$path'))
			return '$currentLevel:$path';

		return path;
	}

	inline static public function txt(key:String)
	{
		return getPath('data/$key.txt');
	}

	inline static public function xml(key:String)
	{
		return getPath('data/$key.xml');
	}

	inline static public function json(key:String)
	{
		return getPath('data/$key.json');
	}

	static public function sound(key:String)
	{
		return getPath('sounds/$key.$SOUND_EXT');
	}

	inline static public function soundRandom(key:String, min:Int, max:Int)
	{
		return sound(key + FlxG.random.int(min, max));
	}

	inline static public function video(key:String)
	{
		trace('assets/videos/$key.VIDEO_EXT');
		return getPath('videos/$key.VIDEO_EXT');
	}

	inline static public function webm(key:String)
	{
		trace('assets/videos/$key.WEBM_EXT');
		return getPath('videos/$key.WEBM_EXT');
	}

	inline static public function music(key:String, type:AssetType = MUSIC)
	{
		return getPath('music/$key.$SOUND_EXT');
	}

	inline static public function voices(song:String)
	{
		return 'songs:assets/songs/${song.toLowerCase()}/Voices.$SOUND_EXT';
	}

	inline static public function inst(song:String)
	{
		return 'songs:assets/songs/${song.toLowerCase()}/Inst.$SOUND_EXT';
	}

	inline static public function image(key:String)
	{
		return getPath('images/$key.png');
	}

	inline static public function font(key:String)
	{
		return 'assets/fonts/$key';
	}

	inline static public function locales(key:String)
	{
		return getPath('locales/$key/languageData.json');
	}

	inline static public function cutscene(key:String)
	{
		return getPath('cutscenes/$key.json');
	}

	inline static public function script(key:String)
	{
		return getPath('scripts/$key.lua');
	}

	inline static public function songScript(key:String)
	{
		return getPath('data/$key.lua');
	}

	inline static public function charJson(key:String)
	{
		return getPath('characters/$key.json');
	}

	inline static public function getSparrowAtlas(key:String)
	{
		return FlxAtlasFrames.fromSparrow(image(key), file('images/$key.xml'));
	}

	inline static public function getPackerAtlas(key:String)
	{
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key), file('images/$key.txt'));
	}
}
