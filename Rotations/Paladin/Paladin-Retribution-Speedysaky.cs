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
            Log.Write("Welcome to Retribution DPS rotation");
            Log.Write("Suggested builds: 1212222 ");
        }

        public override void Stop()
        {
            Log.Write("For any bugs and suggestions contact me on discord--SpeedySaky");
        }

        private bool Rebuke
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Rebuke");
            }
        }
        public override void OutOfCombatPulse()
        {

        }

        public override void Pulse()
        {

            if (Rebuke && WoW.CanCast("Rebuke") && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Rebuke") && WoW.TargetPercentCast > Random.Next(50, 85))

            {
                WoW.CastSpell("Rebuke");
            }


            if (combatRoutine.Type == RotationType.SingleTarget)
            {

                if (WoW.HasTarget && WoW.TargetIsEnemy)
                {
                    if (WoW.Level >= 100 && WoW.Talent(7) == 2 && WoW.CanCast("Crusade") && UseCooldowns)
                    {
                        WoW.CastSpell("Crusade");
                    }                               
                    
                    if (WoW.CanCast("Judgement") && WoW.Level >= 3 && WoW.IsSpellInRange("Judgement"))

                    {
                        WoW.CastSpell("Judgement");
                        return;
                    }

                    if (WoW.CanCast("Zeal") && WoW.Level >= 30 )
                    {
                        WoW.CastSpell("Zeal");
                        return;
                    }
                    if (WoW.CanCast("Wake of Ashes") && WoW.Level >= 100)
                    {
                        WoW.CastSpell("Wake of Ashes");
                        return;
                    }
                    if (WoW.CanCast("Justicar's Vengeance") && WoW.Level >= 100 && WoW.CurrentHolyPower >= 5 )
                    {
                        WoW.CastSpell("Justicar's Vengeance");
                        return;
                    }
                    if (WoW.CanCast("Templar's Verdict") && WoW.Level >= 10 && WoW.CurrentHolyPower >= 3)
                    {
                        WoW.CastSpell("Templar's Verdict");
                        return;
                    }
                    if (WoW.CanCast("Blade of Justice") && WoW.Level >= 20)
                    {
                        WoW.CastSpell("Blade of Justice");
                        return;
                    }

                    if (WoW.CanCast("Crusader Strike") && WoW.Level <= 30)
                    {
                        WoW.CastSpell("Crusader Strike");
                        return;
                    }
                }
            }

            if (combatRoutine.Type == RotationType.Cleave)
            {
                if (WoW.HasTarget && WoW.TargetIsEnemy)

                    if (WoW.Level >= 100 && WoW.Talent(7) == 2 && WoW.CanCast("Crusade") && UseCooldowns)
                    {
                        WoW.CastSpell("Crusade");
                    }

                      if (WoW.CanCast("Judgement") && WoW.Level >= 3 && WoW.IsSpellInRange("Judgement"))

                        {
                            WoW.CastSpell("Judgement");
                            return;
                        }

                    if (WoW.CanCast("Zeal") && WoW.Level >= 30)
                    {
                        WoW.CastSpell("Zeal");
                        return;
                    }
                    if (WoW.CanCast("Wake of Ashes") && WoW.Level >= 100)
                    {
                        WoW.CastSpell("Wake of Ashes");
                        return;
                    }
                    if (WoW.CanCast("Justicar's Vengeance") && WoW.Level >= 100 && WoW.CurrentHolyPower >= 5)
                    {
                        WoW.CastSpell("Justicar's Vengeance");
                        return;
                    }
                    if (WoW.CanCast("Divine Storm") && WoW.Level >= 10 && WoW.CurrentHolyPower >= 3)
                    {
                        WoW.CastSpell("Divine Storm");
                        return;
                    }
                    if (WoW.CanCast("Blade of Justice") && WoW.Level >= 20)
                    {
                        WoW.CastSpell("Blade of Justice");
                        return;
                    }

                    if (WoW.CanCast("Crusader Strike") && WoW.Level <= 30)
                    {
                        WoW.CastSpell("Crusader Strike");
                        return;
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
*/
