using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;
using System.Diagnostics;

namespace Frozen.Rotation
{
    public class ShamanRestoration : CombatRoutine
    {
        private readonly Stopwatch Totemwatch = new Stopwatch();

        public override Form SettingsForm { get; set; }

        public override void Initialize()
        {
            Log.Write("Welcome to Shaman Restoration by WiNiFiX ", Color.Blue);
        }

        public override void Stop()
        {
        }

        public override void OutOfCombatPulse()
        {
            var lowest = WoW.PartyLowestHealthPercent;
            int currentTargetId = WoW.PartyMemberIdWithLowestHealthPercent;            
            var averageHp = WoW.PartyAverageHealthPercent;
            WoW.TargetMember(currentTargetId);

            WoW.CastSpell("GhostWolf", WoW.IsMoving && !WoW.PlayerHasBuff("GhostWolf"));
			WoW.CastSpell("Riptide", lowest < 98 && !WoW.TargetHasBuff("Riptide"));
        }

		public override void Pulse()
		{			   
            var lowest = WoW.PartyLowestHealthPercent;
			
			if (lowest < 99)
			{
				int currentTargetId = WoW.PartyMemberIdWithLowestHealthPercent;
				
				if (WoW.PartyMemberIsNeedingADispel != 0)
				{
					currentTargetId = WoW.PartyMemberIsNeedingADispel;
				}
							
				var averageHp = WoW.PartyAverageHealthPercent;
				WoW.TargetMember(currentTargetId);
							
				/*-----------------------------Cooldowns-------------------------------------*/
				WoW.CastSpell("HealingTideTotem", WoW.CountAlliesUnderHealthPercentage(40) >= 5 && !WoW.PlayerHasBuff("Ascendence"));
				WoW.CastSpell("Ascendence", WoW.CountAlliesUnderHealthPercentage(40) >= 5 && WoW.IsSpellOnCooldown("HealingTideTotem"));
				WoW.CastSpell("AncestrialGuidance", WoW.CountAlliesUnderHealthPercentage(75) >= 3 && WoW.IsSpellOnCooldown("HealingTideTotem") && !WoW.PlayerHasBuff("Ascendence"));
				/*-----------------------------Cooldowns-------------------------------------*/
			   
				if (WoW.PartyMemberIsNeedingADispel != 0 && WoW.CanCast("Purify Spirit"))
				{
					WoW.CastSpell("Purify Spirit");
					return;
				}
			   
				WoW.CastSpell("Riptide", !WoW.TargetHasBuff("Riptide"));
				WoW.CastSpell("HealingStreamTotem", true);
				WoW.CastSpell("HealingSurge", lowest < 35);
				WoW.CastSpell("ChainHeal", WoW.CountAlliesUnderHealthPercentage(85) >= 3);
				WoW.CastSpell("HealingWave", lowest < 90);
			}
			else
			{			
				WoW.TargetNearestEnemy();		

				WoW.CastSpell("WindShear", WoW.TargetIsCastingAndSpellIsInterruptible && WoW.TargetIsEnemy && WoW.TargetPercentCast > 60);
				
				WoW.CastSpell("FlameShock", WoW.HasTarget && WoW.TargetIsEnemy && WoW.Mana > 70);
				WoW.CastSpell("LavaBurst", WoW.HasTarget && WoW.TargetIsEnemy && WoW.PlayerHasBuff("LavaSurge") && WoW.Mana > 70);
				WoW.CastSpell("LavaBurst", WoW.HasTarget && WoW.TargetIsEnemy && WoW.LastSpell == "LightningBolt" && WoW.Mana > 70);
				WoW.CastSpell("LightningBolt", WoW.HasTarget && WoW.TargetIsEnemy);
			}
		}
    }
}


/*
[AddonDetails.db]
AddonAuthor=Lhasse
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,77130,Purify Spirit,D1
Spell,61295,Riptide,D2
Spell,77472,HealingWave,D3
Spell,8004,HealingSurge,D4
Spell,1064,ChainHeal,D5
Spell,5394,HealingStreamTotem,D6
Spell,108280,HealingTideTotem,D7
Spell,114052,Ascendence,D8
Spell,108281,AncestrialGuidance,D9
Spell,2645,GhostWolf,D0
Spell,157153,Cloudburst Totem
Spell,188838,FlameShock
Spell,51505,LavaBurst
Spell,403,LightningBolt
Spell,57994,WindShear
Aura,61295,Riptide
Aura,53390,TidalWaves
Aura,114052,Ascendence
Aura,2645,GhostWolf
Aura,77762,LavaSurge
Dispel,208165,Withering Soul (CoS Talixae),1
Dispel,225908,Soul Venom (BRH Illysanna),2
Dispel,215204,Hinder (CoS Gerdo),1
Dispel,209033,Fortification (CoS Trash),1
Dispel,209516,Mana Fang (CoS Trash),1
Dispel,209404,Seal Magic (CoS Trash),1
Dispel,209413,Suppress (CoS Trash),1
Dispel,207261,Resonant Slash (CoS Gerdo),1
Dispel,207278,Arcane Lockdown (CoS Gerdo) ,1
Dispel,211470,Bewitch (CoS Trash),1
Dispel,214688,Carrion Swarm (CoS Trash) ,1
Dispel,214690,Cripple (CoS Trash),1
Dispel,224333,Enveloping Winds (CoS Melandrus),1
Dispel,200642,Despair (DHT Trash),3
Dispel,204246,Tormenting Fear (DHTTrash),1
Dispel,201902,Scorching Shot (DHT Xavius),1
Dispel,201842,Curse of Isolation (DHT Xavius),1
Dispel,200182,Festering Rip (DHT Xavius),1
Dispel,193597,Static Nova (EoA Lady Hatecoil),1
Dispel,196144,Sandstorm (EoA Trash),1
Dispel,196059,Sea-Brine Toxin (EoA Trash),1
Dispel,196515,Magic Binding (EoA Trash),1
Dispel,198959,Etch (HoV Trash),1
Dispel,198931,Healing Light (HoV Trash),1
Dispel,198745,Protective Light (HoV Trash),1
Dispel,194640,Curse of Hope (MoS Trash),1
Dispel,194615,Sea Legs (MoS Trash),1
Dispel,194099,Bile Breath (MoS Trash),1
Dispel,198405,Bone Chilling Scream (MoS Trash),1
Dispel,195293,Debilitating Shout (MoS Trash) ,1
Dispel,198410,Necrotic Infusion (MoS Trash),1
Dispel,197264,Taint of the Sea (MoS Helya),1
Dispel,186576,Petrifying Cloud (NL Ularogg),1
Dispel,210150,Toxic Retch (NL Naraxas),1
Dispel,203592,Black Pague  (Arc Trash),1
Dispel,202156,Corrosion (Arc Trash),1
Dispel,210662,Unstable Flux (Arc Trash),1
Dispel,226285,Demonic Ascension (Arc Trash),1
Dispel,210684,Siphon Essence (Arc Trash),1
Dispel,203649,Exterminate (Arc Corstilax),1
Dispel,211632,Brand of the Legion (Arc Trash),1
Dispel,203957,Time Lock (Arc Advisors),1
Dispel,193069,Nightmares (VotW Trash),1
Dispel,203685,Flesh to Stone (VotW Tormentorum),1
Dispel,13338,Curse of Tongues (VotW Tormentorum),1
Dispel,193164,Gift of the Doomsayer (VotW Glazer),1
Dispel,228241,Cursed Touch (Karazhan),1
Dispel,228277,Shackles of Servitude (Karazhan),1
Dispel,228576,Allured (Karazhan),3
Dispel,230297,Brittle Bones (Karazhan),1
Dispel,227832,Coat Check (Karazhan),1
Dispel,229706,Leech Life (Karazhan),1
Dispel,229705,Web (Karazhan),1
Dispel,229716,Curse of Doom (Karazhan),1
Dispel,229159,Chaotic Shadows (Karazhan),1
Dispel,228571,Rotting Bite (Karazhan),1
*/
