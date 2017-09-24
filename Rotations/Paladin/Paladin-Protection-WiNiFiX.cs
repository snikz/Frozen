// winifix@gmail.com
// ReSharper disable UnusedMember.Global


using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;

namespace Frozen.Rotation
{
    public class Paladin_Protection : CombatRoutine
    {
        public override Form SettingsForm
        {
            get { return null; }
            set { }
        }

        public override void Initialize()
        {
            Log.DrawHorizontalLine();
            Log.WriteFrozen("Welcome to Frozen Protection", Color.Black);
            Log.Write("Supported Talents: 2212321");
            Log.Write("Current Talents  : " + WoW.Talent(1) + WoW.Talent(2) + WoW.Talent(3) + WoW.Talent(4) + WoW.Talent(5) + WoW.Talent(6) + WoW.Talent(7));
        }

        public override void Stop()
        {
        }

        public override void Pulse()
        {
            if (WoW.TargetHealthPercent == 0) return;
            
            if (!WoW.TargetIsEnemy) return;
            WoW.CastSpell("Rebuke", WoW.TargetIsCastingAndSpellIsInterruptible && WoW.TargetPercentCast > 60);
            WoW.CastSpell("ArdentDefender", WoW.PlayerHealthPercent < 15);
            WoW.CastSpell("LayOnHands", WoW.CanCast("LayOnHands") && !WoW.PlayerHasDebuff("Forbearance") && WoW.PlayerHealthPercent < 20 && !WoW.PlayerHasBuff("ArdentDefender"));
            WoW.CastSpell("GuardianOfAncientKings", WoW.PlayerHealthPercent < 50 && !WoW.PlayerHasBuff("ArdentDefender"));
            if (!WoW.HasTarget) return;
            WoW.CastSpell("AvengingWrath", UseCooldowns, false); // Off the GCD no return needed.
            WoW.CastSpell("AvengersShield", true);
            WoW.CastSpell("EyeOfTyr", WoW.PlayerHealthPercent < 100);
            WoW.CastSpell("Judgment", true);
            WoW.CastSpell("Consecration", true);
            WoW.CastSpell("LightOfTheProtector", WoW.PlayerHasBuff("Consecration") && WoW.PlayerHealthPercent < 70);
            WoW.CastSpell("BlessedHammer", WoW.Talent(1) == 2);
            WoW.CastSpell("BastionOfLight", WoW.PlayerSpellCharges("ShieldOfTheRighteous") == 0 && !WoW.PlayerHasBuff("ShieldOfTheRighteous"));
            WoW.CastSpell("ShieldOfTheRighteous", WoW.PlayerHasBuff("Consecration") && 
                                                  WoW.PlayerSpellCharges("ShieldOfTheRighteous") > 0 && 
                                                  !WoW.PlayerHasBuff("ShieldOfTheRighteous"));
            WoW.CastSpell("Seraphim", WoW.Talent(7) == 2);
            WoW.CastSpell("BlessedHammer", true);
        }
    }
}

/*
[AddonDetails.db]
AddonAuthor=WiNiFiX
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,20271,Judgment,U
Spell,26573,Consecration,V
Spell,31935,AvengersShield,T
Spell,204019,BlessedHammer,B
Spell,53600,ShieldOfTheRighteous,Y
Spell,31884,AvengingWrath,A
Spell,204035,BastionOfLight,H
Spell,184092,LightOfTheProtector,F
Spell,633,LayOnHands,D9
Spell,19750,FlashHeal,OemMinus
Spell,31850,ArdentDefender,W
Spell,86659,GuardianOfAncientKings,D8
Spell,209202,EyeOfTyr,D1
Spell,642,DivineShield,D0
Spell,62124,HandOfReckoning,E
Spell,96231,Rebuke,S
Spell,34767,Mount,D4
Spell,152262,Seraphim,None
Aura,188370,Consecration
Aura,132403,ShieldOfTheRighteous
Aura,25771,Forbearance
Aura,31850,ArdentDefender
*/
