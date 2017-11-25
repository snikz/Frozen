using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using Frozen.GUI;
using System.Diagnostics;

namespace Frozen.Rotation
{
	public class HolyPriest : CombatRoutine
	{
		private Settings settingsForm;
        public override Form SettingsForm
        {
            get { return settingsForm.FormSettings; }

            set { }
        }
		
		
		private int DivineHymn
        {
            get
            {
                return settingsForm.ReadSetting<int>("Divine Hymn");
            }
        }
		
		private int GuardianSpirit
        {
            get
            {
                return settingsForm.ReadSetting<int>("Guardian Spirit");
            }
        }
		
		private int PrayerofHealing
        {
            get
            {
                return settingsForm.ReadSetting<int>("Prayer of Healing");
            }
        }
		
		private int HolyWordSerenity
        {
            get
            {
                return settingsForm.ReadSetting<int>("Holy Word Serenity");
            }
        }
		
		private int FlashHeal
        {
            get
            {
                return settingsForm.ReadSetting<int>("Flash Heal");
            }
        }
		
		private int Heal
        {
            get
            {
                return settingsForm.ReadSetting<int>("Heal");
            }
        }
		
		private int LightofTuure
        {
            get
            {
                return settingsForm.ReadSetting<int>("Light of Tuure");
            }
        }
		
		private int Renew
        {
            get
            {
                return settingsForm.ReadSetting<int>("Renew");
            }
        }
		
		private int PrayerofMending
        {
            get
            {
                return settingsForm.ReadSetting<int>("Prayer of Mending");
            }
        }
		
		private bool ArcaneTorrent
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Arcane Torrent");
            }
        }
		
		public override void Initialize()
		{
			//Settings Form 
			settingsForm = new Settings("Priest-Holy-Sora", WoWClass.Priest);
			settingsForm.Add("Divine Hymn", new NumericUpDown(), 50);
			settingsForm.Add("Guardian Spirit", new NumericUpDown(), 20);
			settingsForm.Add("Prayer of Healing", new NumericUpDown(), 65);
			settingsForm.Add("Holy Word Serenity", new NumericUpDown(), 60);
			settingsForm.Add("Flash Heal", new NumericUpDown(), 70);
			settingsForm.Add("Heal", new NumericUpDown(), 85);
			settingsForm.Add("Light of Tuure", new NumericUpDown(), 85);
			settingsForm.Add("Renew", new NumericUpDown(), 40);
			settingsForm.Add("Prayer of Mending", new NumericUpDown(), 95);
			settingsForm.Add("Arcane Torrent", new CheckBox(), true);
	
			
			// Instructions for user.                                                                   
			Log.Write("Holy Priest by Sora", Color.Blue);
			Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
			Log.Write("This routine supports 3131312", Color.Magenta);
			Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
			Log.Write("Make sure to set up your healing keybinds", Color.Blue);
			Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
			Log.Write("Select your settings", Color.Red);
			Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
			Log.Write("In Proving grounds the tank ID is 5", Color.Magenta);
			Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
			Log.Write("Update: added GUI.", Color.Blue);
			Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
			Log.Write("You may have to bind Arcane Torrent if used", Color.Blue);
			Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
			Log.Write("If you want anything added message me in the Frozen Discord.", Color.Red);
			Log.Write("-----------------------------------------------------------------------", Color.DarkGray);

			
			// Forces Pulse to run at all times
			IsHealer = true;
		}
		
		public override void Stop()
		{
		}
		
		public override void Pulse()
		{
			if (WoW.IsMounted || WoW.PlayerIsCasting || WoW.PlayerIsChanneling)
				return;
			//set variables
            var lowest = WoW.PartyLowestHealthPercent;
			
			var averageHp = WoW.PartyAverageHealthPercent;

            var currentTargetId = WoW.PartyMemberIdWithLowestHealthPercent;
			
			WoW.TargetMember(currentTargetId);
			
			//Dispell Logic
            if (WoW.PartyMemberIsNeedingADispel != 0)
            {
                currentTargetId = WoW.PartyMemberIsNeedingADispel;
            }
			
			if (currentTargetId == 0) return;
            if (lowest == 100) return;
			
			
			// Divine Hymn Logic
			if (averageHp <= DivineHymn && WoW.CanCast("Divine Hymn") && !WoW.IsSpellOnCooldown("Divine Hymn"))
			{
                WoW.CastSpell("Divine Hymn");
				return;
			}
			
			// Guardian Spirit Logic
			if (lowest <= GuardianSpirit && WoW.CanCast("Guardian Spirit") && !WoW.IsSpellOnCooldown("Guardian Spirit"))
            {
                WoW.CastSpell("Guardian Spirit");
                return;
            }
			
			//Prayer of Healing Logic
			if (averageHp <= PrayerofHealing && WoW.CanCast("Prayer of Healing") && !WoW.IsSpellOnCooldown("Prayer of Healing"))
			{
                WoW.CastSpell("Prayer of Healing");
				return;
			}
			
			//Purify Logic
			if (WoW.PartyMemberIsNeedingADispel != 0 && WoW.CanCast("Purify"))
            {
                WoW.CastSpell("Purify");
                return;
            }
			
			// Holy Word: Serenity Logic
			if (lowest <= HolyWordSerenity && WoW.CanCast("Holy Word Serenity") && !WoW.IsSpellOnCooldown("Holy Word Serenity"))
            { 
                WoW.CastSpell("Holy Word Serenity");
                return;
            }
			
			// Renew Logic
			if (lowest >= Renew && WoW.CanCast("Renew") && !WoW.TargetHasBuff("Renew"))
            {
                WoW.CastSpell("Renew");
                return;
            }
			
			// Flash Heal Logic
            if (lowest <= FlashHeal && WoW.CanCast("Flash Heal") && !WoW.IsMoving)
            {
                WoW.CastSpell("Flash Heal");
                return;
            }
			
			// Heal Logic
            if (lowest <= Heal && WoW.CanCast("Heal") && !WoW.IsMoving)
            {
                WoW.CastSpell("Heal");
                return;
            }
			 
			//Light of Tuure Logic
			if (lowest <= LightofTuure && WoW.CanCast("Light of Tuure") && WoW.Level == 110 &&  !WoW.IsSpellOnCooldown("Light of Tuure") && !WoW.TargetHasBuff("Light of Tuure"))  
            { 
                WoW.CastSpell("Light of Tuure");
                return;
            }
			
			
			// Prayer of Mending Logic
			if (lowest <= PrayerofMending && WoW.CanCast("Prayer of Mending") && !WoW.IsSpellOnCooldown("Prayer of Mending") && !WoW.TargetHasBuff("Prayer of Mending"))
            {
                WoW.CastSpell("Prayer of Mending");
                return;
            }
			
			// Arcane Torrent Logic
			if (WoW.CanCast("Arcane Torrent") && ConfigFile.ReadValue<bool>("Priest-Holy-Sora", "ArcaneTorrent") && WoW.Mana <= 95 && !WoW.IsSpellOnCooldown("Arcane Torrent") && !WoW.TargetHasBuff("Arcane Torrent"))
            {
                WoW.CastSpell("Arcane Torrent");
                return;
            }
			
		}
	}
}


/*
[AddonDetails.db]
AddonAuthor=Sora
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,64843,Divine Hymn,1
Spell,47788,Guardian Spirit,2
Spell,34861,Holy Word Sanctify,3
Spell,596,Prayer of Healing,4
Spell,527,Purify,5
Spell,2050,Holy Word Serenity,6
Spell,2061,Flash Heal,7
Spell,2060,Heal,8
Spell,208065,Light of Tuure,9
Spell,139,Renew,10
Spell,33076,Prayer of Mending,11
Spell,121536,Angelic Feather,17
Spell,69179,Arcane Torrent,12
Spell,253109,Mount,13
Aura,139,Renew
Aura,121557,Angelic Feather
Aura,41635,Prayer of Mending
Aura,47788,Guardian Spirit
Aura,208065,Light of Tuure
Dispel,145206,Aqua Bomb,14
*/

