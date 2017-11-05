using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using Frozen.GUI;
using System.Diagnostics;
namespace Frozen.Rotation

{
    public class Marksman : CombatRoutine
    {
        private Settings settingsForm;
        public override Form SettingsForm
        {
            get { return settingsForm.FormSettings; }

            set { }
        }

        public override void Initialize()
        {

            settingsForm = new Settings("Hunter Marksman by SpeedySaky", WoWClass.Hunter);
            settingsForm.Add("Aspect of the turtle", new NumericUpDown(), 30);
            settingsForm.Add("Exhilaration", new NumericUpDown(), 15);
            settingsForm.Add("Counter shot", new CheckBox(), true);


            Log.Write("Welcome to Marksman DPS rotation");
            Log.Write("Suggested builds for Raiding: 1313113 ");
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



        bool doneOpener = false;
        public override void OutOfCombatPulse()
        {
            if (doneOpener)
            {
                doneOpener = false;
            }
        }
        public override void Pulse()
        {
            if (WoW.HasTarget && WoW.TargetIsEnemy) //First things go first

                if (WoW.CanCast("Trueshot") && UseCooldowns)
                {
                    WoW.CastSpell("Trueshot");

                }

            if (WoW.PlayerHealthPercent <= Aspectoftheturtle && WoW.CanCast("Aspect of the turtle") )
            {
                WoW.CastSpell("Aspect of the turtle");
                
                return;
            }


            if (WoW.PlayerHealthPercent <= Exhilaration && WoW.CanCast("Exhilaration") )
            {
                WoW.CastSpell("Exhilaration");
                return;
            }


            if (Countershot && WoW.CanCast("Counter shot") && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Counter shot") && WoW.TargetPercentCast > Random.Next(50, 85))

            {
                WoW.CastSpell("Counter shot");
                return;
            }
           
            if (WoW.CanCast("A murder of crows"))
            {
                WoW.CastSpell("A murder of crows");
            }



            if (!doneOpener)
                    {
                        if (WoW.CanCast("Windburst"))
                        {
                            WoW.CastSpell("Windburst");

                        }

                        if (WoW.CanCast("A murder of crows"))
                        {
                            WoW.CastSpell("A murder of crows");

                        }                                       
                        

                        if (WoW.CanCast("Aimed shot") && WoW.Focus >= 60)
                        {
                            WoW.CastSpell("Aimed shot");

                        }


                        if (WoW.CanCast("Arcane shot"))
                        {
                            WoW.CastSpell("Arcane shot");
                            Log.Write("Opener ended");
                            doneOpener = true;
                        }
                    }
                       
            if (combatRoutine.Type == RotationType.SingleTarget) // Do Single Target Stuff here

             {
                if (WoW.HasTarget && WoW.TargetIsEnemy) //First things go first
                    if (doneOpener)


                        if (WoW.CanCast("Aimed shot") && WoW.TargetHasDebuff("Vulnerable") && WoW.TargetDebuffTimeRemaining("Vulnerable") >= 1800)
                        {
                            WoW.CastSpell("Aimed shot");

                        }


                if (WoW.CanCast("Windburst"))
                {
                    WoW.CastSpell("Windburst");

                }
                if (WoW.CanCast("A murder of crows"))
                {
                    WoW.CastSpell("A murder of crows");
                }


                if (WoW.CanCast("Marked shot") && WoW.TargetHasDebuff("Hunters Mark") && WoW.Focus >= 70)
                {
                    WoW.CastSpell("Marked shot");
                }

                if (WoW.CanCast("Arcane shot") && !WoW.PlayerHasBuff("Trueshot") && WoW.Focus <= 60)
                {
                    WoW.CastSpell("Arcane shot");

                }


                if (WoW.CanCast("Arcane shot") && WoW.PlayerHasBuff("Marking Targets") && WoW.Focus <= 60)
                {
                    WoW.CastSpell("Arcane shot");
                    return;
                }



                if (WoW.CanCast("Aimed shot") && WoW.Focus >= 90)
                {
                    WoW.CastSpell("Aimed shot");
                    return;
                }

            }

           

            if (combatRoutine.Type == RotationType.Cleave)
            {
                if (WoW.HasTarget && WoW.TargetIsEnemy)
                   if (doneOpener)
                    {
                        
                       
                        if (WoW.CanCast("Aimed shot") && WoW.TargetHasDebuff("Vulnerable") && WoW.TargetDebuffTimeRemaining("Vulnerable") >= 1800)
                        {
                            WoW.CastSpell("Aimed shot");

                        }
                        if (WoW.CanCast("Windburst"))
                        {
                            WoW.CastSpell("Windburst");

                        }
                        if (WoW.CanCast("Multi shot") && WoW.PlayerHasBuff("Marking Targets") )
                        {
                            WoW.CastSpell("Multi shot");
                            return;
                        }
                        if (WoW.CanCast("Marked shot") && WoW.TargetHasDebuff("Hunters Mark") && WoW.Focus >= 70)
                        {
                            WoW.CastSpell("Marked shot");
                        }

                        if (WoW.CanCast("Multi shot") && WoW.PlayerHasBuff("Bombardment") && WoW.Focus <= 80)
                        {
                            WoW.CastSpell("Multi shot");
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
Spell,204147,Windburst
Spell,186265,Aspect of the turtle
Spell,109304,Exhilaration
Spell,131894,A murder of crows
Spell,193526,Trueshot
Spell,19434,Aimed shot
Spell,185358,Arcane shot
Spell,185901,Marked shot
Spell,2643,Multi shot
Spell,147362,Counter shot
Aura,223138,Marking Targets
Aura,185365,Hunters Mark
Aura,194594,Lock and Load
Aura,187131,Vulnerable
Aura,193526,Trueshot
Aura,35110,Bombardment
*/

