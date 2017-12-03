using System.Drawing;
using System.Windows.Forms;

namespace FrozenNamespace
{
    public class Survival : CombatRoutine
    {

        public override Form SettingsForm { get; set; }

        public override void Initialize()
        {
            Log.Write("Welcome to Survival DPS rotation");
            Log.Write("Suggested builds for Raiding: 3231231 ");
            Log.Write("Suggested buildsfor M+: 1321231 ");
        }

        public override void Stop()
        {
            Log.Write("For any bugs and suggestions contact me on discord--SpeedySaky");
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
            if (WoW.PlayerIsChanneling)
            {
                return;
            }
            
            if (WoW.CanCast("Muzzle") && WoW.Level >= 35 && WoW.TargetIsCastingAndSpellIsInterruptible && WoW.IsSpellInRange("Muzzle") && WoW.TargetPercentCast > Random.Next(30, 85))

            {
                WoW.CastSpell("Muzzle");
                return;
            }


            if (WoW.CanCast("Aspect of the Eagle") && WoW.Level >= 40 && UseCooldowns)
            {
                WoW.CastSpell("Aspect of the Eagle");
                return;
            }
            if (WoW.CanCast("Exhilaration") && WoW.PlayerHealthPercent <= 35)
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
                if (WoW.HasTarget && WoW.TargetIsEnemy)

                    if (!doneOpener)
                        if (WoW.CanCast("Harpoon") && WoW.Level >= 10)
                        {
                            WoW.CastSpell("Harpoon");
                            doneOpener = true;
                        }                          
                

                    if (WoW.CanCast("Spitting Cobra") && WoW.Level >= 100 && WoW.Talent(7) == 1 )
                     {
                    WoW.CastSpell("Spitting Cobra");
                    return;
                     }

                if (WoW.CanCast("Raptor Strike") && WoW.Level >= 20 && WoW.PlayerSpellCharges("Mongoose Bite") <= 0)
                {
                    WoW.CastSpell("Raptor Strike");
                    return;
                }
                if (WoW.CanCast("Fury of the Eagle") && WoW.Level >= 40 && WoW.PlayerBuffStacks("Mongoose Fury") >= 3)
                {
                    WoW.CastSpell("Fury of the Eagle");
                    return;
                }
                if (WoW.CanCast("Caltrops") && WoW.Level >= 60 && WoW.Talent(4) == 1)
                {
                    WoW.CastSpell("Caltrops");
                    return;
                }

                if (WoW.CanCast("Explosive Trap") && WoW.Level >= 50)
                {
                    WoW.CastSpell("Explosive Trap");
                    return;
                }

                

                if (WoW.CanCast("Lacerate") && WoW.Level >= 26 && !WoW.TargetHasDebuff("Lacerate") && WoW.TargetDebuffTimeRemaining("Lacerate") <=1000)
                {
                    WoW.CastSpell("Lacerate");
                    return;
                }
                if (WoW.CanCast("Mongoose Bite") && WoW.Level >= 20)
                    {
                    WoW.CastSpell("Mongoose Bite");
                    return;
                 }

                if (WoW.CanCast("Snake hunter") && WoW.Level >= 30 && WoW.PlayerSpellCharges("Mongoose Bite") < 1)
                    {
                     WoW.CastSpell("Snake hunter");
                     return;
                 }

                if (WoW.CanCast("Flanking Strike") && WoW.Level >= 12)
                {
                    WoW.CastSpell("Flanking Strike");
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
Spell,203415,Fury of the Eagle
Spell,201078,Snake hunter
Spell,187708,Carve
Spell,187707,Muzzle
Spell,190925,Harpoon
Spell,191433,Explosive Trap
Spell,194407,Spitting Cobra
Spell,185855,Lacerate
Spell,194277,Caltrops
Spell,186270,Raptor Strike
Spell,190928,Mongoose Bite
Spell,186289,Aspect of the Eagle
Spell,202800,Flanking Strike
Spell,186265,Aspect of the turtle
Spell,109304,Exhilaration
Aura,185855,Lacerate
Aura,201082,Way of the Mok'Nathal
Aura,186289,Fury of the Eagle
Aura,190931,Mongoose Fury
*/
