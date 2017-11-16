using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using Frozen.GUI;
using System.Diagnostics;
namespace Frozen.Rotation
{
    public class Retribution : CombatRoutine
    {
        
        private Settings settingsForm;
        public override Form SettingsForm
        {
            get { return settingsForm.FormSettings; }

            set { }
        }

        public override void Initialize()
        {

            settingsForm = new Settings("Paladin Retribution by SpeedySaky", WoWClass.Paladin);
            settingsForm.Add("Rebuke", new CheckBox(), true);
            settingsForm.Add("Wake of Ashes", new CheckBox(), true);
            settingsForm.Add("Divine Shield", new CheckBox(), true);
            settingsForm.Add("Flash of Light", new CheckBox(), true);
            settingsForm.Add("Flash of Light IN Combat", new CheckBox(), true);
            settingsForm.Add("Lay on Hands", new CheckBox(), true);

            Log.Write("Welcome to Retribution DPS rotation");
            Log.Write("Suggested builds: XXXXXXX ");
        }

        public override void Stop()
        {
            Log.Write("For any bugs and suggestions contact me on discord--SpeedySaky");
        }

        private bool FlashofLightINCombat
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Flash of Light IN Combat");
            }
        }
        private bool Rebuke
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Rebuke");
            }
        }
        private bool LayonHands
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Lay on Hands");
            }
        }
        private bool WakeofAshes
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Wake of Ashes");
            }
        }
        private bool DivineShield
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Divine Shield");
            }
        }
        private bool FlashofLight
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Flash of Light");
            }
        }

        public override void OutOfCombatPulse()
        {
            if (WoW.Level >= 5 && WoW.PlayerHealthPercent <= 30 && WoW.CanCast("Flash of Light") && FlashofLight)
            {
                WoW.CastSpell("Flash of Light");
            }
        }

        private enum Talents
        {
            FinalVerdict,
            ExecutionSentence,
            Consecration,
            TheFiresofJustice,
            Zeal,
            GreaterJudgment,
            FistofJustice,
            Repentance,
            BlindingLight,
            VirtuesBlade,
            BladeofWrath,
            DivineHammer,
            JusticarsVengeance,
            EyeforanEye,
            WordofGlory,
            DivineIntervention,
            Cavalier,
            JudgmentofLight,
            DivinePurpose,
            Crusade,
            HolyWrath
        }

        private static bool HasTalent(Talents talent)
        {
            switch (talent)
            {
                case Talents.FinalVerdict:
                    return WoW.Talent(1) == 1;
                case Talents.ExecutionSentence:
                    return WoW.Talent(1) == 2;
                case Talents.Consecration:
                    return WoW.Talent(1) == 3;
                case Talents.TheFiresofJustice:
                    return WoW.Talent(2) == 1;
                case Talents.Zeal:
                    return WoW.Talent(2) == 2;
                case Talents.GreaterJudgment:
                    return WoW.Talent(2) == 3;
                case Talents.FistofJustice:
                    return WoW.Talent(3) == 1;
                case Talents.Repentance:
                    return WoW.Talent(3) == 2;
                case Talents.BlindingLight:
                    return WoW.Talent(3) == 3;
                case Talents.VirtuesBlade:
                    return WoW.Talent(4) == 1;
                case Talents.BladeofWrath:
                    return WoW.Talent(4) == 2;
                case Talents.DivineHammer:
                    return WoW.Talent(4) == 3;
                case Talents.JusticarsVengeance:
                    return WoW.Talent(5) == 1;
                case Talents.EyeforanEye:
                    return WoW.Talent(5) == 2;
                case Talents.WordofGlory:
                    return WoW.Talent(5) == 3;
                case Talents.DivineIntervention:
                    return WoW.Talent(6) == 1;
                case Talents.Cavalier:
                    return WoW.Talent(6) == 2;
                case Talents.JudgmentofLight:
                    return WoW.Talent(6) == 3;
                case Talents.DivinePurpose:
                    return WoW.Talent(7) == 1;
                case Talents.Crusade:
                    return WoW.Talent(7) == 2;
                case Talents.HolyWrath:
                    return WoW.Talent(7) == 3;
                default:
                    return false;
            }
        }


        public override void Pulse()
        {                   
            if (combatRoutine.Type == RotationType.SingleTarget)
            {
                if (WoW.Level >= 5 && WoW.PlayerHealthPercent <= 30 && WoW.CanCast("Flash of Light") && FlashofLightINCombat)
                {
                    WoW.CastSpell("Flash of Light");
                }
                if (Rebuke && WoW.CanCast("Rebuke") && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Rebuke") && WoW.TargetPercentCast > Random.Next(50, 85))

                {
                    WoW.CastSpell("Rebuke");
                }
                if (LayonHands && WoW.CanCast("Lay on Hands") && WoW.PartyLowestHealthPercent <= 20 && WoW.Level >= 55)

                {
                    WoW.CastSpell("Lay on Hands");
                }
                if (WoW.Level >= 18 && WoW.PlayerHealthPercent <=10 && WoW.CanCast("Divine Shield") && DivineShield)
                {
                    WoW.CastSpell("Divine Shield");
                }

                if (WoW.HasTarget && WoW.TargetIsEnemy)
                {
                    if (WoW.Level >= 100 && HasTalent(Talents.Crusade) && WoW.CanCast("Crusade") && UseCooldowns)
                    {
                        WoW.CastSpell("Crusade");
                    }
                    if (WoW.CanCast("Wake of Ashes") && WoW.Level >= 100 && WoW.CurrentHolyPower < 2 && WakeofAshes || (WoW.CanCast("Wake of Ashes") && WoW.Level >= 100 && WoW.PlayerBuffStacks("Crusade") == 15 && WoW.SpellCooldownTimeRemaining("Crusade") > 30000 ))
                     {
                        WoW.CastSpell("Wake of Ashes");
                        return;
                    }
                    if (WoW.Level >= 100 && HasTalent(Talents.HolyWrath) && WoW.CanCast("HolyWrath") && UseCooldowns && WoW.CountEnemyNPCsInRange >= 2)
                    {
                        WoW.CastSpell("HolyWrath");
                    }
                    if (WoW.CanCast("Avenging Wrath") && WoW.Level >= 80 && !HasTalent(Talents.Crusade) && UseCooldowns)
                    {
                        WoW.CastSpell("Avenging Wrath");
                        return;
                    }
                    if (WoW.CanCast("Judgement") && WoW.Level >= 3 && WoW.IsSpellInRange("Judgement") && !WoW.TargetHasBuff("Judgement"))
                    {
                        WoW.CastSpell("Judgement");
                        return;
                    }

                    if (WoW.CanCast("Zeal") && WoW.Level >= 30 && HasTalent(Talents.Zeal))
                    {
                        WoW.CastSpell("Zeal");
                        return;
                    }
                    if (WoW.CanCast("BlindingLight") && WoW.Level >= 30 && HasTalent(Talents.BlindingLight) && WoW.CountEnemyNPCsInRange >= 2)
                    {
                        WoW.CastSpell("BlindingLight");
                        return;
                    }
                    
                    if (WoW.CanCast("Justicar's Vengeance") && WoW.Level >= 100 && WoW.CurrentHolyPower >= 5 && HasTalent(Talents.JusticarsVengeance))
                    {
                        WoW.CastSpell("Justicar's Vengeance"); 
                        return;
                    }
                    if (WoW.CanCast("EyeforanEye") && WoW.Level >= 100 && WoW.PlayerHealthPercent <= 50 && HasTalent(Talents.EyeforanEye))
                    {
                        WoW.CastSpell("EyeforanEye");
                        return;
                    }
                    if (WoW.CanCast("WordofGlory") && WoW.Level >= 100 && WoW.PartyAverageHealthPercent <= 50 && HasTalent(Talents.WordofGlory) && WoW.CurrentHolyPower >= 3)
                    {
                        WoW.CastSpell("WordofGlory");
                        return;
                    }
                    if (WoW.CanCast("Templar's Verdict") && WoW.Level >= 10 && WoW.CurrentHolyPower >= 3 && WoW.CountEnemyNPCsInRange == 1)
                    {
                        WoW.CastSpell("Templar's Verdict");
                        return;
                    }
                    if (WoW.CanCast("Divine Storm") && WoW.Level >= 10 && WoW.CurrentHolyPower >= 3 && WoW.CountEnemyNPCsInRange >= 2)
                    {
                        WoW.CastSpell("Divine Storm");
                        return;
                    }
                    if (WoW.CanCast("Blade of Justice") && WoW.Level >= 20)
                    {
                        WoW.CastSpell("Blade of Justice");
                        return;
                    }

                    if (WoW.CanCast("Crusader Strike") && WoW.Level <= 30 && !HasTalent(Talents.Zeal))
                    {
                        WoW.CastSpell("Crusader Strike");
                        return;
                    }
                }
            }
        }        
    }
}






/*
[AddonDetails.db]
AddonAuthor=SpeedySaky
AddonName=SpeedySaky
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,85256,Templar's Verdict
Spell,96231,Rebuke
Spell,184662,Shield of Vengeance
Spell,31884,Avenging Wrath
Spell,190784,Divine Steed
Spell,184575,Blade of Justice
Spell,53385,Divine Storm
Spell,205273,Wake of Ashes
Spell,19750,Flash of Light
Spell,35395,Crusader Strike
Spell,20271,Judgement
Spell,217020,Zeal
Spell,231895,Crusade
Spell,642,Divine Shield
Spell,633,Lay on Hands
Spell,215661,Justicar's Vengeance
Spell,203539,Greater Blessing of Wisdom
Spell,203538,Greater Blessing of Kings
Aura,203538,Greater Blessing of Kings
Aura,203539,Greater Blessing of Wisdom
Aura,20271,Judgement
Aura,231895,Crusade
Spell,210220,HolyWrath
Spell,115750,BlindingLight
Spell,205191,EyeforanEye
Spell,210191,WordofGlory
*/
