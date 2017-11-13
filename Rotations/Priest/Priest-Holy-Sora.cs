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
		
		public override void Initialize()
		{
		// Instructions for user.
		settingsForm = new Settings("Priest-Holy-Sora", WoWClass.Priest);                                                                     
		Log.Write("Holy Priest by Sora", Color.Blue);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("This routine supports 3131312", Color.Magenta);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("Make sure to set up your healing keybinds", Color.Blue);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("In Proving grounds the tank ID is 5", Color.Magenta);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("If you have any feedback message me in frozen discord or directly", Color.Blue);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("I will be adding all the fruit to it soon.", Color.Magenta);
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
			if (averageHp < 50 && WoW.CanCast("Divine Hymn") && !WoW.IsSpellOnCooldown("Divine Hymn"))
			{
                WoW.CastSpell("Divine Hymn");
				return;
			}
			
			// Guardian Spirit Logic
			if (lowest <= 20 && WoW.CanCast("Guardian Spirit") && !WoW.IsSpellOnCooldown("Guardian Spirit") && WoW.TankId == currentTargetId)
            {
                WoW.CastSpell("Guardian Spirit");
                return;
            }
			
			//Holy Word: Sanctify Logic
			if (averageHp < 55 && WoW.CanCast("Holy Word Sanctify") && !WoW.IsSpellOnCooldown("Holy Word Sanctify"))
			{
                WoW.CastSpell("Holy Word Sanctify");
				return;
			}
			
			//Prayer of Healing Logic
			if (averageHp < 65 && WoW.CanCast("Prayer of Healing") && !WoW.IsSpellOnCooldown("Prayer of Healing"))
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
			if (lowest <= 50 && WoW.CanCast("Holy Word Serenity") && !WoW.IsSpellOnCooldown("Holy Word Serenity"))
            { 
                WoW.CastSpell("Holy Word Serenity");
                return;
            }
			
			// Flash Heal Logic
            if (lowest <= 50 && WoW.CanCast("Flash Heal") && !WoW.IsMoving)
            {
                WoW.CastSpell("Flash Heal");
                return;
            }
			
			// Heal Logic
            if (lowest <= 80 && WoW.CanCast("Heal") && !WoW.IsMoving)
            {
                WoW.CastSpell("Heal");
                return;
            }
			 
			//Light of Tuure Logic
			if (lowest <= 85 &&WoW.CanCast("Light of Tuure") && WoW.Level == 110 &&  !WoW.IsSpellOnCooldown("Light of Tuure") && !WoW.TargetHasBuff("Light of Tuure"))  
            { 
                WoW.CastSpell("Light of Tuure");
                return;
            }
			
			// Renew Logic
			if (lowest <= 90 && WoW.CanCast("Renew") && WoW.IsMoving && !WoW.TargetHasBuff("Renew"))
            {
                WoW.CastSpell("Renew");
                return;
            }
			
			// Prayer of Mending Logic
			if (lowest <= 95 && WoW.CanCast("Prayer of Mending") && !WoW.IsSpellOnCooldown("Prayer of Mending") && !WoW.TargetHasBuff("Prayer of Mending"))
            {
                WoW.CastSpell("Prayer of Mending");
                return;
            }
			
			// // Arcane Torrent Logic
			// if (WoW.CanCast("Arcane Torrent") && WoW.Mana <= 95 && !WoW.IsSpellOnCooldown("Arcane Torrent") && !WoW.TargetHasBuff("Arcane Torrent"))
            // {
                // WoW.CastSpell("Arcane Torrent");
                // return;
            // }
			
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
Spell,69179,Arcane Torrent,12
Aura,139,Renew
Aura,41635,Prayer of Mending
Aura,47788,Guardian Spirit
Aura,208065,Light of Tuure
Dispel,145206,Aqua Bomb,13
*/

