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
        bool doneOpener = false;
        public override void OutOfCombatPulse()
        {
        }

        public override void Pulse()
        {
            if (combatRoutine.Type == RotationType.SingleTarget)

                if (WoW.CanCast("Counter Shot") && WoW.Level >= 32 && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Counter Shot") && WoW.TargetPercentCast > Random.Next(30, 85))

                {
                    WoW.CastSpell("Counter Shot");
                    return;
                }

            if (WoW.CanCast("Murder of crows") && WoW.Level >= 90 && WoW.Talent(6) == 1)
                {
                    WoW.CastSpell("Murder of crows");
                    return;
                }
                 if (WoW.CanCast("Bestial wrath") && WoW.Level >= 40 )
                {
                WoW.CastSpell("Bestial wrath");
                return;
                 }
                  if (WoW.CanCast("Dire beast") && WoW.Level <= 29 && WoW.PlayerBuffStacks("Dire beast") <=2)
                  {
                WoW.CastSpell("Dire beast");
                return;
                  }
            
            if (WoW.CanCast("Dire frenzy") && WoW.Level >= 30  && WoW.PlayerBuffStacks("Dire frenzy") <= 2)
                 {
                WoW.CastSpell("Dire frenzy");
                return;
                 }
            if (WoW.CanCast("Kill command") && WoW.Level >= 10 )
            {
                WoW.CastSpell("Kill command");
                return;
            }
            if (WoW.CanCast("Titans thunder") && WoW.Level >= 98)
            {
                WoW.CastSpell("Titans thunder");
                return;
            }
            if (WoW.CanCast("Aspect of the wild") && WoW.Level >=26)
            {
                WoW.CastSpell("Aspect of the wild");
                return;
            }
            if (WoW.CanCast("Cobra shot") && WoW.Level >= 1 && WoW.Focus >= 70)
            {
                WoW.CastSpell("Cobra shot");
                return;
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
Spell,120679,Dire beast
Spell,19574,Bestial wrath
Spell,131894,Murder of crows
Spell,217200,Dire frenzy
Spell,34026,Kill command
Spell,207068,Titans thunder
Spell,193530,Aspect of the wild
Spell,193455,Cobra shot
Aura,217200,Dire frenzy
Aura,246152,Dire frenzy
*/
