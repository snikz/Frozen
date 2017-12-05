using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;

namespace FrozenNamespace
{
    public class DemonHunterHavoc : CombatRoutine
    {
        private readonly Stopwatch EBstopwatch = new Stopwatch();

        public override Form SettingsForm { get; set; }

        public override void Initialize()
        {
            Log.DrawHorizontalLine();
            Log.WriteFrozen("Welcome to Frozen Demon Hunter", Color.Black);
        }

        public override void Stop()
        {
        }

        public override void OutOfCombatPulse()
        {
            if (WoW.CanCast("DemonsBite") && WoW.IsSpellInRange("DemonsBite") && WoW.AoeOn)
            {
                WoW.CastSpell("DemonsBite");
                return;
            }
        }

        public override void Pulse()
        {
            if (WoW.PlayerHealthPercent == 0 || WoW.IsMounted) return;
            if (!WoW.HasTarget || !WoW.TargetIsEnemy) return;
            if (WoW.PlayerIsChanneling) return;
            bool range = WoW.IsSpellInRange("DemonsBite");
            int fury = WoW.Fury;
            int fury_max = 140;
            int fury_deficit = fury_max - WoW.Fury;
            var eb_cd = WoW.SpellCooldownTimeRemaining("EyeBeam");
            var meta_cd = WoW.SpellCooldownTimeRemaining("Metamorphosis");
            var nemisis_cd = WoW.SpellCooldownTimeRemaining("Nemesis");
            var chaos_blades_cd = WoW.SpellCooldownTimeRemaining("ChaosBlades");
            var pummel = WoW.TargetIsCastingAndSpellIsInterruptible && WoW.TargetPercentCast > 50;
            
            if (WoW.TargetHealthPercent == 0) WoW.TargetNextEnemy();


            if (WoW.CanCast("ConsumeMagic") && pummel)
            {
                WoW.CastSpell("ConsumeMagic");
                return;
            }
            if (WoW.CanCast("ArcaneTorrent") && WoW.IsSpellOnCooldown("ConsumeMagic") && pummel)
            {
                WoW.CastSpell("ArcaneTorrent");
                return;
            }


            if (WoW.Talent(7) != 3)
            {
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
                    if (WoW.CanCast("Nemesis") && !WoW.IsSpellOnCooldown("Nemesis") && WoW.Talent(5) == 3)
                    {
                        WoW.CastSpell("Nemesis");
                    }

                    if (WoW.CanCast("ChaosBlades") && !WoW.IsSpellOnCooldown("ChaosBlades") && WoW.Talent(7) == 1)
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

            if (WoW.CanCast("ThrowGlaives") && WoW.RangeToTarget >= 8 && WoW.RangeToTarget <= 30)
            {
                WoW.CastSpell("ThrowGlaives");
                return;
            }

            if (WoW.Talent(7) == 3 && range)
            {
                if(WoW.CanCast("Deathsweep") && (WoW.CountEnemyNPCsInRange >= 5 || WoW.Talent(3) ==2) && fury >= 35 && WoW.PlayerHasBuff("Metamorphosis"))
                {
                    WoW.CastSpell("Deathsweep");
                    return;
                }
                if (WoW.CanCast("FelEruption") && fury >= 10 && WoW.Talent(5) == 2)
                {
                    WoW.CastSpell("FelEruption");
                    return;
                }
                if (WoW.CanCast("FOTI") && (WoW.CountEnemyNPCsInRange >= 2 || WoW.HasBossTarget))
                {
                    WoW.CastSpell("FOTI");
                    return;
                }
                if (WoW.CanCast("BladeDance") && (WoW.CountEnemyNPCsInRange >= 5 || WoW.Talent(3) == 2) && fury >= 35 && eb_cd > 5000 && meta_cd > 0 && !WoW.PlayerHasBuff("Metamorphosis"))
                {
                    WoW.CastSpell("BladeDance");
                    return;
                }
                if (WoW.CanCast("EyeBeam") && fury >= 30 && (WoW.CountEnemyNPCsInRange >= 2 || !WoW.PlayerHasBuff("Metamorphosis")))
                {
                    WoW.CastSpell("EyeBeam");
                    return;
                }
                if (WoW.CanCast("Annihilation") && fury >= 40 && WoW.PlayerHasBuff("Metamorphosis"))
                {
                    WoW.CastSpell("Annihilation");
                    return;
                }
                if (WoW.CanCast("ChaosStrike") && fury >= 40 && !WoW.PlayerHasBuff("Metamorphosis"))
                {
                    WoW.CastSpell("ChaosStrike");
                    return;
                }
                if (WoW.CanCast("DemonsBite"))
                {
                    WoW.CastSpell("DemonsBite");
                    return;
                }
            }



        }
    }
}

/*
[AddonDetails.db]
AddonAuthor=Lhasse
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,206491,Nemesis,E
Spell,191427,Metamorphosis,F
Spell,247938,ChaosBlades,T
Spell,201467,FOTI,D3
Spell,162794,ChaosStrike,D5
Spell,201427,Annihilation,D5
Spell,185123,ThrowGlaives,D1
Spell,188499,BladeDance,D4
Spell,232893,Felblade,Q
Spell,210152,Deathsweep,D4
Spell,198013,EyeBeam,D2
Spell,183752,ConsumeMagic,R
Spell,211881,FelEruption,None
Spell,162243,DemonsBite,None
Spell,202719,ArcaneTorrent
Aura,162264,Metamorphosis
*/
