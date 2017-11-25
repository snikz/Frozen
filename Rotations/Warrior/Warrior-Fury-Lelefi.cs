using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;

namespace Frozen.Rotation
{
    public class WarriorFury : CombatRoutine
    {
		public override Form SettingsForm
		{
			get { return settingsForm.FormSettings; }

			set { }
		}

        private int level = 0;
		private int Ragepoints = 0;
		private Settings settingsForm;
		private bool validtargetmelee;
		
		private bool Autokick
		{
			get
			{
				return settingsForm.ReadSetting<bool>("Autokick");
			}
		}

		private bool AutoMount
		{
			get
			{
				return settingsForm.ReadSetting<bool>("AutoMount");
			}
		}

		private bool AutoAoe
		{
			get
			{
				return settingsForm.ReadSetting<bool>("AutoAoE");
			}
		}

		private bool AutoRetarget
		{
			get
			{
				return settingsForm.ReadSetting<bool>("Retarget");
			}
		}

		private bool AutoRegeneration
		{
			get
			{
				return settingsForm.ReadSetting<bool>("AutoRegeneration");
			}
		}

        public override void Initialize()
        {
            Log.Write("Welcome to Fury Warrior by Lelefi", Color.Green);
            Log.Write("Suggested build: 2xxx232", Color.Green);
			Log.Write("Stack Haste and Mastery!", Color.Green);
			
			settingsForm = new Settings("Fury-Warrior-Lelefi", WoWClass.Warrior);
			settingsForm.Add("Autokick", new CheckBox(), true);
			settingsForm.Add("Automount", new CheckBox(), true);
			settingsForm.Add("AutoAoE", new CheckBox(), true);
			settingsForm.Add("AutoRetarget", new CheckBox(), true);
			settingsForm.Add("AutoRegeneration", new CheckBox(), true);
			//settingsForm.Add("AntiFear", new CheckBox(), true);
			//settingsForm.Add("AutoPartyCommandingShout", new CheckBox(), true);
        }
		
		public int SetBoniListT20
		{
			get
			{
				string[] idSetboni= { 
				"TO Breastplate",
				"TO Cloak",
				"TO Handguards",
				"TO Greathelm",
				"TO Greaves",
				"TO Pauldrons"};
				int setboni= 0;
				for (int i = 0; i < idSetboni.Length; i++) 
					if (WoW.IsEquippedItem(idSetboni[i]))
						setboni++;
				return setboni;
			}
		}

        public override void Stop()
        {
        }

        public override void OutOfCombatPulse()
        {
            level = WoW.Level;
			
			//Automount add Mount spellID to Spellbook at bottom (replace mana ray with your own) and force bind a key in options
            if(!WoW.IsInCombat && WoW.CanCast("Mount") && WoW.IsOutdoors && !WoW.IsMoving && !WoW.PlayerIsChanneling && !WoW.IsMounted && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "Automount"))
            {
				WoW.CastSpell("Mount");
				return;
            }
        }

        public override void Pulse()
        {
			var TasteForBloodTime = WoW.PlayerBuffTimeRemaining("TasteForBlood");
			var EnrageTime = WoW.PlayerBuffTimeRemaining("Enrage");
			var FujiedaTime = WoW.PlayerBuffTimeRemaining("Fujieda");
			
			validtargetmelee = WoW.HasTarget && WoW.TargetIsEnemy && WoW.IsSpellInRange("Bloodthirst") && WoW.IsInCombat && !WoW.PlayerIsChanneling && WoW.TargetIsVisible;
			
			Ragepoints = WoW.Rage;

            if (WoW.PlayerHealthPercent == 0 || WoW.IsMounted || WoW.PlayerIsChanneling || WoW.PlayerHasBuff("Bladestorm")) return;

			// buff stuff
            if (validtargetmelee && UseCooldowns)
            {	
				if (WoW.CanCast("DragonRoar") && UseCooldowns && level >= 100 && WoW.Talent(7) == 3)
				{
					WoW.CastSpell("DragonRoar");
				}

                if (WoW.CanCast("BattleCry") && UseCooldowns && level >= 60 && WoW.Talent(7) != 3 || WoW.CanCast("BattleCry") && WoW.Talent(7) == 3 && WoW.PlayerHasBuff("DragonRoarBuff"))
                {
                    WoW.CastSpell("BattleCry");
                }

                if (WoW.CanCast("Avatar") && WoW.Talent(3) == 3 && WoW.PlayerHasBuff("BattleCryBuff"))
                {
                    WoW.CastSpell("Avatar");
					return;
                }

            }

			//Autokick
			if (WoW.CanCast("Pummel") && WoW.TargetPercentCast >= 40 && WoW.TargetIsCasting && WoW.TargetIsCastingAndSpellIsInterruptible && 
				ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "Autokick") && validtargetmelee)
			{
				WoW.CastSpell("Pummel");
				Log.Write("Pummel", Color.Green);
				return;
            }

			//Anti Fear
			//if (WoW.CanCast("Berserker Rage") && WoW.IsInCombat && WoW.PlayerHasDebuff("Fear") && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AntiFear"))
			//{
			//	WoW.CastSpell("Berserker Rage");
			//	return;
			//}
			
			//Heal stuff
            if (validtargetmelee && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoRegeneration") && level >= 36 && WoW.PlayerHealthPercent <= 20) 
            {	
				if (WoW.CanCast("Enraged Regeneration"))
                {
                    WoW.CastSpell("Enraged Regeneration");
                    return;
                }

				if (WoW.CanCast("Commanding Shout") && level >= 80)
                {
                    WoW.CastSpell("Commanding Shout");
                    return;
                }

                if (WoW.CanCast("Bloodthirst"))
                {
                    WoW.CastSpell("Bloodthirst");
                    return;
                }

                if (WoW.CanCast("Furious-Slash") && WoW.IsSpellOnCooldown("Bloodthirst"))
                {
                    WoW.CastSpell("Furious-Slash");
                    return;
                }

                if (WoW.CanCast("Raging-Blow") && WoW.IsSpellOnCooldown("Bloodthirst") && WoW.IsSpellOnCooldown("Furious-Slash"))
                {
                    WoW.CastSpell("Raging-Blow");
                    return;
                }

				Log.Write("Heal", Color.Green);
				return;
            }

			//AutoAoE
			if (combatRoutine.Type == RotationType.SingleTarget && WoW.CountEnemyNPCsInRange >= 3 && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE") && validtargetmelee) 
			{	
				if (WoW.CanCast("Bladestorm") && WoW.Talent(7) == 1 && EnrageTime > 2000)
				{
					WoW.CastSpell("Bladestorm");
					return;
				}

				if (WoW.CanCast("Bloodthirst") && FujiedaTime < 2000)
				{
					WoW.CastSpell("Bloodthirst");
					Log.Write("Fujieda", Color.Green);
					return;
				}
				
				if (WoW.CanCast("Rampage") && Ragepoints == 100 && level >= 18 && WoW.PlayerHasBuff("Meat-Cleaver") || WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Massacre") &&
					WoW.PlayerHasBuff("Meat-Cleaver"))
				{
					WoW.CastSpell("Rampage");
					return;
				}

				if (WoW.CanCast("Raging-Blow") && WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("Frothing") && Ragepoints < 100 && WoW.CountEnemyNPCsInRange < 4)
				{
					WoW.CastSpell("Raging-Blow");
					return;
				}

				if (WoW.CanCast("OdynsFury") && level >= 101 && WoW.SpellCooldownTimeRemaining("Raging-Blow") > 0 && WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("BattleCryBuff"))
                {
                    WoW.CastSpell("OdynsFury");
					Log.Write("OdynsFury", Color.Green);
                    return;
                }

				if (WoW.CanCast("Bloodthirst") && Ragepoints < 90 && !WoW.PlayerHasBuff("Enrage") && level >= 10 && WoW.PlayerHasBuff("Meat-Cleaver"))
                {
                    WoW.CastSpell("Bloodthirst");
                    return;
                }

				if (WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking-Ball") && WoW.Talent(3) == 1 && WoW.PlayerHasBuff("Enrage") || WoW.CanCast("Whirlwind") &&
					!WoW.PlayerHasBuff("Meat-Cleaver") && WoW.SpellCooldownTimeRemaining("Bloodthirst") <= 1000)
				{
					WoW.CastSpell("Whirlwind");
					return;
				}

				if (WoW.CanCast("Whirlwind"))
				{
					WoW.CastSpell("Whirlwind");
					return;
				}
				
				Log.Write("AoE", Color.Green);
				return;

            }

			//if (WoW.CanCast("Commanding Shout") && WoW.PartyAverageHealthPercent <= 50 && level >= 80 && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoPartyCommandingShout"))
			//{
			//	WoW.CastSpell("Commanding Shout");
			//	return;
			//}

            // Retarget stuff
			if (WoW.TargetHealthPercent == 0 && WoW.IsInCombat && WoW.RangeToTarget >= 5 && WoW.CountEnemyNPCsInRange >= 1 && !WoW.IsMounted &&
				ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoRetarget") || !WoW.HasTarget && WoW.IsInCombat && WoW.CountEnemyNPCsInRange >= 1 && WoW.RangeToTarget >=1 &&
				!WoW.IsMounted && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoRetarget")) 
            {
                WoW.TargetNextEnemy();
				Log.Write("Retarget", Color.Blue);
                return;
            }

			// Do Single Target Unbuffed Stuff here
            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && !WoW.PlayerHasBuff("BattleCryBuff") && validtargetmelee) 
			{
				if (WoW.CanCast("Bloodthirst") && FujiedaTime < 2000)
				{
					WoW.CastSpell("Bloodthirst");
					Log.Write("Fujieda", Color.Green);
					return;
				}
				
				if (WoW.CanCast("Raging-Blow") && WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("Frothing") && Ragepoints < 100)
				{
					WoW.CastSpell("Raging-Blow");
					return;
				}

				if (WoW.CanCast("Execute") && WoW.PlayerHasBuff("Ayala") && WoW.SpellCooldownTimeRemaining("Raging-Blow") > 1000 || WoW.CanCast("Execute") && WoW.PlayerHasBuff("Ayala") &&
					WoW.PlayerHasBuff("Massacre"))
				{
					WoW.CastSpell("Execute");
					return;
				}

				if (WoW.CanCast("Rampage") && Ragepoints >= 100 && level >= 18 || WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Massacre"))
				{
					WoW.CastSpell("Rampage");
					return;
				}

				if (WoW.CanCast("Bloodthirst"))
				{
					WoW.CastSpell("Bloodthirst");
					return;
				}

				if (WoW.CanCast("Raging-Blow") && level >= 13)
				{
					WoW.CastSpell("Raging-Blow");
					return;
				}

				if (WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking-Ball") && WoW.Talent(3) == 1 && WoW.PlayerHasBuff("Enrage"))
				{
					WoW.CastSpell("Whirlwind");
					return;
				}

				if (WoW.CanCast("Furious-Slash") && EnrageTime < 1000 && WoW.SpellCooldownTimeRemaining("Bloodthirst") > 1000 && Ragepoints < 90)
				{
					WoW.CastSpell("Furious-Slash");
					return;
				}

            }

			// Do Single Target Buffed Stuff here
            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && WoW.PlayerHasBuff("BattleCryBuff") && validtargetmelee)
			{
				if (WoW.CanCast("Bloodthirst") && FujiedaTime < 2000)
				{
					WoW.CastSpell("Bloodthirst");
					Log.Write("Fujieda", Color.Green);
					return;
				}
				if (WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Massacre") && EnrageTime <= 1000)
				{
					WoW.CastSpell("Rampage");
					return;
				}

				if (WoW.CanCast("Execute") && WoW.PlayerHasBuff("Ayala") && WoW.SpellCooldownTimeRemaining("Raging-Blow") > 1000 || WoW.CanCast("Execute") && WoW.PlayerHasBuff("Ayala") &&
					WoW.PlayerHasBuff("Massacre"))
				{
					WoW.CastSpell("Execute");
					return;
				}

				if (WoW.CanCast("Raging-Blow") && WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("Frothing") && Ragepoints < 100)
				{
					WoW.CastSpell("Raging-Blow");
					return;
				}

				if (WoW.CanCast("Rampage") && Ragepoints == 100)
				{
					WoW.CastSpell("Rampage");
					return;
				}

				if (WoW.CanCast("OdynsFury") && level >= 101 && WoW.SpellCooldownTimeRemaining("Raging-Blow") > 0 && WoW.PlayerHasBuff("Enrage"))
                {
                    WoW.CastSpell("OdynsFury");
					Log.Write("OdynsFury", Color.Green);
                    return;
                }

				if (WoW.CanCast("Bloodthirst") && EnrageTime <= 1000)
				{
					WoW.CastSpell("Bloodthirst");
					return;
				}

				if (WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking-Ball"))
				{
					WoW.CastSpell("Whirlwind");
					return;
				}

				if (WoW.CanCast("Raging-Blow"))
				{
					WoW.CastSpell("Raging-Blow");
					return;
				}

				if (WoW.CanCast("Bloodthirst"))
				{
					WoW.CastSpell("Bloodthirst");
					return;
				}

				if (WoW.CanCast("Furious-Slash") && EnrageTime < 1000 && WoW.SpellCooldownTimeRemaining("Bloodthirst") > 1000 && Ragepoints < 90)
				{
					WoW.CastSpell("Furious-Slash");
					return;
				}
            }

			// Do Single Target Execute Stuff here
            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level >= 60 && validtargetmelee)
            {
				if (WoW.CanCast("Bloodthirst") && FujiedaTime < 2000)
				{
					WoW.CastSpell("Bloodthirst");
					Log.Write("Fujieda", Color.Green);
					return;
				}

				if (WoW.CanCast("Execute") && !WoW.PlayerHasBuff("Juggernaut") && Ragepoints >= 25 || WoW.CanCast("Execute") && WoW.PlayerBuffTimeRemaining("Juggernaut") < 2000 && Ragepoints >= 25 
					|| WoW.CanCast("Execute") && WoW.SpellCooldownTimeRemaining("BattleCry") < 5000 && Ragepoints >= 25 || WoW.CanCast("Execute") && WoW.PlayerHasBuff("Ayala")
					|| WoW.CanCast("Execute") && Ragepoints >= 25 && WoW.PlayerHasBuff("BattleCryBuff") && WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("Frothing"))
				{
					WoW.CastSpell("Execute");
					return;
				}

				if (WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Massacre") && EnrageTime < 1000)
				{
					WoW.CastSpell("Rampage");
					return;
				}
				
				if (WoW.CanCast("Execute") && Ragepoints >= 25 && WoW.Talent(6) != 3 || WoW.CanCast("Execute") && Ragepoints >= 100 && WoW.Talent(6) == 3 )
				{
					WoW.CastSpell("Execute");
					return;
				}

				if (WoW.CanCast("OdynsFury") && level >= 101 && WoW.SpellCooldownTimeRemaining("Raging-Blow") > 0 && WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("BattleCryBuff"))
                {
                    WoW.CastSpell("OdynsFury");
					Log.Write("OdynsFury", Color.Green);
                    return;
                }

				if (WoW.CanCast("Bloodthirst"))
				{
					WoW.CastSpell("Bloodthirst");
					return;
				}

				if (WoW.CanCast("Furious-Slash") && SetBoniListT20 >= 2)
				{
					WoW.CastSpell("Furious-Slash");
					return;
				}

				if (WoW.CanCast("Raging-Blow"))
				{
					WoW.CastSpell("Raging-Blow");
					return;
				}

				if (WoW.CanCast("Furious-Slash") && EnrageTime < 1000 && WoW.SpellCooldownTimeRemaining("Bloodthirst") > 1000 && Ragepoints < 90)
				{
					WoW.CastSpell("Furious-Slash");
					return;
				}
            }

			//leveling
            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level <= 59 && validtargetmelee) 
            {
				if (WoW.CanCast("Execute") && Ragepoints >= 25 && level >= 8)
				{
					WoW.CastSpell("Execute");
					return;
				}

				if (WoW.CanCast("Bloodthirst") && Ragepoints < 25 && level >= 10)
				{
					WoW.CastSpell("Bloodthirst");
					return;
				}

				if (WoW.CanCast("Raging-Blow") && Ragepoints < 25 && WoW.IsSpellOnCooldown("Bloodthirst") && level >= 13)
				{
					WoW.CastSpell("Raging-Blow");
					return;
				}

				if (WoW.CanCast("Furious-Slash") && WoW.IsSpellOnCooldown("Raging-Blow") && !WoW.IsSpellOnGCD("Bloodthirst") && level >= 10 && !WoW.IsSpellOnGCD("Raging-Blow") &&
					TasteForBloodTime <= 4000)
				{
					WoW.CastSpell("Furious-Slash");
					return;
				}

            }

            if (combatRoutine.Type == RotationType.SingleTarget && level <= 9 && WoW.PlayerClassSpec == "Warrior-Arms" && validtargetmelee)
            {
                if (WoW.CanCast("Slam") && WoW.IsSpellOnCooldown("Mortal Strike") && Ragepoints >= 20)
                {
                    WoW.CastSpell("Slam");
                    return;
                }

                if (WoW.CanCast("Mortal Strike") && Ragepoints >= 20 && level >= 5)
                {
					WoW.CastSpell("Mortal Strike");
					return;
                }

            }

			// Aoe stuff
            if (combatRoutine.Type == RotationType.AOE && validtargetmelee && !ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE")) 
			{	
				if (WoW.CanCast("Bladestorm") && WoW.Talent(7) == 1 && EnrageTime > 2000)
				{
					WoW.CastSpell("Bladestorm");
					return;
				}

				if (WoW.CanCast("Bloodthirst") && FujiedaTime < 2000)
				{
					WoW.CastSpell("Bloodthirst");
					Log.Write("Fujieda", Color.Green);
					return;
				}
				
				if (WoW.CanCast("Rampage") && Ragepoints == 100 && level >= 18 && WoW.PlayerHasBuff("Meat-Cleaver") || WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Massacre") &&
					WoW.PlayerHasBuff("Meat-Cleaver"))
				{
					WoW.CastSpell("Rampage");
					return;
				}

				if (WoW.CanCast("Raging-Blow") && WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("Frothing") && Ragepoints < 100 && WoW.CountEnemyNPCsInRange < 4)
				{
					WoW.CastSpell("Raging-Blow");
					return;
				}

				if (WoW.CanCast("OdynsFury") && level >= 101 && WoW.SpellCooldownTimeRemaining("Raging-Blow") > 0 && WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("BattleCryBuff"))
                {
                    WoW.CastSpell("OdynsFury");
					Log.Write("OdynsFury", Color.Green);
                    return;
                }

				if (WoW.CanCast("Bloodthirst") && Ragepoints < 90 && !WoW.PlayerHasBuff("Enrage") && level >= 10 && WoW.PlayerHasBuff("Meat-Cleaver"))
                {
                    WoW.CastSpell("Bloodthirst");
                    return;
                }

				if (WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking-Ball") && WoW.Talent(3) == 1 && WoW.PlayerHasBuff("Enrage") || WoW.CanCast("Whirlwind") &&
					!WoW.PlayerHasBuff("Meat-Cleaver") && WoW.SpellCooldownTimeRemaining("Bloodthirst") <= 1000)
				{
					WoW.CastSpell("Whirlwind");
					return;
				}

				if (WoW.CanCast("Whirlwind"))
				{
					WoW.CastSpell("Whirlwind");
					return;
				}
				
				Log.Write("AoE", Color.Green);
				return;
            }

            if (combatRoutine.Type == RotationType.Cleave) //
            {

            }
        }
    }
}

/*
[AddonDetails.db]
AddonAuthor=Lelefi
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,23881,Bloodthirst,
Spell,100,Charge,
Spell,6552,Pummel,
Spell,1464,Slam,
Spell,12294,Mortal Strike,
Spell,85288,Raging-Blow,
Spell,100130,Furious-Slash,
Spell,5308,Execute,
Spell,184367,Rampage,
Spell,190411,Whirlwind,
Spell,1719,BattleCry,
Spell,118000,DragonRoar,
Spell,107574,Avatar,
Spell,205545,OdynsFury,
Spell,18499,Berserker Rage,
Spell,253109,Mount,
Spell,97462,Commanding Shout,
Spell,184364,Enraged Regeneration,
Spell,46924,Bladestorm,
Aura,206333,TasteForBlood
Aura,184364,Enraged Regeneration
Aura,118000,DragonRoarBuff
Aura,1719,BattleCryBuff
Aura,200863,SenseDeath
Aura,184362,Enrage
Aura,201009,Juggernaut
Aura,206316,Massacre
Aura,85739,Meat-Cleaver
Aura,215570,Wrecking-Ball
Aura,215572,Frothing
Aura,251341,Fear
Aura,107574,AvatarBuff
Aura,207776,Fujieda
Aura,225947,Ayala
Aura,46924,Bladestorm
Item,147187,TO Breastplate
Item,147188,TO Cloak
Item,147189,TO Handguards
Item,147190,TO Greathelm
Item,147191,TO Greaves
Item,147192,TO Pauldrons

*/
