using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;

namespace Frozen.Rotation
{
    public class Restoration : CombatRoutine

    {
        private Stopwatch Efflorescence = new Stopwatch();

        public override Form SettingsForm { get; set; }

        public override void Initialize()
        {
            Log.Write("Supported build: 2233332", Color.Green);
            Log.Write("Frozen Restoration Druid by Speedysaky", Color.Green);
            Log.Write("This rotations is build according to https://www.icy-veins.com/wow/restoration-druid-pve-healing-easy-mode", Color.Blue);
            Log.Write("Make sure you ALWAYS have TANK in FOCUS");
            Log.Write("You will need to make macro /cast [@focus] Efflorescence while TANK is in your focus and put that macro to your bar and keybind it", Color.Green);
           



            Log.DrawHorizontalLine();
            Log.Write("If you do proving grounds the Tank Id is 5 when it asks you.", Color.Red);
            Log.DrawHorizontalLine();
        }

        public override void Stop()
        {
			if(Efflorescence.IsRunning && !WoW.IsInCombat)
			{
				Efflorescence.Reset(); // resetting the timer to be able to stop it;
				Efflorescence.Stop(); // stopping the timer @Stop button;
			}
        }
		public override void OutOfCombatPulse()
		{ 
			if(Efflorescence.IsRunning && !WoW.IsInCombat)
			{
				Efflorescence.Reset(); // resetting the timer to be able to stop it;
				Efflorescence.Stop(); // stopping the timer when leaving combat;
			}

            if (WoW.CanCast("Healing Touch") && WoW.Level >= 24 && WoW.PartyLowestHealthPercent <= 50)
            {

                WoW.CastSpell("Healing Touch");
                return;
            }
            if (WoW.CanCast("Rejuvenation") && WoW.Level >= 10 && WoW.PartyLowestHealthPercent <= 99 && !WoW.TargetHasBuff("Rejuvenation"))
            {

                WoW.CastSpell("Rejuvenation");
                return;
            }

        }

        
        public override void Pulse()
                   {
            if (WoW.PlayerIsChanneling)
                return;
                         if (Efflorescence.ElapsedMilliseconds == 0 && WoW.CanCast("Efflorescence")) // that's where you start the timer
					    {
						    Efflorescence.Start();
					    }
			            if (WoW.CanCast("Efflorescence") && Efflorescence.Elapsed.Seconds >= 30) // that's where you check for the given time to cast the spell
                        {
                            WoW.CastSpell("Efflorescence");
                             if (Efflorescence.IsRunning && WoW.LastSpell == ("Efflorescence"))
                                {                    
                        Efflorescence.Reset();
                                }
                return;
                        }
						
                      if (WoW.PlayerHealthPercent == 0 || WoW.IsMounted) return;
                        if (WoW.PlayerIsCasting) return;

                          var lowest = WoW.PartyLowestHealthPercent;

                          int currentTargetId = WoW.PartyMemberIdWithLowestHealthPercent;

                         if (WoW.PartyMemberIsNeedingADispel != 0)
                         {
                               currentTargetId = WoW.PartyMemberIsNeedingADispel;
                         }

                       if (currentTargetId == 0) return;
                       if (lowest == 100) return;
                       var averageHp = WoW.PartyAverageHealthPercent;
                       WoW.TargetMember(currentTargetId);
            if (WoW.PartyMemberIsNeedingADispel != 0 && WoW.CanCast("Nature's Cure") && WoW.Level >= 22)
            {
                WoW.CastSpell("Nature's Cure");
                return;
            }

            if (WoW.CanCast("Barkskin") && WoW.PlayerHealthPercent <= 50 && WoW.Level >= 26)
            {
                WoW.CastSpell("Barkskin");
                return;
            }

            if (WoW.CanCast("Lifebloom") && WoW.Level >= 20 && !WoW.TargetHasBuff("Lifebloom") && WoW.PlayerBuffTimeRemaining("Lifebloom") <= 4500 && WoW.TankId == currentTargetId )
            {
                WoW.CastSpell("Lifebloom");
                return;
            }

            if (WoW.CanCast("Cenarion Ward") && WoW.PartyLowestHealthPercent <= 50 && WoW.Talent(1) == 2)
            {
                WoW.CastSpell("Cenarion Ward");
                return;
            }
            if (WoW.CanCast("Rejuvenation") && WoW.PartyLowestHealthPercent <= 99 && !WoW.TargetHasBuff("Rejuvenation") && WoW.Level >= 10)
            {
                WoW.CastSpell("Rejuvenation");
                return;
            }

            if (WoW.CanCast("Ironbark") && WoW.TankId == currentTargetId && UseCooldowns && WoW.Level >= 54)
            {
                WoW.CastSpell("Ironbark");
                return;
            }

            if (WoW.CanCast("Innervate") && UseCooldowns && WoW.Level >= 50)
            {
                WoW.CastSpell("Innervate");
                return;
            }

            if (WoW.CanCast("Regrowth") && WoW.PlayerHasBuff("Clearcasting") && WoW.PartyLowestHealthPercent <= 75 && WoW.Level >= 44)
            {
                WoW.CastSpell("Regrowth");
                return;
            }

            if (WoW.CanCast("Essence of ghanir") && WoW.Level >= 100)
            {
                WoW.CastSpell("Essence of ghanir");
                return;
            }

            if (WoW.CanCast("Swiftmend") && WoW.PartyLowestHealthPercent <= 50 && WoW.Level >= 12)
            {
                WoW.CastSpell("Swiftmend");
                return;
            }

            if (WoW.CountAlliesUnderHealthPercentage(80) >= 2 && WoW.CanCast("Wild growth") && WoW.Level >= 40)
            {
                WoW.CastSpell("Wild growth");
            }


            if (WoW.CountAlliesUnderHealthPercentage(60) >= 2 && WoW.CanCast("Tranquility") && WoW.Level >= 80)

                WoW.CastSpell("Tranquility");
        }
    }
}
/*
[AddonDetails.db]
AddonAuthor=SpeedySaky
AddonName=SpeedySaky
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,145205,Efflorescence
Spell,22812,Barkskin
Spell,5185,Healing Touch
Spell,88423,Nature's Cure
Spell,33763,Lifebloom
Spell,8936,Regrowth
Spell,102351,Cenarion Ward
Spell,29166,Innervate
Spell,102342,Ironbark
Spell,774,Rejuvenation
Spell,48438,Wild growth
Spell,740,Tranquility
Spell,18562,Swiftmend
Spell,208253,Essence of ghanir
Aura,33763,Lifebloom
Aura,16870,Clearcasting
Aura,774,Rejuvenation
Dispel,206517,Fel Nova
Dispel,218304,Parasitic Fetter
Dispel,216040,Burning Soul
Dispel,206651,Darkening Soul
Dispel,221028,Unstable Decay
Dispel,209158,Blackening Soul
Dispel,211368,Twisted Touch of Life
Dispel,203770,Defiled Vines
Dispel,204078,Bellowing Roar
Dispel,207261,Resonant Slash
Dispel,197262,Taint of the Sea
Dispel,207278,Arcane Lockdown
Dispel,229716,Curse of Doom
Dispel,193698,Curse of the Witch
Dispel,227568,Burning Leg Sweep
Dispel,193668,Savage Blade
Dispel,209485,Drain Magic
Dispel,237391,Alluring Aroma
Dispel,208165,Withering Soul
Dispel,229083,Burning Blast
Dispel,203957,Time Lock
Dispel,228225,Sultry Heat
Dispel,193069,Nightmares
Dispel,211470,Bewitch
Dispel,209033,Fortification
Dispel,198405,Bone Chilling Scream
Dispel,203176,Accelerating Blast
Dispel,197502,Restoration
Dispel,227832,Coat Check
Dispel,228837,Bellowing Roar
Dispel,209404,Seal Magic
Dispel,227987,Dinner Bell!
Dispel,193364,Screams of the Dead
Dispel,227616,Empowered Arms
Dispel,209410,Nightfall Orb
Dispel,209413,Suppress
Dispel,228829,Burning Bones
Dispel,238543,Demonic Mending
Dispel,212031,Charged Blast
Dispel,229706,Leech Life
Dispel,229159,Chaotic Shadows
Dispel,244751,Howling Dark
Dispel,192706,Arcane Bomb
Dispel,193597,Static Nova
Dispel,200182,Festering Rip
Dispel,228794,Flaming Volatile Foam
Dispel,228248,Frost Lick
Dispel,228819,Shadowy Volatile Foam
Dispel,228818,Shadowy Volatile Foam
Dispel,228811,Briney Volatile Foam
Dispel,228810,Briney Volatile Foam
Dispel,228395,Bind Spirit
Dispel,228744,Flaming Volatile Foam
Dispel,228054,Taint of the Sea
Dispel,239810,Sever Soul
Dispel,239923,Spirit Chains
Dispel,243624,Lingering Wail
Dispel,240169,Electric Shock
Dispel,233983,Echoing Anguish
Dispel,236361,Spirit Chains
Dispel,230362,Thundering Shock
*/
