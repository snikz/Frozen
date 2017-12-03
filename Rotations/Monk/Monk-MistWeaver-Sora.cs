using System.Drawing;
using System.Windows.Forms;
using System.Diagnostics;

namespace FrozenNamespace
{
	public class MistweaverMonk : CombatRoutine
	{
		private Settings settingsForm;
        public override Form SettingsForm
        {
            get { return settingsForm.FormSettings; }

            set { }
        }
		
		public override void Initialize()
		{
		// Instructions for user.
		settingsForm = new Settings("Monk-Mistweaver-Sora", WoWClass.Monk);
		Log.Clear();                                                                        
		Log.Write("Mistweaver by Sora", Color.Blue);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("This routine supports 3X3X121", Color.Magenta);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("Fortifying Brew, Detox and CC abilities activated manually.", Color.Blue);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("If you want to DPS on/off turn cleave on/off", Color.Magenta);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("Make sure to set up your healing keybinds", Color.Blue);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("In Proving grounds the tank ID is 5", Color.Magenta);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		Log.Write("If you have any feedback message me in frozen discord or directly", Color.Blue);
		Log.Write("-----------------------------------------------------------------------", Color.DarkGray);
		
		// Forces Pulse to run at all times
		IsHealer = true;
		
		}
		public override void Stop()
		{
		}
		// Checks current Mana
		// Checks if currently in game
		// Allows Tank ID Selection
		public override void Pulse()
		{
			
			if (!WoW.InGame) return;
			
			if (WoW.TankId == 0)
            {
                var f = new frmEnterTankId { TopMost = true };
                f.ShowDialog();
            }
			
			// Checks if player is dead, mounted or casting and does nothing if true
			if (WoW.PlayerHealthPercent == 0 || WoW.IsMounted) return;
			if (WoW.PlayerIsCasting) return;
			
			// Sets a variable for the player with the lowest HP
			var lowest = WoW.PartyLowestHealthPercent;
			
			// Sets a variable for our current target
			var currentTargetID = WoW.PartyMemberIdWithLowestHealthPercent;
			
			// Sets variable for the average party HP
			var averageHp = WoW.PartyAverageHealthPercent;
			
			// Sets our target to be the player with the lowest health percentage
			WoW.TargetMember(currentTargetID);
			
			// Checks if player has a target or if their target is at full health and if so it does nothing.
			if (currentTargetID == 0) return;
            if (lowest == 100) return;
			
			// DPS Rotation
			// Checks is cleave button is turned on.
			if (combatRoutine.Type == RotationType.Cleave)
				
			{
				// Cast Rising Sun Kick
				if (WoW.CanCast("RisingSunKick") && WoW.HasTarget && WoW.TargetIsEnemy && WoW.IsInCombat)
				{
					WoW.CastSpell("RisingSunKick");
					return;
				}
				// Cast Blackout kick if you have 3 buff stacks
				if (WoW.CanCast("Blackout Kick") && WoW.HasTarget && WoW.TargetIsEnemy && WoW.IsInCombat &&
					WoW.PlayerBuffStacks("Blackout Buff") == 3)
				{
					WoW.CastSpell("Blackout Kick");
					return;
				}
				// Cast Tiger palm if you dont have 3 buff stacks
				if (WoW.CanCast("Tiger Palm") && WoW.HasTarget && WoW.TargetIsEnemy && WoW.IsInCombat &&
					WoW.PlayerBuffStacks("Blackout Buff") < 3)
				{
					WoW.CastSpell("Tiger Palm");
					return;
				}
			}	
			
			//CoolDowns
			// If lowest HP party member has less than 85% HP then cast Thunder Focus Tea
			if (lowest <= 85 && !WoW.IsSpellOnCooldown("Thunder Focus Tea"))
			{
				WoW.CastSpell("Thunder Focus Tea");
			}
			// Checks if player has Thunder Focus Tea buff
			if (WoW.PlayerHasBuff("Thunder Focus Tea"))
			{
				// If Player has Thunder Focus tea Buff and Average party HP is 65% then cast Essence Font
				if (averageHp <= 65 && 
					WoW.CanCast("Essence Font") &&
                    !WoW.IsSpellOnCooldown("Essence Font") &&
                    !WoW.PlayerHasBuff("Essence Font"))	
				{
					WoW.CastSpell("Essence Font");
				}
				
				// If Player has Thunder Focus tea Buff and Average party HP is 65% then cast Vivify
				if (averageHp <= 90 &&
                    WoW.CanCast("Vivify") &&
                    !WoW.IsSpellOnCooldown("Vivify"))
                {
                    WoW.CastSpell("Vivify");
                } 
					
			}
			
			//Cast Mana Tea if mana is less than or equal to 70%
			if (WoW.IsInCombat && WoW.Mana <= 70 &&
                !WoW.IsSpellOnCooldown("Mana Tea"))
			{
				WoW.CastSpell("Mana Tea");
				return;
			}
			// If the average HP of party is below 65% cast Revival
			if (WoW.CanCast("Revival") &&
                averageHp <= 65 &&
                !WoW.IsSpellOnCooldown("Revival"))
            {
                WoW.CastSpell("Revival");
                return;
            }
			
			// If Tank HP is below 15% cast Life Cocoon on Tank
			if (WoW.TankHealth <= 25 &&
				WoW.TankId == currentTargetID &&
				WoW.CanCast("Life Cocoon") &&
                !WoW.IsSpellOnCooldown("Life Cocoon"))
            {
                WoW.CastSpell("Life Cocoon");
                return;
            }
			
			// If party hits 15% HP Cast life Cocoon
			if (WoW.CanCast("Life Cocoon") &&
                lowest <= 15 &&
                !WoW.IsSpellOnCooldown("Life Cocoon"))
            {
                WoW.CastSpell("Life Cocoon");
                return;
            }
			
			// Average Healing Priority
			// If the average Hp of the Party is 75% then cast Chi Ji
			if (averageHp < 80)
            {
                if (WoW.CanCast("InvokeChiJitheRedCrane") &&
                    !WoW.IsSpellOnCooldown("InvokeChiJitheRedCrane"))
                {
                    WoW.CastSpell("InvokeChiJitheRedCrane");
                    return;
                }
				
				// If the average Hp of the Party is 75% then cast Essence Font
				if (WoW.CanCast("Essence Font") &&
                    !WoW.IsSpellOnCooldown("Essence Font") &&
                    !WoW.PlayerHasBuff("Essence Font"))
                {
                    WoW.CastSpell("Essence Font");
                    return;
                }
				
				// If the average Hp of the Party is 75% then cast Vivify
                if (WoW.CanCast("Vivify"))
                {
                    WoW.CastSpell("Vivify");
                    return;
                }
	
			}	
			
			// If Renewing Mist can be cast on player without it it will be casted.
			if (WoW.CanCast("Renewing Mist") && WoW.IsInCombat &&
                !WoW.TargetHasBuff("Renewing Mist") &&
                !WoW.PlayerHasBuff("Renewing Mist") &&
                !WoW.IsSpellOnCooldown("Renewing Mist"))
            {
                WoW.CastSpell("Renewing Mist");
                return;
            }
			
			// If above level 100 then cast Sheilun's Gift when not moving
			if (WoW.Level > 100)
            {
                if (WoW.CanCast("Sheiluns Gift") &&
                    lowest <= 75 && !WoW.IsMoving &&
                    WoW.PlayerSpellCharges("Sheiluns Gift") >= 5)
                {
                    WoW.CastSpell("Sheiluns Gift");
                    return;
                }
            }
			
			// Cast Enveloping Mist and does not cast it if it was the last spell cast.
			if (WoW.CanCast("Enveloping Mist") &&
                lowest <= 70 &&
                !WoW.IsMoving &&
                !WoW.TargetHasBuff("Enveloping Mist") &&
                WoW.LastSpell != ("Enveloping Mist"))
            {
                WoW.CastSpell("Enveloping Mist");
                return;
            }
			
			// Casts Vivfy on target with less than or 65% HP
			if (WoW.CanCast("Vivify") &&
                lowest <= 65)
            {
                WoW.CastSpell("Vivify");
                return;
            }
			
			// Casts Effuse on target with less than or 90% HP
            if (WoW.CanCast("Effuse") && lowest <= 90 &&
                !WoW.PlayerIsChanneling)
            {
                WoW.CastSpell("Effuse");
                return;
            }
			// Casts Chi Wave on target with less than or 65% HP
            if (WoW.CanCast("Chi Wave") && lowest <= 95 &&
                WoW.IsInCombat)
            {
                WoW.CastSpell("Chi Wave");
                return;
            }
			
		}
	}
}

/*
[AddonDetails.db]
AddonAuthor=Sora
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,116849,Life Cocoon,S
Spell,115098,Chi Wave,D7
Spell,205406,Sheiluns Gift,None
Spell,197908,Mana Tea,D3
Spell,124682,Enveloping Mist,H
Spell,116680,Thunder Focus Tea,D0
Spell,198664,InvokeChiJitheRedCrane,D2
Spell,116694,Effuse,T
Spell,115151,Renewing Mist,Y
Spell,191837,Essence Font,D5
Spell,115310,Revival,D9
Spell,107428,RisingSunKick,V
Spell,116670,Vivify,B
Spell,100780,Tiger Palm,D2
Spell,100784,Blackout Kick,E
Aura,119611,Renewing Mist
Aura,191840,Essence Font
Aura,202090,Blackout Buff
Aura,124682,Enveloping Mist
Aura,116680,Thunder Focus Tea
Aura,205406,Sheiluns Gift
*/