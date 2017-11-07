using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using Frozen.GUI;
using System.Diagnostics;
namespace Frozen.Rotation
{
    public class Restoration : CombatRoutine

    {
        private Settings settingsForm;
        public override Form SettingsForm
        {
            get { return settingsForm.FormSettings; }

            set { }
        }

      

        public override void Initialize()
        {
            Log.Write("Supported build: 2233332", Color.Green);
            Log.Write("Frozen Restoration Druid by Speedysaky", Color.Green);
            Log.Write("This rotations is build according to icy-veins-com/wow/restoration-druid-pve-healing-easy-mode", Color.Blue);
            Log.Write("Make sure you ALWAYS have TANK in FOCUS");
            

            Log.DrawHorizontalLine();
            Log.Write("If you do proving grounds the Tank Id is 5 when it asks you.", Color.Red);
            Log.DrawHorizontalLine();

            settingsForm = new Settings("Restoration Druid by SpeedySaky", WoWClass.Druid);
            settingsForm.Add("Healing Touch", new NumericUpDown(), 70);
            settingsForm.Add("Cenarion Ward", new NumericUpDown(), 50);
            settingsForm.Add("Swiftmend", new NumericUpDown(), 30);
            settingsForm.Add("Regrowth", new NumericUpDown(), 60);
            settingsForm.Add("Wild growth", new NumericUpDown(), 80);
            settingsForm.Add("Rejuvenation", new NumericUpDown(), 95);
            settingsForm.Add("Tranquility", new NumericUpDown(), 60);       


        }

        public override void Stop()
        {
			
        }


        private int HealingTouch
        {
            get
            {
                return settingsForm.ReadSetting<int>("Healing Touch");
            }
        }
        private int Wildgrowth
        {
            get
            {
                return settingsForm.ReadSetting<int>("Wild growth");
            }
           }
private int Tranquility
        {
            get
            {
                return settingsForm.ReadSetting<int>("Tranquility");
            }
        }
        private int Rejuvenation
        {
            get
            {
                return settingsForm.ReadSetting<int>("Rejuvenation");
            }
        }
        private int Regrowth
        {
            get
            {
                return settingsForm.ReadSetting<int>("Regrowth");
            }
        }

        private int Swiftmend
        {
            get
            {
                return settingsForm.ReadSetting<int>("Swiftmend");
            }
        }


        private int CenarionWard
        {
            get
            {
                return settingsForm.ReadSetting<int>("Cenarion Ward");
            }
        }



        public override void OutOfCombatPulse()
		{ 

            if (WoW.CanCast("Healing Touch") && WoW.Level >= 24 && WoW.PartyLowestHealthPercent <= 70)
            {

                WoW.CastSpell("Healing Touch");
                return;
            }
            if (WoW.CanCast("Rejuvenation") && WoW.Level >= 10 && WoW.PartyLowestHealthPercent <= 99 && !WoW.PlayerHasBuff("Rejuvenation") && !WoW.TargetHasBuff("Rejuvenation"))
            {

                WoW.CastSpell("Rejuvenation");
                return;
            }

        }

        
        public override void Pulse()
        {
            if (WoW.PlayerIsChanneling)
                return;
                         
						
                      if (WoW.PlayerHealthPercent == 0 || WoW.IsMounted) return;
                        if (WoW.PlayerIsCasting) return;

                          var lowest = WoW.PartyLowestHealthPercent;
            var average = WoW.CountAlliesUnderHealthPercentage(Wildgrowth);
            var averageHp = WoW.PartyAverageHealthPercent;

            int currentTargetId = WoW.PartyMemberIdWithLowestHealthPercent;

                         if (WoW.PartyMemberIsNeedingADispel != 0)
                         {
                               currentTargetId = WoW.PartyMemberIsNeedingADispel;
                         }

                       if (currentTargetId == 0) return;
                       if (lowest == 100) return;
                       
                       WoW.TargetMember(currentTargetId);
            if (WoW.PartyMemberIsNeedingADispel != 0 && WoW.CanCast("Nature's Cure") && WoW.Level >= 22)
            {
                WoW.CastSpell("Nature's Cure");
                return;
            }


            if (!WoW.TargetIsEnemy && WoW.CanCast("Essence of ghanir") && WoW.Level >= 100)
            {
                WoW.CastSpell("Essence of ghanir");
                return;
            }
            if (!WoW.TargetIsEnemy && WoW.CanCast("Ironbark") && WoW.TankId == currentTargetId && WoW.TargetHealthPercent <= 30 && WoW.Level >= 54)
            {
                WoW.CastSpell("Ironbark");
                return;
            }
            if (WoW.CanCast("Barkskin") && WoW.PlayerHealthPercent <= 50 && WoW.Level >= 26)
            {
                WoW.CastSpell("Barkskin");
                return;
            }

            if (!WoW.TargetIsEnemy && WoW.CanCast("Lifebloom") && WoW.Level >= 20 && !WoW.TargetHasBuff("Lifebloom") && WoW.TankId == currentTargetId )
            {
                WoW.CastSpell("Lifebloom");
                return;
            }

            if (!WoW.TargetIsEnemy && WoW.CanCast("Cenarion Ward") && lowest <= CenarionWard && WoW.Talent(1) == 2)
            {
                WoW.CastSpell("Cenarion Ward");
                return;
            }
            if (!WoW.TargetIsEnemy && WoW.CanCast("Swiftmend") && lowest <= Swiftmend && WoW.Level >= 12)
            {
                WoW.CastSpell("Swiftmend");
                return;
            }


            if (!WoW.TargetIsEnemy && average >= Wildgrowth && WoW.CanCast("Wild growth") && WoW.Level >= 40)
            {
                WoW.CastSpell("Wild growth");
                return;
            }
            if (!WoW.TargetIsEnemy && WoW.CanCast("Regrowth") && WoW.PlayerHasBuff("Clearcasting") && WoW.Level >= 44 && lowest <= Regrowth)
            {
                WoW.CastSpell("Regrowth");
                return;

            }
            if (!WoW.TargetIsEnemy && WoW.CanCast("Regrowth") && lowest <= Regrowth && WoW.Level >= 44)
            {
                WoW.CastSpell("Regrowth");
                return;
            }
                    

            if (!WoW.TargetIsEnemy && WoW.CanCast("Healing Touch") && WoW.Level >= 24 && lowest <= HealingTouch)
            {

                WoW.CastSpell("Healing Touch");
                return;
            }

            if (!WoW.TargetIsEnemy && averageHp <= Tranquility && WoW.CanCast("Tranquility") && WoW.Level >= 80)
            {
                WoW.CastSpell("Tranquility");
                return;

            }
            if (!WoW.TargetIsEnemy && WoW.CanCast("Rejuvenation") && lowest <= Rejuvenation && !WoW.TargetHasBuff("Rejuvenation") && !WoW.PlayerHasBuff ("Rejuvenation") && WoW.Level >= 10)
            {
                WoW.CastSpell("Rejuvenation");
                return;
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
Dispel,145206,Aqua Bomb
*/
