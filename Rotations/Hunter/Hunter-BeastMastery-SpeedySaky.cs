using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;

namespace Frozen.Rotation
{
    public class BeastMastery : CombatRoutine
    {

        public override Form SettingsForm { get; set; }

        public override void Initialize()
        {
            Log.Write("Welcome to BeastMastery DPS rotation");
            Log.Write("Suggested builds for Raiding: 3212113 ");
            
        }

        public override void Stop()
        {
            Log.Write("For any bugs and suggestions contact me on discord--SpeedySaky");
        }
        
        public override void OutOfCombatPulse()
        {
        }

        public override void Pulse()
        {
            if (WoW.HasTarget && WoW.TargetIsEnemy)

                if (WoW.CanCast("Aspect of the wild") && UseCooldowns)
            {
                WoW.CastSpell("Aspect of the wild");
                return;
            }

            if (WoW.CanCast("Exhilaration") && WoW.PlayerHealthPercent <=35 )
            {
                WoW.CastSpell("Exhilaration");
                return;
            }

            if (WoW.CanCast("Aspect of the turtle") && WoW.PlayerHealthPercent <= 25)
            {
                WoW.CastSpell("Aspect of the turtle");
                return;
            }

            if (combatRoutine.Type == RotationType.SingleTarget)
            {
                if (WoW.CanCast("Counter Shot")  && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Counter Shot") && WoW.TargetPercentCast > Random.Next(30, 85))

                {
                    WoW.CastSpell("Counter Shot");
                    return;
                }

            if (WoW.CanCast("Murder of crows")  && WoW.Talent(6) == 1)
                {
                    WoW.CastSpell("Murder of crows");
                    return;
                }
                 if (WoW.CanCast("Bestial wrath")  )
                {
                WoW.CastSpell("Bestial wrath");
                return;
                 }
                              
            if (WoW.CanCast("Dire frenzy")&& WoW.PlayerBuffStacks("Dire frenzy") <= 2)
                 {
                WoW.CastSpell("Dire frenzy");
                return;
                 }
            if (WoW.CanCast("Kill command"))
            {
                WoW.CastSpell("Kill command");
                return;
            }
            if (WoW.CanCast("Titans thunder") )
            {
                WoW.CastSpell("Titans thunder");
                return;
            }
           
            if (WoW.CanCast("Cobra shot") && WoW.Focus >= 80)
            {
                WoW.CastSpell("Cobra shot");
                return;
            }
            }

            if (combatRoutine.Type == RotationType.Cleave)
            { 
                if (WoW.CanCast("Counter Shot") && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Counter Shot") && WoW.TargetPercentCast > Random.Next(30, 85))

                {
                    WoW.CastSpell("Counter Shot");
                    return;
                }
                if (WoW.CanCast("Murder of crows") && WoW.Talent(6) == 1)
                {
                    WoW.CastSpell("Murder of crows");
                    return;
                }
                if (WoW.CanCast("Titans thunder"))
                {
                    WoW.CastSpell("Titans thunder");
                    return;
                }
                if (WoW.CanCast("Bestial wrath"))
                {
                    WoW.CastSpell("Bestial wrath");
                    return;
                }
                if (WoW.CanCast("Dire frenzy") && WoW.PlayerBuffStacks("Dire frenzy") <= 2)
                {
                    WoW.CastSpell("Dire frenzy");
                    return;
                }
                if (WoW.CanCast("Kill command") && WoW.PetHasBuff("Beast cleave"))
                {
                    WoW.CastSpell("Kill command");
                    return;
                }
                if (WoW.CanCast("Multi shot") && WoW.PetBuffTimeRemaining("Beast cleave") <=500 && WoW.CountEnemyNPCsInRange <=3 )
                {
                    WoW.CastSpell("Multi shot");
                    return;
                }

             if (WoW.CanCast("Multi shot") && WoW.PetBuffTimeRemaining("Beast cleave") <= 500 && WoW.CountEnemyNPCsInRange >= 4)
            {
                WoW.CastSpell("Multi shot");
                return;
            }
                if (WoW.CanCast("Cobra shot") && WoW.Focus >= 90)
                {
                    WoW.CastSpell("Cobra shot");
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
Spell,147362,Counter Shot
Spell,186265,Aspect of the turtle
Spell,2643,Multi shot
Spell,120679,Dire beast
Spell,19574,Bestial wrath
Spell,131894,Murder of crows
Spell,217200,Dire frenzy
Spell,34026,Kill command
Spell,207068,Titans thunder
Spell,193530,Aspect of the wild
Spell,193455,Cobra shot
Spell,109304,Exhilaration
Aura,217200,Dire frenzy
Aura,246152,Dire frenzy
Aura,118455,Beast cleave
*/
