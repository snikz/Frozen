using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using System.Diagnostics;
using System;

namespace Frozen.Rotation
{
    public class WarriorFury : CombatRoutine
    {

        public override Form SettingsForm { get; set; }

        private bool validtargetmelee;
        private int level = 0;
        
        public override void Initialize()
        {
            Log.Write("Welcome to Fury Warrior by Lelefi", Color.Green);
            Log.Write("Suggested build: 2xxx232", Color.Green);
			Log.Write("Stack Haste and Mastery!", Color.Green);
        }

        public override void Stop()
        {
        }

        public override void OutOfCombatPulse()
        {
            level = WoW.Level;
        }

        public override void Pulse()
        {
            //validtargetmelee = WoW.HasTarget && WoW.IsInCombat && !WoW.PlayerIsChanneling && WoW.TargetIsVisible && WoW.RangeToTarget < 6;
			
			var TasteForBloodTime = WoW.PlayerBuffTimeRemaining("TasteForBlood");
			var EnrageTime = WoW.PlayerBuffTimeRemaining("Enrage");
			
            if (WoW.PlayerHealthPercent == 0 || WoW.IsMounted) return;
            if (WoW.PlayerIsChanneling) return;

            if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=6 && WoW.IsInCombat) // buff stuff
            {
                if (WoW.CanCast("BattleCry") && UseCooldowns && level >= 60)
                {
                    WoW.CastSpell("BattleCry");
                    return;
                }

                if (WoW.CanCast("Avatar") && WoW.Talent(3) == 3 && WoW.PlayerHasBuff("BattleCryBuff"))
                {
                    WoW.CastSpell("Avatar");
                    return;
                }

                if (WoW.CanCast("OdynsFury") && level >= 101 && WoW.IsSpellOnCooldown("Raging Blow") && WoW.PlayerHasBuff("BattleCryBuff") && !WoW.IsSpellOnGCD("Raging Blow") 
					&& WoW.PlayerHasBuff("Frothing") && WoW.Rage < 100)
                {
                    WoW.CastSpell("OdynsFury");
                    return;
                }

            }

            if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=6 && WoW.IsInCombat && WoW.PlayerHasBuff("Enraged Regeneration")) //Heal stuff
            {
                if (WoW.CanCast("Bloodthirst") && level >= 12)
                {
                    WoW.CastSpell("Bloodthirst");
                    return;
                }

                if (WoW.CanCast("Furious Slash") && WoW.IsSpellOnCooldown("Bloodthirst") && level >= 12)
                {
                    WoW.CastSpell("Furious Slash");
                    return;
                }

                if (WoW.CanCast("Raging Blow") && WoW.IsSpellOnCooldown("Bloodthirst") && WoW.IsSpellOnCooldown("Furious Slash") && level >= 13)
                {
                    WoW.CastSpell("Raging Blow");
                    return;
                }

            }

            // target stuff
            if (WoW.TargetHealthPercent == 0 && WoW.IsInCombat && WoW.RangeToTarget <= 5 && WoW.CountEnemyNPCsInRange >= 1 && !WoW.IsMounted || !WoW.HasTarget && WoW.IsInCombat && WoW.CountEnemyNPCsInRange >= 1 && WoW.RangeToTarget <= 6 && !WoW.IsMounted)
            {
                WoW.TargetNextEnemy();
                return;
            }

            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && !WoW.PlayerHasBuff("BattleCryBuff")) // Do Single Target Unbuffed Stuff here
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=6 && WoW.IsInCombat)
                {
                    if (WoW.CanCast("Rampage") && WoW.Rage == 100 && level >= 18)
                    {
                        WoW.CastSpell("Rampage");
                        return;
                    }

                    if ((WoW.CanCast("Bloodthirst") && !WoW.PlayerHasBuff("Enrage") && WoW.Rage < 100 && level >= 10) || WoW.CanCast("Bloodthirst") && WoW.IsSpellOnCooldown("Raging Blow") 
						&& WoW.Rage < 100 && level >= 10)
                    {
                        WoW.CastSpell("Bloodthirst");
                        return;
                    }

                    if (WoW.CanCast("Raging Blow") && level >= 13)
                    {
                        WoW.CastSpell("Raging Blow");
                        return;
                    }

                    if (WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking Ball") && WoW.IsSpellOnCooldown("Raging Blow") && WoW.Talent(3) == 1 && WoW.PlayerHasBuff("Enrage"))
                    {
                        WoW.CastSpell("Whirlwind");
                        return;
                    }

					if (WoW.CanCast("Furious Slash") && WoW.IsSpellOnCooldown("Raging Blow") && !WoW.IsSpellOnGCD("Bloodthirst") && level >= 10 && !WoW.IsSpellOnGCD("Raging Blow") && TasteForBloodTime <= 4000 && WoW.Rage <= 90 && WoW.SpellCooldownTimeRemaining("Bloodthirst") <= 1000)
                    {
                        WoW.CastSpell("Furious Slash");
                        return;
                    }


                }

            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && WoW.PlayerHasBuff("BattleCryBuff")) // Do Single Target Buffed Stuff here
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=6 && WoW.IsInCombat)
                {
                    if (WoW.CanCast("Rampage") && WoW.Rage == 100)
                    {
                        WoW.CastSpell("Rampage");
                        return;
                    }

                    if (WoW.CanCast("Raging Blow"))
                    {
                        WoW.CastSpell("Raging Blow");
                        return;
                    }

                    if (WoW.CanCast("Bloodthirst"))
                    {
                        WoW.CastSpell("Bloodthirst");
                        return;
                    }

                }

            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level >= 60) // Do Single Target Execute Stuff here
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=6 && WoW.IsInCombat)
                {
					if (WoW.CanCast("Execute") && !WoW.PlayerHasBuff("Juggernaut") || WoW.CanCast("Execute") && WoW.PlayerBuffTimeRemaining("Juggernaut") < 2000 || WoW.CanCast("Execute") &&
						WoW.SpellCooldownTimeRemaining("BattleCry") < 10000 || WoW.CanCast("Execute") && WoW.Rage >= 100 || WoW.CanCast("Execute") && WoW.PlayerHasBuff("SenseDeath") &&
						WoW.Rage >= 100 || WoW.CanCast("Execute") && WoW.PlayerHasBuff("BattleCryBuff") && WoW.PlayerHasBuff("Frothing"))
                    {
                        WoW.CastSpell("Execute");
                        return;
                    }
                    if (WoW.CanCast("Bloodthirst") && WoW.Rage < 100 && WoW.SpellCooldownTimeRemaining("BattleCry") >= 11000 || WoW.CanCast("Bloodthirst") && WoW.Rage < 25 && level >= 10 && WoW.SpellCooldownTimeRemaining("BattleCry") <= 9000)
                    {
                        WoW.CastSpell("Bloodthirst");
                        return;
                    }

                    if (WoW.CanCast("Raging Blow") && WoW.Rage < 100 && WoW.IsSpellOnCooldown("Bloodthirst") && WoW.SpellCooldownTimeRemaining("BattleCry") >= 11000 || WoW.CanCast("Raging Blow") && WoW.Rage < 25 && WoW.IsSpellOnCooldown("Bloodthirst") && level >= 13 && WoW.SpellCooldownTimeRemaining("BattleCry") <= 9000)
                    {
                        WoW.CastSpell("Raging Blow");
                        return;
                    }

                    if (WoW.CanCast("Furious Slash") && WoW.IsSpellOnCooldown("Raging Blow") && !WoW.IsSpellOnGCD("Bloodthirst") && level >= 10 && !WoW.IsSpellOnGCD("Raging Blow") && TasteForBloodTime <= 4000 && WoW.SpellCooldownTimeRemaining("BattleCry") >= 11000)
                    {
                        WoW.CastSpell("Furious Slash");
                        return;
                    }

                }

            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level <= 59) //leveling
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=6 && WoW.IsInCombat)
                {
                    if (WoW.CanCast("Execute") && WoW.Rage >= 25 && level >= 8)
                    {
                        WoW.CastSpell("Execute");
                        return;
                    }

                    if (WoW.CanCast("Bloodthirst") && WoW.Rage < 25 && level >= 10)
                    {
                        WoW.CastSpell("Bloodthirst");
                        return;
                    }

                    if (WoW.CanCast("Raging Blow") && WoW.Rage < 25 && WoW.IsSpellOnCooldown("Bloodthirst") && level >= 13)
                    {
                        WoW.CastSpell("Raging Blow");
                        return;
                    }

                    if (WoW.CanCast("Furious Slash") && WoW.IsSpellOnCooldown("Raging Blow") && !WoW.IsSpellOnGCD("Bloodthirst") && level >= 10 && !WoW.IsSpellOnGCD("Raging Blow") &&
						TasteForBloodTime <= 4000)
                    {
                        WoW.CastSpell("Furious Slash");
                        return;
                    }

                }
            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && level <= 9 && WoW.PlayerClassSpec == "Warrior-Arms") // more leveling
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=6 && WoW.IsInCombat)
                {
                    if (WoW.CanCast("Slam") && WoW.IsSpellOnCooldown("Mortal Strike") && WoW.Rage >= 20)
                    {
                        WoW.CastSpell("Slam");
                        return;
                    }

                    if (WoW.CanCast("Mortal Strike") && WoW.Rage >= 20 && level >= 5)
                    {
                        WoW.CastSpell("Mortal Strike");
                        return;
                    }

                }

            if (combatRoutine.Type == RotationType.AOE) // Aoe stuff
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <=6 && WoW.IsInCombat)
                {
                    if (WoW.CanCast("Whirlwind") && !WoW.PlayerHasBuff("Meat-Cleaver") && level >= 28 || WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking Ball") && WoW.Talent(3) == 1 
						&& level >= 45)
                    {
                        WoW.CastSpell("Whirlwind");
                        return;
                    }

                    if (WoW.CanCast("Rampage") && WoW.Rage == 100 && WoW.PlayerHasBuff("Meat-Cleaver") && level >= 18)
                    {
                        WoW.CastSpell("Rampage");
                        return;
                    }

                    if (WoW.CanCast("Furious Slash") && WoW.IsSpellOnCooldown("Raging Blow") && !WoW.IsSpellOnGCD("Bloodthirst") && level >= 10 && !WoW.IsSpellOnGCD("Raging Blow") 
						&& TasteForBloodTime <= 4000)
                    {
                        WoW.CastSpell("Furious Slash");
                        return;
                    }

                    if (WoW.CanCast("Bloodthirst") && WoW.Rage < 100 && WoW.CountEnemyNPCsInRange < 8 && WoW.PlayerHasBuff("Meat-Cleaver") && !WoW.PlayerHasBuff("Enrage") && level >= 10)
                    {
                        WoW.CastSpell("Bloodthirst");
                        return;
                    }

                    if (WoW.CanCast("Raging Blow") && WoW.PlayerHasBuff("Enrage") && WoW.CountEnemyNPCsInRange < 4 && level >= 13)
                    {
                        WoW.CastSpell("Raging Blow");
                        return;
                    }

                }

                    // other stuff
                    //if(!WoW.IsInCombat && WoW.CanCast("Mount") && WoW.IsOutdoors && !WoW.IsMoving && !WoW.PlayerIsChanneling && ConfigFile.ReadValue<bool>("Protection-Paladin-WiNiFiX", "AutoMount"))
                    //{
                    //    WoW.CastSpell("Mount");
                    //}
                    //if (WoW.CanCast("Pummel") && WoW.TargetPercentCast >= 40 && WoW.TargetIsCasting && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.RangeToTarget < 6) 
					// Do Single Target Cleave stuff here if applicable else ignore this on
                    //{
                    //    WoW.CastSpell("Pummel");
                    //    return;
                    //}
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
Spell,23881,Bloodthirst,D3
Spell,1464,Slam,D3
Spell,12294,Mortal Strike,D5
Spell,85288,Raging Blow,D4
Spell,100130,Furious Slash,D5
Spell,5308,Execute,D6
Spell,184367,Rampage,D7
Spell,190411,Whirlwind,D8
Spell,1719,BattleCry,R
Spell,118000,DragonRoar,-
Spell,107574,Avatar,D0
Spell,205545,OdynsFury,T
Spell,18499,Berserker Rage,U
Aura,206333,TasteForBlood
Aura,118000,DragonRoarBuff
Aura,1719,BattleCryBuff
Aura,200863,SenseDeath
Aura,184362,Enrage
Aura,201009,Juggernaut
Aura,206316,Massacre
Aura,85739,Meat-Cleaver
Aura,215570,Wrecking Ball
Aura,215572,Frothing
Aura,184364,Enraged Regeneration
Aura,118699,Fear
Aura,107574,AvatarBuff
*/
