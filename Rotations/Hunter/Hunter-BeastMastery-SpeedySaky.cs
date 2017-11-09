using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using Frozen.GUI;
using System.Diagnostics;
namespace Frozen.Rotation
{
    public class BeastMastery : CombatRoutine
    {
        private Settings settingsForm;
        public override Form SettingsForm
        {
            get { return settingsForm.FormSettings; }

            set { }
        }


        public override void Initialize()
        {
            settingsForm = new Settings("Hunter Beastmastery by SpeedySaky", WoWClass.Hunter);
            settingsForm.Add("Aspect of the turtle", new NumericUpDown(), 30);
            settingsForm.Add("Exhilaration", new NumericUpDown(), 15);
            settingsForm.Add("Mend Pet", new NumericUpDown(), 50);
            settingsForm.Add("Counter shot", new CheckBox(), true);

            
            Log.Write("Welcome to BeastMastery DPS rotation");
            Log.Write("Suggested builds for Raiding: xx121XX ");
        }

        public override void Stop()
        {
            Log.Write("For any bugs and suggestions contact me on discord--SpeedySaky");
        }

        private int Aspectoftheturtle
        {
            get
            {
                return settingsForm.ReadSetting<int>("Aspect of the turtle");
            }
        }


        private int Exhilaration
        {
            get
            {
                return settingsForm.ReadSetting<int>("Exhilaration");
            }
        }
        private bool Countershot
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Counter shot");
            }
        }
        private int Mendpet
        {
            get
            {
                return settingsForm.ReadSetting<int>("Mend pet");
            }
        }


       
        public override void Pulse()
        {

            if (WoW.PlayerIsChanneling)
                return;

            if (WoW.HasTarget && WoW.TargetIsEnemy)
            {
                if (WoW.CanCast("Aspect of the wild") && UseCooldowns)
                {
                    WoW.CastSpell("Aspect of the wild");
                }

                if (WoW.PlayerHealthPercent <= Exhilaration && WoW.CanCast("Exhilaration"))
                {
                    WoW.CastSpell("Exhilaration");
                }

                if (Countershot && WoW.CanCast("Counter shot") && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Counter shot") && WoW.TargetPercentCast > Random.Next(50, 85))

                {
                    WoW.CastSpell("Counter shot");
                }


                if (WoW.CanCast("Murder of crows") && WoW.Talent(6) == 1)
                {
                    WoW.CastSpell("Murder of crows");
                }


                if (WoW.CanCast("Volley") && WoW.Talent(6) == 3 && !WoW.PlayerHasBuff("Volley"))

                {
                    WoW.CastSpell("Volley");
                }

                if (WoW.HasPet && WoW.PetHealthPercent <= Mendpet && WoW.CanCast("Mend pet"))

                {
                    WoW.CastSpell("Mend pet");
                }
            }

            if (combatRoutine.Type == RotationType.SingleTarget)
            {
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.IsInCombat)

                    if (WoW.CanCast("Bestial wrath"))
                    {
                        WoW.CastSpell("Bestial wrath");
                        return;
                    }

                if (WoW.CanCast("Dire frenzy") && WoW.PlayerBuffStacks("Dire frenzy") <= 1 && WoW.Talent(2) == 2)

                {
                    WoW.CastSpell("Dire frenzy");
                    return;
                }

                if (WoW.CanCast("Dire beast") && WoW.PlayerBuffStacks("Dire beast") <= 1 && WoW.Talent(2) != 2)

                {
                    WoW.CastSpell("Dire beast");
                    return;
                }
                if (WoW.CanCast("Kill command"))
                {
                    WoW.CastSpell("Kill command");
                    return;
                }
                if (WoW.CanCast("Titans thunder"))

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
                if (WoW.HasTarget && WoW.TargetIsEnemy && WoW.IsInCombat)

                    if (WoW.CanCast("Barrage") && WoW.Talent(6) == 2)

                    {
                        WoW.CastSpell("Barrage");
                    }
                if (WoW.CanCast("Stampedo") && WoW.Talent(7) == 1)

                {
                    WoW.CastSpell("Stampedo");
                }

                if (WoW.CanCast("Titans thunder"))

                {
                    WoW.CastSpell("Titans thunder");
                }

                if (WoW.CanCast("Bestial wrath"))
                {
                    WoW.CastSpell("Bestial wrath");
                }
                if (WoW.CanCast("Dire frenzy") && WoW.PlayerBuffStacks("Dire frenzy") <= 1 && WoW.Talent(2) == 2)
                {
                    WoW.CastSpell("Dire frenzy");
                }
                if (WoW.CanCast("Dire beast") && WoW.PlayerBuffStacks("Dire beast") <= 1 & WoW.Talent(2) != 2)

                {
                    WoW.CastSpell("Dire beast");
                    return;
                }

                if (WoW.CanCast("Kill command") && WoW.PetHasBuff("Beast cleave"))
                {
                    WoW.CastSpell("Kill command");
                }
                if (WoW.CanCast("Multi shot") && WoW.PetBuffTimeRemaining("Beast cleave") <= 500 && WoW.CountEnemyNPCsInRange <= 3)
                {
                    WoW.CastSpell("Multi shot");
                }
                if (WoW.CanCast("Multi shot") && WoW.CountEnemyNPCsInRange >= 4)
                {
                    WoW.CastSpell("Multi shot");
                }
                if (WoW.CanCast("Cobra shot") && WoW.Focus >= 80)
                {
                    WoW.CastSpell("Cobra shot");
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
Spell,120360,Barrage
Spell,136,Mend pet
Spell,194386,Volley
Spell,147362,Counter shot
Spell,186265,Aspect of the turtle
Spell,2643,Multi shot
Spell,120679,Dire beast
Spell,19574,Bestial wrath
Spell,131894,Murder of crows
Spell,217200,Dire frenzy
Spell,34026,Kill command
Spell,207068,Titans thunder
Spell,201430,Stampedo
Spell,193530,Aspect of the wild
Spell,193455,Cobra shot
Spell,109304,Exhilaration
Aura,194386,Volley
Aura,217200,Dire frenzy
Aura,246152,Dire frenzy
Aura,120964,Dire beast
Aura,118455,Beast cleave
*/
