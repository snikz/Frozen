// winifix@gmail.com
// ReSharper disable UnusedMember.Global

using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using System.Diagnostics;

namespace Frozen.Rotation
{
    public class DemonHunterHavoc : CombatRoutine
    {
        private readonly Stopwatch EBstopwatch = new Stopwatch();
        public override string Name => "Frozen DemonHunter";

        public override string Class => "DemonHunter";

        public override Form SettingsForm { get; set; }

        public override void Initialize()
        {
            Log.DrawHorizontalLine();
            Log.WriteFrozen("Welcome to Frozen Demon Hunter", Color.Black);
        }

        public override void Stop()
        {
        }

        public override void Pulse()
        {
            if (WoW.HealthPercent == 0 || WoW.IsMounted) return;
            if (!WoW.HasTarget || !WoW.TargetIsEnemy) return;
            if (WoW.PlayerIsChanneling) return;
            Log.Write("No of Enemies " + WoW.CountEnemyNPCsInRange, Color.Red);

            if (WoW.HasBossTarget && !WoW.IsSpellOnCooldown("FOTI") && WoW.IsSpellInRange("ChaosStrike"))
            {
                WoW.CastSpell("FOTI");
                return;
            }

            if (WoW.CanCast("FOTI") && !WoW.IsSpellOnCooldown("FOTI") && WoW.IsSpellInRange("ChaosStrike") &&
                WoW.CountEnemyNPCsInRange >= 2 && !WoW.IsMoving)
            {
                WoW.CastSpell("FOTI");
                return;
            }

            if (WoW.CanCast("EyeBeam") && WoW.Fury > 50 && WoW.CountEnemyNPCsInRange >= 2
                && !WoW.IsMoving)
            {
                WoW.CastSpell("EyeBeam");
                return;
            }

            if (WoW.PlayerHasBuff("Metamorphosis"))
            {
                if (WoW.CanCast("Nemesis") && !WoW.IsSpellOnCooldown("Nemesis"))
                {
                    WoW.CastSpell("Nemesis");
                }

                if (WoW.CanCast("ChaosBlades") && !WoW.IsSpellOnCooldown("ChaosBlades"))
                {
                    WoW.CastSpell("ChaosBlades");
                }

                if (WoW.CanCast("Deathsweep") && !WoW.IsSpellOnCooldown("Deathsweep") && WoW.IsSpellInRange("Annihilation") &&
                    WoW.Fury > 15)
                {
                    WoW.CastSpell("Deathsweep");
                    return;
                }

                if (WoW.CanCast("Annihilation") && !WoW.IsSpellOnCooldown("Annihilation") && WoW.IsSpellInRange("Annihilation") &&
                    WoW.Fury > 40)
                {
                    WoW.CastSpell("Annihilation");
                    return;
                }

                if (WoW.CanCast("Felblade") && WoW.IsSpellInRange("Annihilation"))
                {
                    WoW.CastSpell("Felblade");
                    return;
                }

            }

                if (WoW.CanCast("BladeDance") && !WoW.IsSpellOnCooldown("BladeDance") && WoW.IsSpellInRange("ChaosStrike") &&
                    WoW.Fury > 15)
                {
                    WoW.CastSpell("BladeDance");
                    return;
                }

                if (WoW.CanCast("Felblade") && WoW.IsSpellInRange("ChaosStrike") && WoW.Fury < 110)
                {
                    WoW.CastSpell("Felblade");
                    return;
                }

                if (WoW.CanCast("ChaosStrike") && !WoW.IsSpellOnCooldown("ChaosStrike") && WoW.IsSpellInRange("ChaosStrike") &&
                    WoW.Fury > 40)
                {
                    WoW.CastSpell("ChaosStrike");
                    return;
                }

                if (WoW.CanCast("Felblade") && WoW.IsSpellInRange("ChaosStrike"))
                {
                    WoW.CastSpell("Felblade");
                    return;
                }



                if (WoW.CanCast("ThrowGlaives") && WoW.IsInCombat)
                {
                    WoW.CastSpell("ThrowGlaives");
                    return;
                }            
        }
    }
}

/*
[AddonDetails.db]
AddonAuthor=WiNiFiX
AddonName=Frozen
WoWVersion=Legion - 70200
[SpellBook.db]
Spell,206491,Nemesis,E
Spell,191427,Metamorphosis,F
Spell,211048,ChaosBlades,T
Spell,201467,FOTI,D3
Spell,162794,ChaosStrike,D5
Spell,201427,Annihilation,D5
Spell,185123,ThrowGlaives,D1
Spell,188499,BladeDance,D4
Spell,232893,Felblade,Q
Spell,210152,Deathsweep,D4
Spell,198013,EyeBeam,D2
Spell,183752,ConsumeMagic,R
Aura,162264,Metamorphosis
*/
