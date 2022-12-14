package modding;

import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import haxe.Json;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenflAssets;

class ModPaths {
    static final currentLevel:String = Paths.currentLevel;

    private static final SOUND_EXT = Paths.SOUND_EXT;
    private static final VIDEO_EXT = Paths.VIDEO_EXT;
    private static final WEBM_EXT = Paths.WEBM_EXT;

    inline static public function modIconImage(key:String, mod:String){
		return getPath('$mod/_polymod_icon.png', mod);
    }

    inline static public function appendTxt(key:String, ?mod:String){
        return getPath('_append/data/$key.txt',mod);
    }

    inline static public function getModTxt(key:String, ?mod:String){
        return getPath('data/$key.txt',mod);
    }

    inline static public function getModXml(key:String, mod:String )
    {
        return getPath('data/$key.xml', mod);
    }

    inline static public function getModJson(key:String, mod:String){
            return getPath('data/$key.json',mod);
    }
    
        static public function getModSound(key:String, mod:String)
	{
		return getPath('sounds/$key.$SOUND_EXT', mod);
	}

    inline static public function soundRandom(key:String, min:Int, max:Int, ?mod:String)
    {
        return getModSound(key + FlxG.random.int(min, max), mod);
    }

        inline static public function getModVideo(key:String, mod:String)
	{
		trace('mods/$mod/videos/$key.VIDEO_EXT');
		return getPath('videos/$key.VIDEO_EXT', mod);
	}

    inline static public function getModWebm(key:String, mod:String)
	{
		trace('mods/$mod/videos/$key.WEBM_EXT');
		return getPath('videos/$key.WEBM_EXT', mod);
	}

        inline static public function getModMusic(key:String, mod:String)
	{
		return getPath('music/$key.$SOUND_EXT', mod);
	}

        inline static public function getModVoices(song:String, mod:String)
	{
		trace('Loading VOICES');
		var loadingSong:Bool = true;
		if(loadingSong) {
			trace('Done Loading VOICES!');
			return 'mods/$mod/songs/${song.toLowerCase()}/Voices.$SOUND_EXT';}
		else {
			trace('ERROR Loading INST :c');
			return 'songs:assets/songs/bopeebo/Voices.$SOUND_EXT';}
	}

        inline static public function getModInst(song:String, mod:String)
	{
		trace('Loading INST');
		var loadingSong:Bool = true;
		if(loadingSong) {
			trace('Done Loading INST!');
			return 'mods/$mod/songs/${song.toLowerCase()}/Inst.$SOUND_EXT';}
		else {
			trace('ERROR Loading INST :c');
			return 'songs:assets/songs/bopeebo/Inst.$SOUND_EXT';}
	}
    
        inline static public function getModImage(key:String, mod:String){
		return getPath('images/$key.png', mod);
	}

        inline static public function getModFont(key:String,mod:String)
	{
        return getPath('fonts/$key',mod);
	}

    inline static public function getModScripts(key:String, mod:String){
        return getPath('scripts/$key.lua',mod);
    }

    inline static public function getModSongScripts(key:String, mod:String){
        return getPath('data/$key.lua', mod);
    }

    inline static public function getModCharjson(key:String, mod:String){
        return getPath('characters/$key.json', mod);
    }

    inline static public function getModLocales(key:String, mod:String)
    {
        return getPath('locales/$key/languageData.json', mod);
    }

    inline static public function getModCutscenes(key:String, mod:String)
    {
        return getPath('cutscenes/$key.json', mod);
    }

    static public function getPath(file:String, ?mod:String)
    {
        var path = "";
        if(mod != null)
            path = 'mods/$mod/$file';
        else
            path = 'mods/$file';
        if(OpenflAssets.exists(path,type))
            return path;

        return 'mods';
    }

    static public function checkMod(mod:String){
        return openfl.utils.Assets.exists('mods/$mod/_polymod_meta.json');
    }

    inline static public function getSparrowAtlas(key:String, ?mod:String)
    {
        return flixel.graphics.frames.FlxAtlasFrames.fromSparrow(getModImage(key, mod), getPath('images/$key.xml', mod));
    }

    inline static public function getPackerAtlas(key:String, ?mod:String)
    {
        return FlxAtlasFrames.fromSpriteSheetPacker(getModImage(key, mod), getPath('images/$key.txt', mod));
    }
}