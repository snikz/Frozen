using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using Frozen.GUI;
using System.Diagnostics;

namespace Frozen.Rotation
{
    public class Priest : CombatRoutine
    {
        private Settings settingsForm;
        public override Form SettingsForm
        {
            get { return settingsForm.FormSettings; }

            set { }
        }
                
        public override void Initialize()
        {
            settingsForm = new Settings("Disc-Priest-WiNiFiX & Lucy", WoWClass.Priest);
            settingsForm.Add("Pain Suppression Health", new NumericUpDown(), 10);
            settingsForm.Add("Power Word: Radiance Health", new NumericUpDown(), 80);
            settingsForm.Add("# of injured allies for PWR", new NumericUpDown(), 3);
            settingsForm.Add("DPS when party above", new NumericUpDown(), 80);
            settingsForm.Add("Use Feather for speed", new CheckBox(), true);

            Log.Clear();
            Log.WriteFrozen("Welcome to Frozen Disc", Color.Black);
            Log.Write("Supported Talents: X1XX1X1");
			
			Log.DrawHorizontalLine();
			
			Log.Write("Make sure you have macro for /cast [@player] Angelic Feather", Color.Red);
            Log.Write("Ensure you have setup healing keybinds before.", Color.Red);
            
            Log.DrawHorizontalLine();
            Log.Write("If you do proving grounds the Tank Id is 5 when it asks you.", Color.Red);
            Log.DrawHorizontalLine();

            IsHealer = true; // This forces Pulse() to run all the time even out of combat
        }

        public override void Stop()
        {
        }

        private bool HasNorgganan
        {
            get
            {
                return WoW.IsEquippedItem("Norgganan");
            }
        }

        private int PainSuppressionHealth
        {
            get
            {
                return settingsForm.ReadSetting<int>("Pain Suppression Health");
            }
        }
		
        private int PWRHealth
        {
            get
            {
                return settingsForm.ReadSetting<int>("Power Word: Radiance Health");
            }
        }
		
        private int PWRAlliesUnderHP
        {
            get
            {
                return settingsForm.ReadSetting<int>("# of injured allies for PWR");
            }
        }

        private int DPSWhenPartyAbove
        {
            get
            {
                return settingsForm.ReadSetting<int>("DPS when party above");
            }
        }

        private bool UseFeatherForSpeed
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Use Feather for speed");
            }
        }


        public override void Pulse()
        {
			if (WoW.IsMounted) return;
			
            int counter = 1;
            while(counter <= WoW.GroupSize && WoW.PlayerBuffStacks("Sins of the Many") <= 3 && !WoW.IsInCombat)
            {
                if (WoW.TargetHasBuff("Atonement"))
				{
                    counter++;
                    continue;
                }
                if (!WoW.CanCast("Plea"))
                {
                    continue;
                }
                WoW.TargetMember(counter);
                WoW.CastSpell("Plea");
                counter++;
            }
			
            if (WoW.TankId == 0)
            {
                var f = new frmEnterTankId { TopMost = true };
                f.ShowDialog();
            }

            if (WoW.CanCast("Angelic Feather") && WoW.IsMoving && !WoW.PlayerHasBuff("Angelic Feather") && UseFeatherForSpeed)
            {
                WoW.CastSpell("Angelic Feather");
                return;
            }
                        
            var lowest = WoW.PartyLowestHealthPercent;
            int currentTargetId = WoW.PartyMemberIdWithLowestHealthPercent;

            Log.Write("Party Lowest HP: " + lowest);
                        
            if (lowest >= DPSWhenPartyAbove && WoW.PartyMemberIsNeedingADispel == 0 && WoW.IsInCombat && WoW.PlayerBuffStacks("Sins of the Many") >= 3)
            {   
                WoW.TargetNearestEnemy();
                
                //DPS Rotation
                if (WoW.HasTarget && WoW.TargetIsEnemy)
                {
                    //Maintain Shadow Word: Pain(or Purge the Wicked, if you have taken this talent) on the target.
                    if (WoW.TargetDebuffTimeRemaining("Shadow Word: Pain") < 400 && WoW.CanCast("Shadow Word: Pain") && WoW.Talent(6) != 1)
                    {
                        WoW.CastSpell("Shadow Word: Pain");
                        return;
                    }
                    if (WoW.TargetDebuffTimeRemaining("Purge the Wicked") < 400 && WoW.CanCast("Purge the Wicked") && WoW.Talent(6) == 1)
                    {
                        WoW.CastSpell("Purge the Wicked");
                        return;
                    }

                    //Use Schism on cooldown(if you have taken this talent).
                    if (WoW.CanCast("Schism") && WoW.Talent(1) == 3)
                    {
                        WoW.CastSpell("Schism");
                        return;
                    }

                    if (WoW.PlayerHasBuff("Overloaded with Light") && WoW.CanCast("Light's Wrath"))
                    {
                        WoW.CastSpell("Light's Wrath");
                        return;
                    }

                    //Use Penance on cooldown.
                    if (WoW.CanCast("Penance"))
                    {
                        WoW.CastSpell("Penance");
                        return;
                    }

                    //Use Power Word: Solace on cooldown(if you have taken this talent).
                    if (WoW.CanCast("Power Word: Solace") && WoW.Talent(4) == 1)
                    {
                        WoW.CastSpell("Power Word: Solace");
                        return;
                    }

                    if (WoW.CanCast("Shadowfiend") && WoW.Talent(4) != 3)
                    {
                        WoW.CastSpell("Shadowfiend");
                        return;
                    }

                    if (WoW.CanCast("Mindbender") && WoW.Talent(4) == 3)
                    {
                        WoW.CastSpell("Mindbender");
                        return;
                    }

                    //Use Smite as a filler.    
                    if (WoW.CanCast("Smite"))
                    {
                        WoW.CastSpell("Smite");
                        return;
                    }
                }
                return;
            }

            if (WoW.PartyMemberIsNeedingADispel != 0)
            {
                currentTargetId = WoW.PartyMemberIsNeedingADispel;
            }

            var averageHp = WoW.PartyAverageHealthPercent;

            if (averageHp < 60 && WoW.CanCast("Power Infusion") && WoW.Talent(7) == 1)
            {
                WoW.CastSpell("Power Infusion"); // Off GCD no return needed
            }
					
			// Cast Plea when target below 100% HP to apply attonement (currently having trouble getting this to also cast when lowest >= DPSWhenPartyAbove without breaking routine)
			if (!WoW.TargetHasBuff("Atonement") && lowest <= 99 && lowest >= 80 && WoW.CanCast("Plea"))
			{
				WoW.CastSpell("Plea");
				return;
			}
			
            if (WoW.CanCast("Shadowfiend") && WoW.Talent(4) != 3 && WoW.IsInCombat && WoW.Mana < 90)
            {
                WoW.TargetNearestEnemy();
                WoW.CastSpell("Shadowfiend");
                return;
            }

            if (WoW.CanCast("Mindbender") && WoW.Talent(4) == 3 && WoW.IsInCombat && WoW.Mana < 90)
            {
                WoW.TargetNearestEnemy();
                WoW.CastSpell("Mindbender");
                return;
            }

            WoW.TargetMember(currentTargetId); // Target the lowest health party member or the member needing a dispell

            if (WoW.PartyMemberIsNeedingADispel != 0 && WoW.CanCast("Purify"))
            {
                WoW.CastSpell("Purify");
                return;
            }

            // If we are targeting the tank and his HP < 20% Pain Suppression him
            if (lowest <= PainSuppressionHealth && WoW.CanCast("Pain Suppression") && WoW.TankId == currentTargetId)
            {
                WoW.CastSpell("Pain Suppression");
                return;
            }

            // If we are targeting the tank and his HP < 20% Pain Suppression him
            if (lowest <= 95 && WoW.CanCast("Power Word: Shield") && WoW.TankId == currentTargetId)
            {
                WoW.CastSpell("Power Word: Shield");
                return;
            }
			
			// Uses Power Word: Radiance when UI values are met
			if (WoW.CountAlliesUnderHealthPercentage(PWRHealth) >= PWRAlliesUnderHP && WoW.PlayerSpellCharges("PWRadiance") == 2)
            {
                WoW.CastSpell("PWRadiance");
                return;
            }

			// Use Shadow Mend at When DPSWhenPartyAbove is less than UI value
            if (lowest <= DPSWhenPartyAbove && WoW.CanCast("Shadow Mend"))
            {
                WoW.CastSpell("Shadow Mend");
                return;
			}
			
/*             if (WoW.CanCast("Plea") && lowest <= 99 && lowest >= 80)
            {
                WoW.CastSpell("Plea");
                return;
			} */
			
			// While rapture is active, spread Power Word: Shield to players
            while(counter <= WoW.GroupSize && WoW.PlayerHasBuff("Rapture"))
            {
                if (!WoW.CanCast("Power Word: Shield"))
                {
                    continue;
                }
                WoW.TargetMember(counter);
                WoW.CastSpell("Power Word: Shield");
                counter++;
            }
			
				// Mitigate as much damage as possible and always keep PWS up on self
            if (WoW.PlayerBuffTimeRemaining("Power Word: Shield") < 400 && WoW.CanCast("Power Word: Shield"))
            {
                WoW.CastSpell("Power Word: Shield");
                return;
            }       
        }
    }
}

/*
[AddonDetails.db]
AddonAuthor=WiNiFiX
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,589,Shadow Word: Pain
Spell,204197,Purge the Wicked
Spell,214621,Schism
Spell,47540,Penance
Spell,129250,Power Word: Solace
Spell,17,Power Word: Shield
Spell,194509,PWRadiance,9
Spell,585,Smite
Spell,34433,Shadowfiend
Spell,123040,Mindbender
Spell,207946,Light's Wrath
Spell,33206,Pain Suppression
Spell,10060,Power Infusion
Spell,527,Purify
Spell,200829,Plea
Spell,186263,Shadow Mend
Spell,121536,Angelic Feather
Spell,246287,Evangelism
Aura,589,Shadow Word: Pain
Aura,204213,Purge the Wicked
Aura,17,Power Word: Shield
Aura,223166,Overloaded with Light
Aura,33206,Pain Suppression
Aura,10060,Power Infusion
Aura,121557,Angelic Feather
Aura,194384,Atonement
Item,132455,Norgganan
Dispel,145206,Aqua Bomb
Aura,197763,BorrowedTime
Aura,47536,Rapture
Aura,586,Fade
Aura,198076,Sins of the Many
*/
