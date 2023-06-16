package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

using StringTools;

// yoinked code from retrospecter srry arcy
class CreditGroup extends FlxBasic
{
	public var name:FlxFixedTypeText; // Positions are based off this text location
	public var nameStr:String;
	public var tag:FlxFixedTypeText;
	public var icon:FlxSprite;
	public var color:FlxColor;
	public var link:String;
	public var nodes:Array<CreditGroup>; // Left, Down, Up, Right


	public function new(Name:FlxFixedTypeText, NameString:String, Tag:FlxFixedTypeText, Icon:FlxSprite, Color:FlxColor, Link:String)
	{
		super();

		name = Name;
		nameStr = NameString;
		tag = Tag;
		icon = Icon;
		color = Color;
		link = Link;
		nodes = [null, null, null, null];

	}

	public function tweenPosition(X:Float, Y:Float, Duration:Float = 1, ?Options:TweenOptions)
	{
		FlxTween.tween(name, {x: X, y: Y}, Duration, Options);
		FlxTween.tween(tag, {x: X, y: Y + 20}, Duration, Options);
		FlxTween.tween(icon, {x: X - 50, y: Y}, Duration, Options);
	}

	public function setPosition(X:Float, Y:Float)
	{
		name.setPosition(X, Y);
		tag.setPosition(X, Y + 20);
		icon.setPosition(X - 50, Y);
	}


	public function select()
	{
		name.setFormat("VCR OSD Mono", 24, color);
	}

	public function deselect()
	{
		name.setFormat("VCR OSD Mono", 24, FlxColor.WHITE);
	}
}

class CreditsState extends MusicBeatState
{
	// Array key:
	// 0 - Name
	// 1 - Twitter Tag
	// 2 - Icon name
	// 3 - Color
	// 4 - Twitter Link
	// 5 - Array of quot- just kidding no quotes

	var sectionArrays:Array<Dynamic> = [
		[
			// Artists
			['Aurum', '@aureumber', 'aurum', FlxColor.fromRGB(255, 221, 114), 'https://twitter.com/aureumber', []],
			['BonesTheSkelebunny01', '@BSkelebunny01', 'bon', FlxColor.fromRGB(255, 51, 187), 'https://twitter.com/BSkelebunny01', []],
			['Dax', '@Daxite_', 'dax', FlxColor.fromRGB(0, 38, 230), 'https://twitter.com/daxite_', []],
			['D6', '@DSiiiiiix', 'd6', FlxColor.fromRGB(107, 104, 120), 'https://twitter.com/DSiiiiiix', []],
			['Kamex', '@KamexVGM', 'kamex', FlxColor.fromRGB(186, 226, 255), 'https://twitter.com/KamexVGM', []],
			['Lectro', '@LectroArt', 'lectro', FlxColor.fromRGB(255, 255, 58), 'https://twitter.com/LectroArt', []],
			['Juno Songs', '@JunoSongsYT', 'juno', FlxColor.fromRGB(191, 0, 230), 'https://twitter.com/JunoSongsYT', []],
			['Pincer', '@PincerProd', 'pincer', FlxColor.fromRGB(25, 255, 255), 'https://twitter.com/PincerProd', []],
			['Shiba Chichi', '@lolychichi', 'chichi', FlxColor.fromRGB(255, 179, 191), 'https://twitter.com/lolychichi', []],
			['Sinna_roll', '@Sinna_roll', 'zhi', FlxColor.fromRGB(204, 255, 102), 'https://twitter.com/Sinna_roll', []],
			['Springy_4264', '@Springy_4264', 'springy', FlxColor.fromRGB(179, 0, 30), 'https://twitter.com/Springy_4264', []],
			['Wildface', '@wildface1010', 'wildface', FlxColor.fromRGB(233, 19, 19), 'https://twitter.com/wildface1010', []],
			['Wolfwrathknight', '@Wolfwrathknight', 'wolf', FlxColor.fromRGB(0, 124, 254), 'https://twitter.com/wolfwrathknight', []]
		],
		[
			// Animators
			['Aurum', '@aureumber', 'aurum', FlxColor.fromRGB(255, 221, 114), 'https://twitter.com/aureumber', []],
			['Shiba Chichi', '@lolychichi', 'chichi', FlxColor.fromRGB(255, 179, 191), 'https://twitter.com/lolychichi', []],
			['Tenzu', '@Tenzubushi', 'tenzu', FlxColor.GRAY, 'https://twitter.com/Tenzubushi', []],
			['Wildface', '@wildface1010', 'wildface', FlxColor.fromRGB(233, 19, 19), 'https://twitter.com/wildface1010', []]
		],
		[
			// Audio
			['Kamex', '@KamexVGM', 'kamex', FlxColor.fromRGB(186, 226, 255), 'https://twitter.com/kamexvgm', []],
			['RetroSpecter', '@RetroSpecter_', 'retro', FlxColor.fromRGB(23, 216, 228), 'https://twitter.com/Retrospecter_', []]

		],
		[
			// Programming
			['ArcyDev', '@AwkwardArcy', 'arcy', FlxColor.fromRGB(255, 140, 25), 'https://twitter.com/AwkwardArcy', []],
			['AyeTSG', '@AyeTSG', 'tsg', FlxColor.fromRGB(120, 114, 114), 'https://twitter.com/ayetsg', []],
			['Candy', '@D0GFREAK', 'candy', FlxColor.fromRGB(255, 192, 203), 'https://twitter.com/D0GFREAK', []],
			['Mk', '@Mkv8Art', 'mk', FlxColor.fromRGB(255, 25, 102), 'https://twitter.com/Mkv8Art', []],
			['Tech', '@ThatTechCoyote', 'tech', FlxColor.fromRGB(153, 0, 0), 'https://twitter.com/ThatTechCoyote', []],
			['Ne_Eo', '@Ne_Eo_Twitch', 'neeo', FlxColor.fromRGB(48, 38, 39), 'https://twitter.com/Ne_Eo_Twitch', []]
		],
		[
			// Charting
			['ChubbyGamer464', '@ChubbyAlt', 'chubby', FlxColor.fromRGB(201, 162, 92), 'https://twitter.com/ChubbyAlt', []],
			['Clipee', '@LilyClipster', 'clip', FlxColor.fromRGB(230, 230, 0), 'https://twitter.com/LilyClipster', []],
			['DJ', '@AlchoholicDj', 'dj', FlxColor.fromRGB(0, 0, 230), 'https://twitter.com/AlchoholicDj', []],
			['Fogu', '@FoguDragon', 'ayma', FlxColor.fromRGB(168, 50, 58), 'https://twitter.com/FoguDragon', []]
		],
		[
			// Special Thanks
			['RetroSpecter', '@RetroSpecter_', 'retro', FlxColor.fromRGB(23, 216, 228), 'https://twitter.com/Retrospecter_', []],
			['Kade', '@KadeDev', 'kade', FlxColor.fromRGB(25, 77, 0), 'https://twitter.com/kade0912', []],
			['TKTems', '@TKtems', 'tk', FlxColor.fromRGB(0, 230, 191), 'https://twitter.com/TKTems', []],
			['TiredPinkPanda', '@TiredPinkPanda', 'panda', FlxColor.fromRGB(158, 22, 22), 'https://twitter.com/TiredPinkPanda', []]
		]
	];

	var titleNames:Array<String> = ['Artists', 'Animators', 'Programming', 'Special Thanks'];
	var title2Names:Array<String> = ['', 'Audio', 'Charting', ''];

	var iconList:FlxTypedGroup<FlxSprite>;
	var titleList:FlxTypedGroup<FlxFixedText>;
	var secondTitleList:FlxTypedGroup<FlxFixedText>;
	var curSection:Int = 0;
	var curSelected:CreditGroup;
	var textLength:FlxFixedText;
	// var quoteText:FlxTypeText;
	// var memeText:FlxTypeText;
	// var quotePerson:FlxTypeText;

	var creditSections:FlxTypedGroup<FlxTypedGroup<CreditGroup>>;
	var credit2Sections:FlxTypedGroup<FlxTypedGroup<CreditGroup>>;
	var artistCredits:FlxTypedGroup<CreditGroup>;
	var allowInputs:Bool = true;

	//var shh:FlxSound;

	override function create()
	{
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Reading Credits", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menuDesat"));
		bg.color = 0xFF803fff;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		bg.alpha = 0.75;
		add(bg);

		iconList = new FlxTypedGroup<FlxSprite>();
		titleList = new FlxTypedGroup<FlxFixedText>();
		secondTitleList = new FlxTypedGroup<FlxFixedText>();
		creditSections = new FlxTypedGroup<FlxTypedGroup<CreditGroup>>();
		credit2Sections = new FlxTypedGroup<FlxTypedGroup<CreditGroup>>();
		artistCredits = new FlxTypedGroup<CreditGroup>();

		var title:FlxFixedText = new FlxFixedText(0, 25, 0, 'CREDITS', 100);
		title.setFormat("VCR OSD Mono", 100, FlxColor.WHITE);
		title.screenCenter(X);
		add(title);

		var instructions:FlxFixedText = new FlxFixedText(10, 10, 500, 'Move to select a person\nConfirm to go to their Twitter page\nQ and E to change sections');
		instructions.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, FlxTextAlign.LEFT);
		add(instructions);

		// textLength = new FlxText(0, 600, 0, '');
		// textLength.setFormat("VCR OSD Mono", 36, FlxColor.WHITE);
		// quoteText = new FlxTypeText(textLength.x, 600, 1280, '');
		// quoteText.setFormat("VCR OSD Mono", 36, FlxColor.WHITE);
		// quoteText.sounds = [FlxG.sound.load(Paths.sound('bfText'), 0.6)];
		// add(quoteText);
		// memeText = new FlxTypeText(textLength.x, 600, 0, '');
		// memeText.setFormat("VCR OSD Mono", 36, FlxColor.WHITE);
		// memeText.sounds = [FlxG.sound.load(Paths.sound('bfText'), 0.6)];
		// memeText.visible = false;
		// add(memeText);
		// quotePerson = new FlxTypeText(650, 675, 0, '');
		// quotePerson.setFormat("VCR OSD Mono", 24, FlxColor.WHITE);
		// add(quotePerson);

		for (i in 0...titleNames.length)
		{
			var subTitle:FlxFixedText = new FlxFixedText(2175, 150, 0, titleNames[i], 50);
			subTitle.setFormat("VCR OSD Mono", 50, FlxColor.WHITE);
			titleList.add(subTitle);

			var secondSubTitle:FlxFixedText = new FlxFixedText(2175, 400, 0, title2Names[i], 50);
			secondSubTitle.setFormat("VCR OSD Mono", 50, FlxColor.WHITE);
			secondTitleList.add(secondSubTitle);
		}

		// Hard code workaround
		credit2Sections.add(new FlxTypedGroup<CreditGroup>());

		for (i in 0...sectionArrays.length)
		{
			var section:FlxTypedGroup<CreditGroup> = new FlxTypedGroup<CreditGroup>();

			for (j in 0...sectionArrays[i].length)
			{
				var icon:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('crediticons/' + sectionArrays[i][j][2], 'preload'));
				icon.setGraphicSize(50, 50);
				icon.antialiasing = FlxG.save.data.antialiasing;
				icon.updateHitbox();
				var name:FlxFixedTypeText = new FlxFixedTypeText(0, 0, 0, sectionArrays[i][j][0]);
				name.setFormat("VCR OSD Mono", 24, FlxColor.WHITE);
				name.start(0.1);
				add(name);
				var tag:FlxFixedTypeText = new FlxFixedTypeText(0, 0, 0, sectionArrays[i][j][1]);
				tag.setFormat("VCR OSD Mono", 18, 0xFFd1d1d1);
				tag.start(0.1);
				add(tag);
				var credit:CreditGroup = new CreditGroup(name, sectionArrays[i][j][0], tag, icon, sectionArrays[i][j][3], sectionArrays[i][j][4]);

				iconList.add(icon);
				section.add(credit);
			}

			for (i in 0...section.length)
			{
				section.members[i].setPosition(2175 + ((i % 3) * 400), 250 + (Std.int(i / 3) * 100));

				// Left
				if (i % 3 != 0)
				{
					section.members[i].nodes[0] = section.members[i - 1];
				}
				else if (i + 2 < section.length)
				{
					section.members[i].nodes[0] = section.members[i + 2];
				}
				else
				{
					section.members[i].nodes[0] = section.members[section.length - 1];
				}
				// Down
				if (i + 3 < section.length)
				{
					section.members[i].nodes[1] = section.members[i + 3];
				}
				else
				{
					section.members[i].nodes[1] = section.members[i % 3];
				}
				// Up
				if (i - 3 >= 0)
				{
					section.members[i].nodes[2] = section.members[i - 3];
				}
				else
				{
					var remainder:Int = section.length % 3;
					var column:Int = i % 3;
					if (remainder < column + 1)
					{
						section.members[i].nodes[2] = section.members[section.length - remainder - (3 - column - 1) - 1];
					}
					else if (remainder > column + 1)
					{
						section.members[i].nodes[2] = section.members[section.length - (3 - column - 1)];
					}
					else
					{
						section.members[i].nodes[2] = section.members[section.length - 1];
					}
				}
				// Right
				if (i + 1 >= section.length)
				{
					section.members[i].nodes[3] = section.members[i - (i % 3)];
				}
				else if (i % 3 != 2)
				{
					section.members[i].nodes[3] = section.members[i + 1];
				}
				else if (i - 2 < section.length)
				{
					section.members[i].nodes[3] = section.members[i - 2];
				}
				else
				{
					section.members[i].nodes[3] = section.members[section.length - 1];
				}
			}

			if (i == 2 || i == 4)
			{
				credit2Sections.add(section);
			}
			else
			{
				creditSections.add(section);
			}
		}

		// this should make everything connect together hopefullyskjgs (candy)
		// arcy is a fucking legend

		// Animators/Audio
		creditSections.members[1].members[3].nodes[1] = credit2Sections.members[1].members[0]; // Down | Wildface -> Kamex
		credit2Sections.members[1].members[0].nodes[1] = creditSections.members[1].members[0]; // Down | Kamex -> Aurum
		credit2Sections.members[1].members[0].nodes[2] = creditSections.members[1].members[3]; // Up | Kamex -> Wildface
		creditSections.members[1].members[0].nodes[2] = credit2Sections.members[1].members[0]; // Up | Aurum -> Kamex
		creditSections.members[1].members[3].nodes[2] = creditSections.members[1].members[0]; // Up | Wildface -> Aurum (idk if this actually worked or not but the code is functional so -vsn)

		// Programming/Charters
		creditSections.members[2].members[0].nodes[2] = credit2Sections.members[2].members[3];	// Up	| Arcy -> Ayma
		credit2Sections.members[2].members[0].nodes[2] = creditSections.members[2].members[3];	// Up	| Chubby -> Mk
		creditSections.members[2].members[1].nodes[2] = credit2Sections.members[2].members[1];	// Up	| TSG -> Clipee
		credit2Sections.members[2].members[1].nodes[2] = creditSections.members[2].members[4];	// Up	| Clipee -> tech
		creditSections.members[2].members[2].nodes[2] = credit2Sections.members[2].members[2];	// Up	| candy -> DJ
		credit2Sections.members[2].members[2].nodes[2] = creditSections.members[2].members[5];	// Up	| DJ -> tech

		creditSections.members[2].members[3].nodes[1] = credit2Sections.members[2].members[0];	// Down	| Mk -> Chubby
		credit2Sections.members[2].members[3].nodes[1] = creditSections.members[2].members[0];	// Down	| Ayma -> Arcy
		creditSections.members[2].members[4].nodes[1] = credit2Sections.members[2].members[1];	// Down	| tech -> Clipee
		credit2Sections.members[2].members[1].nodes[1] = creditSections.members[2].members[1];	// Down	| Clipee -> TSG
		creditSections.members[2].members[5].nodes[1] = credit2Sections.members[2].members[2];	// Down	| neeo -> dj
		credit2Sections.members[2].members[2].nodes[1] = creditSections.members[2].members[2];	// Down	| DJ -> candy



		credit2Sections.add(new FlxTypedGroup<CreditGroup>());

		// Initialize
		titleList.members[curSection].setPosition(640 - (titleList.members[curSection].width / 2), 150);
		secondTitleList.members[curSection].setPosition(640 - (secondTitleList.members[curSection].width / 2), 400);
		for (i in 0...creditSections.members[curSection].length)
		{
			creditSections.members[curSection].members[i].setPosition(175 + ((i % 3) * 400), 250 + (Std.int(i / 3) * 75));
		}
		for (i in 0...credit2Sections.members[curSection].length)
		{
			credit2Sections.members[curSection].members[i].setPosition(175 + ((i % 3) * 400), 500 + (Std.int(i / 3) * 75));
		}

		curSelected = creditSections.members[curSection].members[0];
		curSelected.select();

		/*shh = new FlxSound().loadEmbedded(Paths.sound('forD6', 'shared'));
		FlxG.sound.list.add(shh);*/

		add(titleList);
		add(secondTitleList);
		add(iconList);
		add(creditSections);
		add(credit2Sections);


		#if android
                addVirtualPad(LEFT_FULL, A_B);
                #end

		super.create();
	}

	override function update(elapsed:Float)
	{
		// For animations on beat
		if (TitleState.introMusic != null && TitleState.introMusic.playing)
		{
			Conductor.songPosition = TitleState.introMusic.time;
		}
		else if (FlxG.sound.music != null)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}

		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}
		else if (controls.ACCEPT)
		{
			// (tsg - 8/14/2021) dont try to open null links (such as kevin's)
			if (curSelected.link != null) {
				FlxG.openURL(curSelected.link);
			}
		}

		if (allowInputs && FlxG.keys.justPressed.Q)
		{
			changeSection(-1);
		}
		else if (allowInputs && FlxG.keys.justPressed.E)
		{
			changeSection(1);
		}
		else if (controls.LEFT_P)
		{
			move(0);
		}
		else if (controls.RIGHT_P)
		{
			move(3);
		}
		else if (controls.UP_P)
		{
			move(2);
		}
		else if (controls.DOWN_P)
		{
			move(1);
		}

		for (i in 0...iconList.length)
		{
			iconList.members[i].setGraphicSize(Std.int(FlxMath.lerp(50, iconList.members[i].width, 0.50)));
			iconList.members[i].updateHitbox();
		}

		super.update(elapsed);
	}

	override function beatHit()
	{
		for (i in 0...iconList.length)
		{
			FlxTween.tween(iconList.members[i], {width: 60, height: 60}, 0.05, {ease: FlxEase.cubeOut});
		}
	}

	// 0 - Left
	// 1 - Down
	// 2 - Up
	// 3 - Right
	function move(direction:Int)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'));

		curSelected.deselect();
		curSelected = curSelected.nodes[direction];
		curSelected.select();


	}

	function changeSection(direction:Int)
	{
		allowInputs = false;

		FlxTween.tween(titleList.members[curSection], {x: (direction < 0 ? 2175 : -1825) - (titleList.members[curSection].width / 2)}, 1, {ease: FlxEase.cubeInOut});
		FlxTween.tween(secondTitleList.members[curSection], {x: (direction < 0 ? 2175 : -1825) - (secondTitleList.members[curSection].width / 2)}, 1, {ease: FlxEase.cubeInOut});
		for (i in 0...creditSections.members[curSection].length)
		{
			creditSections.members[curSection].members[i].tweenPosition((direction < 0 ? 2175 : -1825) + ((i % 3) * 400),  250 + (Std.int(i / 3) * 75), 1, {ease: FlxEase.cubeInOut});
		}
		for (i in 0...credit2Sections.members[curSection].length)
		{
			credit2Sections.members[curSection].members[i].tweenPosition((direction < 0 ? 2175 : -1825) + ((i % 3) * 400),  500 + (Std.int(i / 3) * 75), 1, {ease: FlxEase.cubeInOut});
		}

		curSection += direction;

		if (curSection >= creditSections.length)
		{
			curSection = 0;
		}
		else if (curSection < 0)
		{
			curSection = creditSections.length - 1;
		}

		curSelected.deselect();
		curSelected = creditSections.members[curSection].members[0];
		curSelected.select();


		titleList.members[curSection].setPosition((direction < 0 ? -1825 : 2175) + (titleList.members[curSection].width / 2), 150);
		secondTitleList.members[curSection].setPosition((direction < 0 ? -1825 : 2175) + (titleList.members[curSection].width / 2), 400);
		FlxTween.tween(titleList.members[curSection], {x: 640 - (titleList.members[curSection].width / 2)}, 1, {ease: FlxEase.cubeInOut, onComplete: function(flx:FlxTween) { allowInputs = true; }});
		FlxTween.tween(secondTitleList.members[curSection], {x: 640 - (secondTitleList.members[curSection].width / 2)}, 1, {ease: FlxEase.cubeInOut, onComplete: function(flx:FlxTween) { allowInputs = true; }});
		for (i in 0...creditSections.members[curSection].length)
		{
			creditSections.members[curSection].members[i].setPosition((direction < 0 ? -1825 : 2175) + ((i % 3) * 400), 250 + (Std.int(i / 3) * 75));
			creditSections.members[curSection].members[i].tweenPosition(175 + ((i % 3) * 400),  250 + (Std.int(i / 3) * 75), 1, {ease: FlxEase.cubeInOut});
		}

		for (i in 0...credit2Sections.members[curSection].length)
		{
			credit2Sections.members[curSection].members[i].setPosition((direction < 0 ? -1825 : 2175) + ((i % 3) * 400), 500 + (Std.int(i / 3) * 75));
			credit2Sections.members[curSection].members[i].tweenPosition(175 + ((i % 3) * 400),  500 + (Std.int(i / 3) * 75), 1, {ease: FlxEase.cubeInOut});
		}
	}



}
