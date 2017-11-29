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
		private bool validtargetaoe;
		public int rampcount2 = 0;
		public int battlecrycount = 0;
		
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

		private bool AvatarOnBoss
		{
			get
			{
				return settingsForm.ReadSetting<bool>("AvatarOnBoss");
			}
		}

		private bool T20Rotation
		{
			get
			{
				return settingsForm.ReadSetting<bool>("T20Rotation");
			}
		}

		private bool T21Rotation
		{
			get
			{
				return settingsForm.ReadSetting<bool>("T21Rotation");
			}
		}

        public override void Initialize()
        {
            Log.Write("Welcome to Fury Warrior CR by Lelefi", Color.Green);
            Log.Write("Suggested build: 2xxx232 for T20", Color.Red);
			Log.Write("Suggested build: 2xxx212 for T21", Color.Red);
			Log.Write("Check Settings for Rotation Type!", Color.Red);
			Log.Write("Reload Ui after changing Talents or Rotation Type!", Color.Red);
			Log.Write("Stack Haste and Mastery!", Color.Green);
			
			settingsForm = new Settings("Fury-Warrior-Lelefi", WoWClass.Warrior);
			settingsForm.Add("Autokick", new CheckBox(), true);
			settingsForm.Add("Automount", new CheckBox(), true);
			settingsForm.Add("AutoAoE", new CheckBox(), true);
			settingsForm.Add("AutoRetarget", new CheckBox(), true);
			settingsForm.Add("AutoRegeneration", new CheckBox(), true);
			settingsForm.Add("AvatarOnBoss", new CheckBox(), true);
			settingsForm.Add("T20Rotation", new CheckBox(), true);
			settingsForm.Add("T21Rotation", new CheckBox(), true);
			//settingsForm.Add("AntiFear", new CheckBox(), true);
			//settingsForm.Add("AutoPartyCommandingShout", new CheckBox(), true);
        }
		
		public int SetBoniListT20
		{
			get
			{
				string[] idSetboniT20= { 
				"TO Breastplate",
				"TO Cloak",
				"TO Handguards",
				"TO Greathelm",
				"TO Greaves",
				"TO Pauldrons"};
				int setboniT20= 0;
				for (int i = 0; i < idSetboniT20.Length; i++) 
					if (WoW.IsEquippedItem(idSetboniT20[i]))
						setboniT20++;
				return setboniT20;
			}
		}

		public int SetBoniListT21
		{
			get
			{
				string[] idSetboniT21= { 
				"Jug Breastplate",
				"Jug Cloak",
				"Jug Gauntlets",
				"Jug Helm",
				"Jug Legplates",
				"Jug Pauldrons"};
				int setboniT21= 0;
				for (int i = 0; i < idSetboniT21.Length; i++) 
					if (WoW.IsEquippedItem(idSetboniT21[i]))
						setboniT21++;
				return setboniT21;
			}
		}

        public override void Stop()
        {
        }

        public override void OutOfCombatPulse()
        {
            level = WoW.Level;
			battlecrycount = 0;
			
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
			var Bloodbathtime = WoW.PlayerBuffTimeRemaining("Bloodbath");
			
			validtargetmelee = WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=5 && WoW.IsInCombat && !WoW.PlayerIsChanneling && WoW.TargetIsVisible;
			validtargetaoe = WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=5 && WoW.IsInCombat && !WoW.PlayerIsChanneling && WoW.TargetIsVisible && WoW.CountEnemyNPCsInRange >=1;			

			Ragepoints = WoW.Rage;

            if (WoW.PlayerHealthPercent == 0 || WoW.IsMounted || WoW.PlayerIsChanneling || WoW.PlayerHasBuff("Bladestorm") || !WoW.IsInCombat) return;

            // Retarget stuff
			if (WoW.TargetHealthPercent == 0 && WoW.IsInCombat && WoW.RangeToTarget >= 5 && WoW.CountEnemyNPCsInRange >= 1 && !WoW.IsMounted &&
				ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoRetarget") || !WoW.HasTarget && WoW.IsInCombat && WoW.CountEnemyNPCsInRange >= 1 && WoW.RangeToTarget >=1 &&
				!WoW.IsMounted && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoRetarget")) 
            {
                WoW.TargetNextEnemy();
				Log.Write("Retarget", Color.Blue);
                return;
            }


			//Fujeda Upkeep
			/*if (WoW.CanCast("Bloodthirst") && FujiedaTime < 2000 && validtargetmelee)
			{
				WoW.CastSpell("Bloodthirst");
				Log.Write("Fujieda", Color.Green);
				return;
			}*/
			
			// buff stuff
            if (UseCooldowns && (validtargetmelee || validtargetaoe))
            {	
				if (WoW.CanCast("DragonRoar") && level >= 100 && WoW.Talent(7) == 3)
				{
					WoW.CastSpell("DragonRoar");
				}

                //if (WoW.CanCast("BattleCry") && level >= 60 && SetBoniListT21 <=0 && (WoW.Talent(7) == 3 && WoW.PlayerHasBuff("DragonRoarBuff") || WoW.Talent(7) != 3))
                //{
                //    WoW.CastSpell("BattleCry");
                //}

				if (combatRoutine.Type == RotationType.SingleTarget && WoW.CanCast("BattleCry") /*&& SetBoniListT21 >= 4*/ && !ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE") && 
					(WoW.IsSpellOnCooldown("Rampage") && WoW.Rage < 50 && battlecrycount >= 1 || battlecrycount == 0))
				{
					WoW.CastSpell("BattleCry");
					battlecrycount +=1;
				}

				if (WoW.CanCast("BattleCry") /*&& SetBoniListT21 >= 4*/ && WoW.PlayerHasBuff("Meat-Cleaver") && (combatRoutine.Type == RotationType.AOE ||
					combatRoutine.Type == RotationType.SingleTarget && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE")))
				{
					WoW.CastSpell("BattleCry");
				}

                if (WoW.CanCast("Avatar") && WoW.Talent(3) == 3 && (WoW.PlayerHasBuff("BattleCryBuff") && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AvatarOnBoss") &&
					WoW.HasBossTarget || WoW.PlayerHasBuff("BattleCryBuff") && !ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AvatarOnBoss")))
                {
                    WoW.CastSpell("Avatar");
                }

                if (WoW.CanCast("Bloodbath") && WoW.Talent(6) == 1 && (WoW.PlayerHasBuff("BattleCryBuff") || WoW.SpellCooldownTimeRemaining("BattleCry") >= 20000))
                {
                    WoW.CastSpell("Bloodbath");
                }
            }

			//Autokick
			if (WoW.CanCast("Pummel") && WoW.TargetPercentCast >= Random.Next(50, 70) && WoW.TargetIsCastingAndSpellIsInterruptible && 
				ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "Autokick") && validtargetmelee)
			{
				WoW.CastSpell("Pummel");
				Log.Write("Pummel", Color.Green);
				return;
            }

			//Heal stuff
            if (validtargetmelee && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoRegeneration") && level >= 36 && WoW.PlayerHealthPercent <= 20) 
            {	
				if (WoW.CanCast("Enraged Regeneration"))
                {
                    WoW.CastSpell("Enraged Regeneration");
                }

				if (WoW.CanCast("Commanding Shout") && level >= 80)
                {
                    WoW.CastSpell("Commanding Shout");
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

			// T21
			if (ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "T21Rotation") && !ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "T20Rotation"))
			{
				// Aoe stuff T21 Unbuffed + auto
				if (combatRoutine.Type == RotationType.AOE && validtargetaoe && !WoW.PlayerHasBuff("BattleCryBuff") && !ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE") ||
					combatRoutine.Type == RotationType.SingleTarget && WoW.CountEnemyNPCsInRange >= 3 && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE") && validtargetaoe &&
					!WoW.PlayerHasBuff("BattleCryBuff"))
				{	
					if (WoW.CanCast("Bloodthirst") && Ragepoints < 100 && WoW.PlayerHasBuff("Meat-Cleaver"))
					{
						WoW.CastSpell("Bloodthirst");
						return;
					}
					
					if (WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Meat-Cleaver") && Ragepoints >= 100)
					{
						WoW.CastSpell("Rampage");
						Log.Write("Rampage", Color.Blue);
						return;
					}

					if (WoW.CanCast("Whirlwind") && !WoW.PlayerHasBuff("Meat-Cleaver"))
					{
						WoW.CastSpell("Whirlwind");
						return;
					}
				}

				// Aoe stuff T21 Buffed + auto
				if (combatRoutine.Type == RotationType.AOE && validtargetaoe && WoW.PlayerHasBuff("BattleCryBuff") && !ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE") ||
					combatRoutine.Type == RotationType.SingleTarget && WoW.CountEnemyNPCsInRange >= 3 && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE") && validtargetaoe &&
					WoW.PlayerHasBuff("BattleCryBuff"))
				{	
					if (WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Meat-Cleaver") && Ragepoints >= 85)
					{
						WoW.CastSpell("Rampage");
						Log.Write("Rampage", Color.Red);
						return;
					}

					if (WoW.CanCast("OdynsFury"))
					{
						WoW.CastSpell("OdynsFury");
						Log.Write("OdynsFury", Color.Pink);
						return;
					}

					if (WoW.CanCast("Whirlwind") && !WoW.PlayerHasBuff("Meat-Cleaver"))
					{
						WoW.CastSpell("Whirlwind");
						return;
					}

					if (WoW.CanCast("Bloodthirst") && Ragepoints < 100 && WoW.PlayerHasBuff("Meat-Cleaver"))
					{
						WoW.CastSpell("Bloodthirst");
						return;
					}
				}

				//T21
				// Do Single Target Unbuffed Stuff here T21
				if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && !WoW.PlayerHasBuff("BattleCryBuff") && validtargetmelee)
				{
					if (WoW.CanCast("Rampage") && (Ragepoints >= 100 || WoW.SpellCooldownTimeRemaining("BattleCry") < 1000 && Ragepoints >= 85 && UseCooldowns)) 
					{
						WoW.CastSpell("Rampage");
						return;
					}

					if (WoW.CanCast("Execute") && WoW.PlayerHasBuff("Ayala"))
					{
						WoW.CastSpell("Execute");
						return;
					}

					if (WoW.CanCast("Bloodthirst") && Ragepoints < 100 )
					{
						WoW.CastSpell("Bloodthirst");
						Log.Write("Bloodthirst", Color.Red);
						return;
					}

					if (WoW.CanCast("Whirlwind") && (WoW.PlayerHasBuff("Wrecking-Ball") && WoW.PlayerHasBuff("Enrage") && Ragepoints < 100))
					{
						WoW.CastSpell("Whirlwind");
						return;
					}

					if (WoW.CanCast("Raging-Blow") && WoW.PlayerHasBuff("Enrage") && Ragepoints < 100 && WoW.SpellCooldownTimeRemaining("Bloodthirst") > 650)
					{
						WoW.CastSpell("Raging-Blow");
						return;
					}

					if (WoW.CanCast("Furious-Slash") && WoW.SpellCooldownTimeRemaining("Bloodthirst") > 650 && WoW.Rage < 100)
					{
						WoW.CastSpell("Furious-Slash");
						return;
					}
				}

				// Do Single Target Buffed Stuff here T21
				if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && WoW.PlayerHasBuff("BattleCryBuff") && validtargetmelee)
				{
					if (WoW.CanCast("Rampage") && (WoW.PlayerHasBuff("Massacre") || Ragepoints >= 85))
					{
						WoW.CastSpell("Rampage");
						return;
					}

					if (WoW.CanCast("OdynsFury") && WoW.Rage < 100)
					{
						WoW.CastSpell("OdynsFury");
						Log.Write("OdynsFury", Color.Pink);
						return;
					}

					if (WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking-Ball") && Ragepoints < 100)
					{
						WoW.CastSpell("Whirlwind");
						return;
					}

					if (WoW.CanCast("Bloodthirst") && Ragepoints < 100 && WoW.SpellCooldownTimeRemaining("BattleCry") < 49000)
					{
						WoW.CastSpell("Bloodthirst");
						Log.Write("Bloodthirst", Color.Green);
						return;
					}

					if (WoW.CanCast("Raging-Blow") && Ragepoints < 100 && WoW.SpellCooldownTimeRemaining("Bloodthirst") > 650 && WoW.PlayerHasBuff("Enrage"))
					{
						WoW.CastSpell("Raging-Blow");
						return;
					}
				}

				// Do Single Target Unbuffed Execute Stuff here T21
				if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level >= 60 && validtargetmelee && !WoW.PlayerHasBuff("BattleCryBuff") &&
					!WoW.IsEquippedItem("SouloftheBattlelord"))
				{
					if (WoW.CanCast("Bloodthirst") && Ragepoints < 25)
					{
						WoW.CastSpell("Bloodthirst");
						return;
					}

					if (WoW.CanCast("Execute") && (WoW.PlayerHasBuff("Ayala") || (Ragepoints >= 25 || (!WoW.PlayerHasBuff("Juggernaut") && Ragepoints >= 25 ||
						WoW.PlayerBuffTimeRemaining("Juggernaut") < 2000 && Ragepoints >= 25))))
					{
						WoW.CastSpell("Execute");
						return;
					}

					if (WoW.CanCast("Raging-Blow") && WoW.PlayerHasBuff("Enrage") && Ragepoints < 25)
					{
						WoW.CastSpell("Raging-Blow");
						return;
					}

					if (WoW.CanCast("Furious-Slash") && WoW.SpellCooldownTimeRemaining("Bloodthirst") > 650 && Ragepoints < 25)
					{
						WoW.CastSpell("Furious-Slash");
						return;
					}
				}

				// Do Single Target Buffed Execute Stuff here T21
				if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level >= 60 && validtargetmelee && WoW.PlayerHasBuff("BattleCryBuff") &&
					!WoW.IsEquippedItem("SouloftheBattlelord"))
				{
					if (WoW.CanCast("Execute") && (WoW.PlayerHasBuff("Ayala") || (Ragepoints >= 25 || (!WoW.PlayerHasBuff("Juggernaut") && Ragepoints >= 25 ||
						WoW.PlayerBuffTimeRemaining("Juggernaut") < 2000 && Ragepoints >= 25))))
					{
						WoW.CastSpell("Execute");
						return;
					}

					if (WoW.CanCast("Rampage") && (WoW.PlayerHasBuff("Massacre") && (!WoW.PlayerHasBuff("Enrage") || EnrageTime < 1000)))
					{
						WoW.CastSpell("Rampage");
						return;
					}

					if (WoW.CanCast("Bloodthirst") && Ragepoints < 25)
					{
						WoW.CastSpell("Bloodthirst");
						return;
					}
				}

				// Do Single Target Buffed Execute Stuff here T21 SouloftheBattlelord
				if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level >= 60 && validtargetmelee && !WoW.PlayerHasBuff("BattleCryBuff") &&
					WoW.IsEquippedItem("SouloftheBattlelord"))
				{
					if (WoW.CanCast("Execute") && (WoW.PlayerHasBuff("Ayala") || (Ragepoints >= 25 || (!WoW.PlayerHasBuff("Juggernaut") && Ragepoints >= 25 ||
						WoW.PlayerBuffTimeRemaining("Juggernaut") < 2000 && Ragepoints >= 25))))
					{
						WoW.CastSpell("Execute");
						return;
					}

					if (WoW.CanCast("Rampage") && (WoW.PlayerHasBuff("Massacre") && (!WoW.PlayerHasBuff("Enrage") || EnrageTime < 1000)))
					{
						WoW.CastSpell("Rampage");
						return;
					}

					if (WoW.CanCast("Bloodthirst") && Ragepoints < 25)
					{
						WoW.CastSpell("Bloodthirst");
						return;
					}
				}
			}

			// T20
			if (!ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "T21Rotation") && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "T20Rotation"))
			{
				//AutoAoET20
				if (combatRoutine.Type == RotationType.SingleTarget && WoW.CountEnemyNPCsInRange >= 3 && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE") && validtargetmelee &&
					SetBoniListT21 <= 0) 
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

					if (WoW.CanCast("Rampage") && Ragepoints >= 100 && level >= 18 && WoW.PlayerHasBuff("Meat-Cleaver") || WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Massacre") &&
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

				// Do Single Target Unbuffed Stuff here T20
				if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && !WoW.PlayerHasBuff("BattleCryBuff") && validtargetmelee) 
				{
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

				// Do Single Target Buffed Stuff here T20
				if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && WoW.PlayerHasBuff("BattleCryBuff") && validtargetmelee && WoW.Talent(6) == 3)
				{
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

					if (WoW.CanCast("Rampage") && Ragepoints >= 100)
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

				// Do Single Target Execute Stuff here T20

				if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level >= 60 && validtargetmelee)
				{
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

				// Aoe stuff
				if (combatRoutine.Type == RotationType.AOE && validtargetmelee && !ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoAoE")) 
				{	
					if (WoW.CanCast("Bladestorm") && WoW.Talent(7) == 1 && EnrageTime > 2000)
					{
						WoW.CastSpell("Bladestorm");
						return;
					}

					if (WoW.CanCast("Rampage") && Ragepoints >= 100 && level >= 18 && WoW.PlayerHasBuff("Meat-Cleaver") || WoW.CanCast("Rampage") && WoW.PlayerHasBuff("Massacre") &&
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
						!WoW.PlayerHasBuff("Meat-Cleaver") && WoW.SpellCooldownTimeRemaining("Bloodthirst") <= 1500)
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
			}
/*			

			//Anti Fear
			//if (WoW.CanCast("Berserker Rage") && WoW.IsInCombat && WoW.PlayerHasDebuff("Fear") && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AntiFear"))
			//{
			//	WoW.CastSpell("Berserker Rage");
			//	return;
			//}

			//if (WoW.CanCast("Commanding Shout") && WoW.PartyAverageHealthPercent <= 50 && level >= 80 && ConfigFile.ReadValue<bool>("Fury-Warrior-Lelefi", "AutoPartyCommandingShout"))
			//{
			//	WoW.CastSpell("Commanding Shout");
			//	return;
			//}

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
*/
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
Spell,12292,Bloodbath,
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
Aura,12292,Bloodbath,
Item,147187,TO Breastplate
Item,147188,TO Cloak
Item,147189,TO Handguards
Item,147190,TO Greathelm
Item,147191,TO Greaves
Item,147192,TO Pauldrons
Item,152178,Jug Breastplate
Item,152179,Jug Cloak
Item,152180,Jug Gauntlets
Item,152181,Jug Helm
Item,152182,Jug Legplates
Item,152183,Jug Pauldrons
Item,151650,SouloftheBattlelord
*/
