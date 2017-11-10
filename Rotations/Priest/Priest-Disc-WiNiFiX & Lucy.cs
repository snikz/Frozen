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
            settingsForm.Add("Active Atonements", new NumericUpDown(), 3);
            settingsForm.Add("OOC Atonement", new CheckBox(), true);
            settingsForm.Add("Pain Suppression Health", new NumericUpDown(), 10);
            settingsForm.Add("Power Word: Radiance Health", new NumericUpDown(), 80);
            settingsForm.Add("# of injured allies for PWR", new NumericUpDown(), 3);
            settingsForm.Add("DPS when party above", new NumericUpDown(), 80);
            settingsForm.Add("Use Feather for speed", new CheckBox(), true);
            settingsForm.Add("Use Arcane Torrent", new CheckBox(), true);

            Log.Clear();
            Log.WriteFrozen("Welcome to Frozen Disc", Color.Black);
			Log.Write("In loving memory of Winifix's Priest 10/17-4/18", Color.Red);
            Log.Write("Supported Talents: X1XX1XX");
			
			Log.DrawHorizontalLine();
			
			Log.Write("For best results use the following macros:", Color.Red);
			Log.Write("/cast [@targettarget, help][help][] Power Word: Shield", Color.Blue);
			Log.Write("/cast [@targettarget, harm][harm][] Light's Wrath", Color.Blue);
			Log.Write("/cast [@targettarget, help][help][] Plea", Color.Blue);
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

        private int ActiveAtonements
        {
            get
            {
                return settingsForm.ReadSetting<int>("Active Atonements");
            }
        }
		
        private bool OOCAtonement
        {
            get
            {
                return settingsForm.ReadSetting<bool>("OOC Atonement");
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
		
        private bool ArcaneTorrentUI
        {
            get
            {
                return settingsForm.ReadSetting<bool>("Use Arcane Torrent");
            }
        }



        public override void Pulse()
        {
			if (WoW.IsMounted) return;
			
			int OOCPlea = 1;
			while(WoW.PlayerBuffStacks("Sins of the Many") < WoW.GroupSize && !WoW.IsInCombat && OOCAtonement)
			{
				WoW.TargetMember(OOCPlea);
				if (WoW.TargetHasBuff("Atonement"))
				{
					OOCPlea++;
					continue;
				}
				if (!WoW.CanCast("Plea"))
				{
					continue;
				}
                if (OOCPlea > WoW.GroupSize)
                {
                    OOCPlea = 1;
                }
				WoW.TargetMember(OOCPlea);
				WoW.CastSpell("Plea");
				OOCPlea++;
			}

			// While rapture is active, spread Power Word: Shield to players
			int RaptureSpread = 1;
            while(WoW.PlayerHasBuff("Rapture") && WoW.PartyLowestHealthPercent > 60)
            {
				WoW.TargetMember(RaptureSpread);
                if (WoW.TargetHasBuff("Power Word: Shield"))
				{
                    RaptureSpread++;
                    continue;
                }
                if (!WoW.CanCast("Power Word: Shield"))
                {
                    continue;
                }
                if (RaptureSpread > WoW.GroupSize)
                {
                    RaptureSpread = 1;
                }
                WoW.TargetMember(RaptureSpread);
                WoW.CastSpell("Power Word: Shield");
                RaptureSpread++;
            }
			
			// Ask player for TankId when first loading Rotation
            if (WoW.TankId == 0)
            {
                var f = new frmEnterTankId { TopMost = true };
                f.ShowDialog();
            }

			// Use Angelic Feather for speed if enabled in UI
            if (WoW.CanCast("Angelic Feather") && WoW.IsMoving && !WoW.PlayerHasBuff("Angelic Feather") && UseFeatherForSpeed)
            {
                WoW.CastSpell("Angelic Feather");
                return;
            }
			
			// Use Arcane Torrent if selected in UI
			if (WoW.CanCast("Arcane Torrent") && WoW.Mana < 90 && ArcaneTorrentUI && WoW.IsInCombat && !WoW.PlayerIsChanneling)
			{
				WoW.CastSpell("Arcane Torrent");
				return;
			}
                        
            var lowest = WoW.PartyLowestHealthPercent;
            int currentTargetId = WoW.PartyMemberIdWithLowestHealthPercent;
            Log.Write("Party Lowest HP: " + lowest);
                        
            if (lowest >= DPSWhenPartyAbove && WoW.PartyMemberIsNeedingADispel == 0 && WoW.IsInCombat)
            {   
		        // If active Atonements are below UI threshold then spread Atonement with Plea until threshold is met
				int PleaStack = 1;
				while(WoW.PlayerBuffStacks("Sins of the Many") < ActiveAtonements && ActiveAtonements != 0)
				{
					WoW.TargetMember(PleaStack);
					if (WoW.TargetHasBuff("Atonement"))
					{
						PleaStack++;
						continue;
					}
					if (!WoW.CanCast("Plea"))
					{
						continue;
					}
	                if (PleaStack > WoW.GroupSize)
					{
						PleaStack = 1;
					}
					WoW.TargetMember(PleaStack);
					WoW.CastSpell("Plea");
					PleaStack++;
				}		

				// Mitigate damage with Power Word: Shield
				if (WoW.CanCast("Power Word: Shield") && lowest < 90)
				{
					WoW.CastSpell("Power Word: Shield");
					return;
				}	
				
                //DPS Rotation
                WoW.TargetNearestEnemy();
                if (WoW.HasTarget && WoW.TargetIsEnemy)
                {
					if (lowest < 99 && lowest > 95 && WoW.PlayerBuffStacks("Sins of the Many") < ActiveAtonements && ActiveAtonements != 0)
					{
						WoW.CastSpell("Plea");
						return;
					}
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
			
			// Use Shadowfiend to boost healing output via Atonement
            if (averageHp < 90 && WoW.CanCast("Shadowfiend") && WoW.Talent(4) != 3 && WoW.IsInCombat)
            {
                WoW.TargetNearestEnemy();
                WoW.CastSpell("Shadowfiend");
                return;
            }
            // Use Mindbender for mana regardless of Party HP
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
			
			// Uses Power Word: Radiance when UI values are met
			if (WoW.PlayerSpellCharges("PWRadiance") == 2 && WoW.CountAlliesUnderHealthPercentage(PWRHealth) >= PWRAlliesUnderHP)
            {
                WoW.CastSpell("PWRadiance");
                return;
            }

			// Use Shadow Mend when DPSWhenPartyAbove is less than UI value
            if (lowest <= DPSWhenPartyAbove && WoW.CanCast("Shadow Mend"))
            {
                WoW.CastSpell("Shadow Mend");
                return;
			}

			
			// Auto Light's Wrath For Dungeons
			if (WoW.CountAlliesUnderHealthPercentage(60) <= 3 && WoW.GroupSize <= 5 && WoW.PlayerBuffStacks("Sins of the Many") >= 3 && WoW.CanCast("Light's Wrath"))
			{
				WoW.TargetNearestEnemy();
				WoW.CastSpell("Light's Wrath");
				return;
			}
			// Auto Light's Wrath For Raids
			if (WoW.CountAlliesUnderHealthPercentage(60) >= 8 && WoW.GroupSize >= 5 && WoW.PlayerBuffStacks("Sins of the Many") >= 8 && WoW.CanCast("Light's Wrath"))
			{
				WoW.TargetNearestEnemy();
				WoW.CastSpell("Light's Wrath");
				return;
			}
			
			// When player uses Fade, PWRx2+Evangelism to ramp up atonement
			if (WoW.PlayerHasBuff("Fade") && !WoW.IsSpellOnCooldown("Evangelism") && WoW.Talent(7) != 3 && WoW.PlayerSpellCharges("PWRadiance") >= 1)
			{
				WoW.TargetMember(lowest);
				WoW.CastSpell("PWRadiance");
				WoW.TargetMember(2);
				WoW.CastSpell("PWRadiance");
				WoW.CastSpell("Evangelism");
                WoW.TargetNearestEnemy();
				return;
			}
			
			// When player uses Fade, PWRx2+Evangelism to ramp up atonement
			if (WoW.PlayerHasBuff("Fade") && WoW.Talent(7) != 3 && WoW.PlayerSpellCharges("PWRadiance") >= 1)
			{
				WoW.TargetMember(lowest);
				WoW.CastSpell("PWRadiance");
				WoW.TargetMember(2);
				WoW.CastSpell("PWRadiance");
				WoW.CastSpell("Evangelism");
                WoW.TargetNearestEnemy();
				return;
			}
			
				// Refresh PW:S on self (For Questing, doesn't Work in Group)
            if (WoW.PlayerBuffTimeRemaining("Power Word: Shield") < 400 && WoW.CanCast("Power Word: Shield") && WoW.GroupSize == 1)
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
Spell,589,Shadow Word: Pain,1
Spell,204197,Purge the Wicked,2
Spell,214621,Schism,3
Spell,47540,Penance,4
Spell,129250,Power Word: Solace,5
Spell,17,Power Word: Shield,6
Spell,194509,PWRadiance,7
Spell,585,Smite,8
Spell,34433,Shadowfiend,9
Spell,123040,Mindbender,10
Spell,207946,Light's Wrath,11
Spell,33206,Pain Suppression,12
Spell,10060,Power Infusion,13
Spell,527,Purify,14
Spell,200829,Plea,15
Spell,186263,Shadow Mend,16
Spell,121536,Angelic Feather,17
Spell,246287,Evangelism,18
Spell,232633,Arcane Torrent,19
Aura,589,Shadow Word: Pain
Aura,204213,Purge the Wicked
Aura,17,Power Word: Shield
Aura,223166,Overloaded with Light
Aura,33206,Pain Suppression
Aura,10060,Power Infusion
Aura,121557,Angelic Feather
Aura,194384,Atonement
Aura,197763,BorrowedTime
Aura,47536,Rapture
Aura,586,Fade
Aura,198076,Sins of the Many
Item,132455,Norgganan
*/
