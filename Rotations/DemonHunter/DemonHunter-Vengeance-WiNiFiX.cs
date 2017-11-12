// winifix@gmail.com
// ReSharper disable UnusedMember.Global

using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;

namespace Frozen.Rotation
{
    public class DemonHunterVeng : CombatRoutine
    {   
        public override Form SettingsForm { get; set; }

        public override void Initialize()
        {
            Log.DrawHorizontalLine();
            Log.WriteFrozen("Welcome to Frozen Demon Hunter", Color.Black);
        }

        public override void Stop()
        {
            Log.Write("Leaving already?");
        }

        public override void Pulse()
        {
            if (!WoW.HasTarget || !WoW.TargetIsEnemy || !WoW.IsSpellInRange("Throw Glaive")) return;

            if (WoW.PlayerHealthPercent < 30 && !WoW.IsSpellOnCooldown("Metamorphasis") && UseCooldowns && WoW.CanCast("Metamorphasis"))
            {
                WoW.CastSpell("Metamorphasis");                
            }
            if (WoW.PlayerHasBuff("Metamorphasis") && WoW.CanCast("Sever"))
            {
                WoW.CastSpell("Sever");
                return;
            }
            if (WoW.PlayerHasBuff("Metamorphasis") && WoW.PlayerHasBuff("Soul Fragments") && WoW.PlayerBuffStacks("Soul Fragments") >= 5 && WoW.Pain >= 50 && WoW.CanCast("Soul Cleave"))
            {
                WoW.CastSpell("Soul Cleave");
                return;
            }
            if (!WoW.IsSpellInRange("Soul Carver") && !WoW.IsSpellOnCooldown("Throw Glaive") && WoW.CanCast("Throw Glaive"))
            {
                WoW.CastSpell("Throw Glaive");
                return;
            }

            if (!WoW.IsSpellInRange("Soul Carver")) return; // If we are out of melee range return
            
            if (WoW.TargetIsCastingAndSpellIsInterruptible && WoW.TargetPercentCast > Random.Next(50, 70))
            {
                if (!WoW.IsSpellOnCooldown("Sigil of Silence") && WoW.CanCast("Sigil of Silence"))
                {
                    Log.Write("Interrupting spell");
                    WoW.CastSpell("Sigil of Silence");
                    return;
                }

                if (!WoW.IsSpellOnCooldown("Arcane Torrent") && WoW.CanCast("Arcane Torrent"))
                {
                    Log.Write("Interrupting spell");
                    WoW.CastSpell("Arcane Torrent");
                    return;
                }

                if (!WoW.IsSpellOnCooldown("Consume Magic") && WoW.CanCast("Consume Magic"))
                {
                    Log.Write("Interrupting spell");
                    WoW.CastSpell("Consume Magic");
                    return;
                }
            }

            if (!WoW.TargetHasDebuff("Fiery Demise") && !WoW.IsSpellOnCooldown("Fiery Brand") && WoW.CanCast("Fiery Brand"))
            {
                WoW.CastSpell("Fiery Brand");
                return;
            }

            if (!WoW.PlayerHasBuff("Demon Spikes") && WoW.Pain > 20 && !WoW.PlayerHasBuff("Magnum Opus") && WoW.CanCast("Demon Spikes"))
            {
                WoW.CastSpell("Demon Spikes");
                return;
            }

            if (WoW.CanCast("Soul Carver"))
            {
                WoW.CastSpell("Soul Carver");
                return;
            }

            if (WoW.Pain >= 30 && WoW.CanCast("Fel Devastation"))
            {
                WoW.CastSpell("Fel Devastation");
                return;
            }

            if (WoW.Pain >= 50 && WoW.CanCast("Soul Cleave"))
            {
                WoW.CastSpell("Soul Cleave");
                return;
            }

            if (WoW.CanCast("Immolation Aura"))
            {
                WoW.CastSpell("Immolation Aura");
                return;
            }

            if (!WoW.TargetHasDebuff("Sigil of Flame") && WoW.CanCast("Sigil of Flame"))
            {
                WoW.CastSpell("Sigil of Flame");
                return;
            }

            if (WoW.CanCast("Shear"))            
                WoW.CastSpell("Shear"); // Pain Generator
        }

        public override void OutOfCombatPulse()
        {
         
        }

        public override void MountedPulse()
        {
         
        }
    }
}

/*
[AddonDetails.db]
AddonAuthor=WiNiFiX
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,203782,Shear,T
Spell,235964,Sever,T
Spell,228477,Soul Cleave,Y
Spell,207407,Soul Carver,H
Spell,212084,Fel Devastation,W
Spell,178740,Immolation Aura,D5
Spell,204513,Sigil of Flame,D6
Spell,204157,Throw Glaive,D7
Spell,207682,Sigil of Silence,D8
Spell,202719,Arcane Torrent,D0
Spell,187827,Metamorphasis,D9
Spell,204021,Fiery Brand,F
Spell,203720,Demon Spikes,S
Spell,183752,Consume Magic,B
Aura,203819,Demon Spikes
Aura,212818,Fiery Demise
Aura,200175,Mount
Aura,207472,Magnum Opus
Aura,187827,Metamorphasis
Aura,204598,Sigil of Flame
Aura,203981,Soul Fragments
Item,80610,Mana
*/