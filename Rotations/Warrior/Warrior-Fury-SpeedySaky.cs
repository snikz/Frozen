using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using Frozen.GUI;
using System.Diagnostics;
namespace Frozen.Rotation
{
    public class Fury : CombatRoutine
    {
        private Settings settingsForm;
        public override Form SettingsForm
        {
            get { return settingsForm.FormSettings; }

            set { }
        }

        public override void Initialize()
        {
            settingsForm = new Settings("Fury Warrior SpeedySaky", WoWClass.Warrior);
            settingsForm.Add("Enraged Regeneration Health", new NumericUpDown(), 30);
            settingsForm.Add("Commanding shout", new NumericUpDown(), 15);
            settingsForm.Add("Pummel", new CheckBox(), true);

            Log.Write("Welcome to Fury Warrior DPS rotation");
            Log.Write("Suggested builds: 2332232 ");
        }

        public override void Stop()
        {
            Log.Write("For any bugs and suggestions contact me on discord--SpeedySaky");
        }


        private int EnragedRegenerationHealth
        {
            get
            {
                return settingsForm.ReadSetting<int>("Enraged Regeneration Health");
            }
        }

        
        private int CommandingShout
        {
            get
            {
                return settingsForm.ReadSetting<int>("Commanding shout");
            }
        }
        private bool HasAyalasStoneHeart
        {
            get
            {
                return WoW.IsEquippedItem("Ayala's Stone Heart");
            }
        }

        private bool HasSouloftheBattlelord
        {
            get
            {
                return WoW.IsEquippedItem("Soul of the Battlelord");
            }
        }


        private bool Pummel
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Pummel");
            }
        }

        public override void Pulse()



        {

            if (WoW.CanCast("Battle cry") && UseCooldowns)
            {
                WoW.CastSpell("Battle cry");
                return;
            }

            if (WoW.CanCast("Avatar") && UseCooldowns && WoW.Talent(3) == 3 && WoW.PlayerHasBuff("Battle cry"))
            {
                WoW.CastSpell("Avatar");
                return;
            }

            if (WoW.CanCast("Odyns fury") && WoW.Level >= 101 && WoW.IsSpellOnCooldown("Raging Blow") && WoW.PlayerHasBuff("Battle cry") && !WoW.IsSpellOnGCD("Raging Blow")
                    && WoW.PlayerHasBuff("Frothing") && WoW.Rage < 100)
            {
                WoW.CastSpell("Odyns fury");
                return;
            }

            if (WoW.PlayerHealthPercent <= EnragedRegenerationHealth && WoW.CanCast("Enraged Regeneration"))
            {
                WoW.CastSpell("Enraged Regeneration");
                WoW.CastSpell("Raging Blow");
                return;
            }

            if (WoW.PlayerHealthPercent <= CommandingShout && WoW.CanCast("Commanding shout"))
            {
                WoW.CastSpell("Commanding shout");
                return;
            }

            if (Pummel && WoW.CanCast("Pummel") && WoW.Level >= 24 && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Pummel") && WoW.TargetPercentCast > Random.Next(50, 85))

            {
                WoW.CastSpell("Pummel");
                return;
            }

            if (WoW.PlayerHasDebuff("Fear"))
            {
                if (WoW.CanCast("Berserker Rage"))
                {
                    WoW.CastSpell("Berserker Rage");
                }
                else if (WoW.CanCast("Will of the Forsaken"))
                {
                    WoW.CastSpell("Will of the Forsaken");
                }
                else if (WoW.CanCast("Every Man For Himself"))
                {
                    WoW.CastSpell("Every Man For Himself");
                }
                return;
            }

            if (WoW.TargetHealthPercent == 0 && WoW.IsInCombat && WoW.RangeToTarget <= 5 && WoW.CountEnemyNPCsInRange >= 1 && !WoW.IsMounted || !WoW.HasTarget && WoW.IsInCombat && WoW.CountEnemyNPCsInRange >= 1 && WoW.RangeToTarget <= 6 && !WoW.IsMounted)
            {
                WoW.TargetNextEnemy();
                return;
            }

            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent <= 20 && WoW.Level >= 60)

                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <= 6 && WoW.IsInCombat)
                   

                {
                    if (WoW.CanCast("Execute") && !WoW.PlayerHasBuff("Juggernaut") || WoW.CanCast("Execute") && WoW.PlayerBuffTimeRemaining("Juggernaut") < 2 || WoW.CanCast("Execute") &&
                        WoW.SpellCooldownTimeRemaining("Battle cry") < 10000 || WoW.CanCast("Execute") && WoW.Rage >= 100 || WoW.CanCast("Execute") && WoW.PlayerHasBuff("SenseDeath") &&
                        WoW.Rage >= 100 || WoW.CanCast("Execute") && WoW.PlayerHasBuff("Battle cry") && WoW.PlayerHasBuff("Frothing"))
                    {
                        WoW.CastSpell("Execute");
                        return;

                        if (WoW.CanCast("Execute") && WoW.Level >= 8 && WoW.Rage >= 50)
                    {
                        WoW.CastSpell("Execute");
                        return;
                    }
                        if (WoW.CanCast("Bloodthirst") && WoW.Rage < 100 && WoW.SpellCooldownTimeRemaining("Battle cry") >= 11000 || WoW.CanCast("Bloodthirst") && WoW.Rage < 25 && WoW.Level >= 10 && WoW.SpellCooldownTimeRemaining("Battle cry") <= 9000 || WoW.CanCast("Bloodthirst") && WoW.IsSpellOnCooldown("Raging Blow") || WoW.CanCast("Rampage") && WoW.Level >= 12 && HasSouloftheBattlelord && WoW.PlayerHasBuff("Massacre"))
                        {
                            WoW.CastSpell("Bloodthirst");
                            return;
                        }
                        if (WoW.CanCast("Raging Blow") && WoW.Rage < 100 && WoW.IsSpellOnCooldown("Bloodthirst") && WoW.SpellCooldownTimeRemaining("Battle cry") >= 11000 || WoW.CanCast("Raging Blow") && WoW.Rage < 25 && WoW.IsSpellOnCooldown("Bloodthirst") && WoW.Level >= 13 && WoW.SpellCooldownTimeRemaining("BattleCry") <= 9000)
                        {
                            WoW.CastSpell("Raging Blow");
                            return;
                        }

                        if (WoW.CanCast("Furious Slash") && WoW.IsSpellOnCooldown("Raging Blow") && !WoW.IsSpellOnGCD("Bloodthirst") && WoW.Level >= 10 && !WoW.IsSpellOnGCD("Raging Blow") &&
                            WoW.PlayerBuffTimeRemaining("TasteForBlood") <= 4000)
                        {
                            WoW.CastSpell("Furious Slash");
                            return;
                        }
                    }
                }



            




            if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && !WoW.PlayerHasBuff("Battle cry")) 
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <= 6 && WoW.IsInCombat)


                {

                    if (WoW.CanCast("Execute") && WoW.Level >= 8 && HasAyalasStoneHeart)
                    {
                        WoW.CastSpell("Execute");
                        return;
                    }

                    if (WoW.CanCast("Rampage") && WoW.Rage == 100 && WoW.Level >= 18)
                    {
                        WoW.CastSpell("Rampage");
                        return;
                    }

                    if ((WoW.CanCast("Bloodthirst") && !WoW.PlayerHasBuff("Enrage") && WoW.Rage < 100 && WoW.Level >= 10) || WoW.CanCast("Bloodthirst") && WoW.IsSpellOnCooldown("Raging Blow")
                        && WoW.Rage < 100 && WoW.Level >= 10)
                    {
                        WoW.CastSpell("Bloodthirst");
                        return;
                    }

                    if (WoW.CanCast("Raging Blow") && WoW.Level >= 13)
                    {
                        WoW.CastSpell("Raging Blow");
                        return;
                    }

                    if (WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking Ball") && WoW.IsSpellOnCooldown("Raging Blow") && WoW.Talent(3) == 1 && WoW.PlayerHasBuff("Enrage"))
                    {
                        WoW.CastSpell("Whirlwind");
                        return;
                    }

                    if (WoW.CanCast("Furious Slash") && WoW.IsSpellOnCooldown("Raging Blow") && !WoW.IsSpellOnGCD("Bloodthirst") && WoW.Level >= 10 && !WoW.IsSpellOnGCD("Raging Blow") && WoW.PlayerBuffTimeRemaining("TasteForBlood") <= 4000 && WoW.Rage <= 90 && WoW.SpellCooldownTimeRemaining("Bloodthirst") <= 1000)
                    {
                        WoW.CastSpell("Furious Slash");
                        return;
                    }
                }


                    if (combatRoutine.Type == RotationType.SingleTarget && WoW.TargetHealthPercent >= 21 && WoW.PlayerHasBuff("Battle cry")) 
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <= 6 && WoW.IsInCombat)

                {
                    if (WoW.CanCast("Execute") && WoW.Level >= 8 && HasAyalasStoneHeart)
                    {
                     WoW.CastSpell("Execute");
                    return;
                    }
                
                if (WoW.CanCast("Rampage") && WoW.Level >= 12 && WoW.Rage >= 100 )
                {
                        WoW.CastSpell("Rampage");
                        return;
                    }                
                if (WoW.CanCast("Raging Blow") && WoW.Level >= 20 && WoW.PlayerHasBuff("Enrage"))
                    {
                        WoW.CastSpell("Raging Blow");
                        return;
                    }
                         
                if (WoW.CanCast("Bloodthirst") && WoW.Level >= 10)
                {
                    WoW.CastSpell("Bloodthirst");
                    return;
                }
               
                if (WoW.CanCast("Furious Slash") && WoW.Level >= 10)
                {
                    WoW.CastSpell("Furious Slash");
                    return;
                }
            }
                  

            if (combatRoutine.Type == RotationType.Cleave)
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.RangeToTarget <= 6 && WoW.IsInCombat)

                {
                    if (WoW.CanCast("Execute") && WoW.Level >= 8 && HasAyalasStoneHeart)
                    {
                        WoW.CastSpell("Execute");
                        return;
                    }
                    if (WoW.CanCast("Whirlwind") && !WoW.PlayerHasBuff("Meat-Cleaver") && WoW.Level >= 28 || WoW.CanCast("Whirlwind") && WoW.PlayerHasBuff("Wrecking Ball") && WoW.Talent(3) == 1
                            && WoW.Level >= 45)
                    {
                        WoW.CastSpell("Whirlwind");
                        return;
                    }
                    if (WoW.CanCast("Rampage") && WoW.Rage == 100 && WoW.Level >= 12 && !WoW.PlayerHasBuff("Enrage") && WoW.PlayerHasBuff("Meat cleaver"))
                {
                    WoW.CastSpell("Rampage");
                    return;
                }

                    if (WoW.CanCast("Furious Slash") && WoW.IsSpellOnCooldown("Raging Blow") && !WoW.IsSpellOnGCD("Bloodthirst") && WoW.Level >= 10 && !WoW.IsSpellOnGCD("Raging Blow")
                        && WoW.PlayerBuffTimeRemaining("TasteForBlood") <= 4000)
                    {
                        WoW.CastSpell("Furious Slash");
                        return;
                    }


                    if (WoW.CanCast("Bloodthirst") && WoW.Rage < 100 && WoW.CountEnemyNPCsInRange < 8 && WoW.PlayerHasBuff("Meat-Cleaver") && !WoW.PlayerHasBuff("Enrage") && WoW.Level >= 10)
                    {
                        WoW.CastSpell("Bloodthirst");
                        return;
                    }
                    if (WoW.CanCast("Raging Blow") && WoW.PlayerHasBuff("Enrage") && WoW.CountEnemyNPCsInRange < 4 && WoW.Level >= 13)
                    {
                        WoW.CastSpell("Raging Blow");
                        return;
                    }
                }

        }

    }
}




/*
[AddonDetails.db]
AddonAuthor=WiNiFiX
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,85288,Raging Blow
Spell,1464,Slam
Spell,6552,Pummel
Spell,184367,Rampage
Spell,23881,Bloodthirst
Spell,205545,Odyns fury
Spell,5308,Execute
Spell,190411,Whirlwind
Spell,100130,Furious Slash
Spell,118000,DragonRoar
Spell,1719,Battle cry
Spell,107574,Avatar
Spell,184364,Enraged Regeneration
Spell,97462,Commanding shout
Spell,7744,Will of the Forsaken
Spell,18499,Berserker Rage
Spell,59752,Every Man For Himself
Aura,107574,Avatar
Aura,206333,TasteForBlood
Aura,118000,DragonRoarBuff
Aura,184361,Enrage
Aura,215570,Wrecking Ball
Aura,85739,Meat cleaver
Aura,215572,Frothing
Aura,118699,Fear
Aura,1719,Battle cry
Aura,184364,Enraged Regeneration
Aura,242300,Raging thirst
Item,137052,Ayala's Stone Heart
Item,151650,Soul of the Battlelord
Aura,206315,Massacre
*/
