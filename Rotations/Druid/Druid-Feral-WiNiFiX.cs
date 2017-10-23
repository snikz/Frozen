using System.Windows.Forms;
using Frozen.Helpers;

namespace Frozen.Rotation
{
    public class Feral_WiNiFiX : CombatRoutine
    {
        public override void Initialize()
        {
            Log.Write("Welcome to Feral 7.3 by WiNiFiX...");
            Log.Write("Suggested builds: 3010322 (AOE) or 3010332 (ST)");
        }

        public override void Stop()
        {
            Log.Write("Hope you had a good time.");
        }

        public override void OutOfCombatPulse()
        {
			if (!WoW.PlayerHasBuff("Prowl") && WoW.CanCast("Prowl"))
			{				
				WoW.CastSpell("Prowl");
				return;
			}            
        }

        public override void Pulse()
        {
            var SavageRoarTime = WoW.PlayerBuffTimeRemaining("SavageRoar"); // 200 = 2 seconds
            var RakeTime = WoW.TargetDebuffTimeRemaining("Rake");
            var RipTime = WoW.TargetDebuffTimeRemaining("Rip");
            var MoonfireTime = WoW.TargetDebuffTimeRemaining("Moonfire");
            
			if (UseCooldowns && !WoW.PlayerHasBuff("Prowl") && WoW.CanCast("Berserk"))
			{
				WoW.CastSpell("Berserk"); // No return needed off the GCD				
			}

			if (WoW.PlayerHasBuff("PredatorySwiftness") && WoW.PlayerBuffStacks("Bloodtalons") != 2 && !WoW.PlayerHasBuff("Prowl") && WoW.CanCast("Regrowth"))
			{
				WoW.CastSpell("Regrowth");
				return;
			}

            // Cast Ferocious Bite if at 5 Combo Points and Rip / Savage Roar do not need refreshing within 10 sec.
			
			if (WoW.CurrentComboPoints >= 5 && RipTime > 1000 && SavageRoarTime > 1000 && !WoW.PlayerHasBuff("Prowl") && WoW.CanCast("FerociousBite"))
			{
				WoW.CastSpell("FerociousBite");
				return;
			}

            // Maintain Savage Roar if taken.
			if (WoW.Talent(6) == 3 && SavageRoarTime <= 200 && WoW.CurrentComboPoints >= 1 && WoW.Energy >= 40 && !WoW.PlayerHasBuff("Prowl") && WoW.CanCast("SavageRoar"))
			{
				WoW.CastSpell("SavageRoar");
				return;
			}

            // Maintain Rake.
			if (RakeTime <= 200 && WoW.Energy >= 35 && WoW.CanCast("Rake"))
			{
				WoW.CastSpell("Rake");
				return;
			}

            // Maintain Rip (at below 25%, or with Sabertooth taken, replace with Ferocious Bite).
			if (RipTime <= 200 && WoW.Talent(6) != 1 && WoW.CurrentComboPoints >= 1 && WoW.Energy >= 30 && WoW.CanCast("Rip"))
			{
				WoW.CastSpell("Rip");
				return;
			}
			if (RipTime <= 200 && WoW.TargetHealthPercent <= 25 && WoW.Talent(6) == 1 && WoW.CurrentComboPoints >= 1 && WoW.CanCast("FerociousBite"))
			{
				WoW.CastSpell("FerociousBite");
				return;
			}

            // Maintain Moonfire if Lunar Inspiration is taken.
			if (MoonfireTime <= 200 && WoW.Energy >= 30 && WoW.Talent(1) == 3 && WoW.CanCast("Moonfire"))
			{
				WoW.CastSpell("Moonfire");
				return;
			}

            // Use any Omen of Clarity procs to maintain Thrash if using Luffa Wrappings.
            // Will code this when i get the item till then stuff it.... :)

            // Cast Tiger's Fury at 20 Energy or less.
			if (WoW.Energy <= 20 && WoW.CanCast("TigersFury"))
			{
				WoW.CastSpell("TigersFury"); // Off the GCD no return needed				
			}

            // Cast Ashamane's Frenzy, try to sync this with Tiger's Fury uses.
			if (WoW.CanCast("Ashamane"))
			{
				WoW.CastSpell("Ashamane");
				return;
			}
            
            // Cast Shred to build combo points.
			if ((WoW.Energy >= 40 || WoW.PlayerHasBuff("ClearCasting")) && WoW.CountEnemyNPCsInRange <= 1 && WoW.CanCast("Shred"))
			{
				WoW.CastSpell("Shred");
				return;
			}
			if ((WoW.Energy >= 40 || WoW.PlayerHasBuff("ClearCasting")) && WoW.CountEnemyNPCsInRange >= 2 && WoW.CanCast("Thrash"))
			{
				WoW.CastSpell("Thrash");
				return;
			}

            // When using Brutal Slash, try to make sure that you always have at least one charge on cooldown, 
            // but have as many charges as possible when a wave of enemies comes into range. 
            // Try to have short duration buffs such as Tiger's Fury and Bloodtalons active 
            // on as many high target casts of this as possible, as it deals massive AoE burst damage with each cast.
			if (WoW.Talent(6) == 2 && WoW.Energy >= 20 && WoW.PlayerSpellCharges("BrutalSlash") > 1 && WoW.CanCast("BrutalSlash"))
			{
				WoW.CastSpell("BrutalSlash");
				return;
			}
		
			if (WoW.Talent(6) == 2 && WoW.Energy >= 20 && WoW.PlayerSpellCharges("BrutalSlash") == 1 && WoW.PlayerHasBuff("TigersFury") && WoW.CanCast("BrutalSlash"))
			{
				WoW.CastSpell("BrutalSlash");
				return;
			}
        }

        public override Form SettingsForm { get; set; }
    }
}

/*
[AddonDetails.db]
AddonAuthor=WiNiFiX
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,768,Cat Form,D1
Spell,1079,Rip,V
Spell,1822,Rake,Y
Spell,5215,Prowl,X
Spell,5217,TigersFury,S
Spell,5221,Shred,H
Spell,8936,Regrowth,D0
Spell,22568,FerociousBite,B
Spell,52610,SavageRoar,A
Spell,58984,Shadowmeld,U
Spell,106830,Thrash,D5
Spell,106785,Swipe,D6
Spell,202028,BrutalSlash,D6
Spell,155625,Moonfire,T
Spell,210722,Ashamane,D7
Spell,106951,Berserk,K
Spell,102543,Incarnation,A
Spell,202060,ElunesGuidance,E
Spell,106839,SkullBash,Minus
Aura,5215,Prowl
Aura,768,Cat Form
Aura,1079,Rip
Aura,5217,TigersFury
Aura,52610,SavageRoar
Aura,58984,Shadowmeld
Aura,69369,PredatorySwiftness
Aura,106830,Thrash
Aura,106951,Berserk
Aura,145152,Bloodtalons
Aura,135700,ClearCasting
Aura,155580,LunarinspirationTalent
Aura,155672,BloodtalonsTalent
Aura,155722,Rake
Aura,202031,Sabertooth
Aura,202032,JaggedwoundsTalent
Aura,155625,Moonfire
*/
