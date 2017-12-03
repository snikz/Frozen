using System.Drawing;
using System.Windows.Forms;
using System.Timers;
using Frozen.Helpers;

namespace Frozen.Rotation
{
    public class Warlock : CombatRoutine
    {
        // Settings Form
        public override Form SettingsForm { get; set; }

        // Spell History
        public struct History
        {
            private int lastSpell;
            private int secondToLastSpell;
            private int thirdToLastSpell;

            public int LastSpell { get => lastSpell; set => lastSpell = value; }
            public int SecondToLastSpell { get => secondToLastSpell; set => secondToLastSpell = value; }
            public int ThirdToLastSpell { get => thirdToLastSpell; set => thirdToLastSpell = value; }
        }
        public static History spellHistory;

        // Warlock General Statics
        private static string rangeCheckSpell;
        private static string rotation;
        private static int interruptChannel;
        public static string RangeCheckSpell { get => rangeCheckSpell; set => rangeCheckSpell = value; }
        public static string Rotation { get => rotation; set => rotation = value; }
        public static int InterruptChannel { get => interruptChannel; set => interruptChannel = value; }
        public static int OpenerOrder;
        public bool Opener;

        // Warlock General Spells
        private static int lifeTap = 1454;
        private static int healthFunnel = 755;
        public static int LifeTap { get => lifeTap; set => lifeTap = value; }
        public static int HealthFunnel { get => healthFunnel; set => healthFunnel = value; }

        // Warlock General Methods
        public bool ShouldPerformRotation()
        {
            if (WoW.IsInCombat
                && WoW.HasTarget
                && WoW.TargetIsEnemy
                && (!WoW.PlayerIsChanneling || (WoW.PlayerIsChanneling && spellHistory.LastSpell == InterruptChannel))
                && !WoW.PlayerIsCasting
                && !WoW.IsMounted
                && !WoW.IsMoving
                && WoW.IsSpellInRange(RangeCheckSpell))
            {
                return true;
            }
            return false;
        }
        public void AddToSpellHistory(int spell)
        {
            if (spellHistory.LastSpell != 0)
            {
                if (spellHistory.SecondToLastSpell != 0)
                {
                    spellHistory.ThirdToLastSpell = spellHistory.SecondToLastSpell;
                    spellHistory.SecondToLastSpell = spellHistory.LastSpell;
                }
                else
                {
                    spellHistory.SecondToLastSpell = spellHistory.LastSpell;
                }
            }
            spellHistory.LastSpell = spell;
            return;
        }
        public int GetCastTime(double castSpeed)
        {
            int castTime = System.Convert.ToInt32(System.Math.Round(1000f * System.Convert.ToSingle((castSpeed / ((WoW.HastePercent / 100f) + 1)))));
            return castTime;
        }
        public void OutOfCombatReset ()
        {
            if (WoW.PlayerClassSpec == "Warlock-Destruction")
            {
                RangeCheckSpell = "Conflagrate";
                InterruptChannel = ChannelDemonfire;
                Rotation = "Destruction";
            }

            if (WoW.PlayerClassSpec == "Warlock-Demonology")
            {
                RangeCheckSpell = "Doom";
                InterruptChannel = DemonWrath;
                Rotation = "Demonology";
                WildImpsOut = 0;
                DreadstalkersOut = 0;
                GrimoireFelguardOut = 0;
                DoomguardOut = 0;
            }

            if (WoW.PlayerClassSpec == "Warlock-Affliction")
            {
                RangeCheckSpell = "Agony";
                InterruptChannel = DrainSoul;
                Rotation = "Affliction";
            }
            spellHistory.LastSpell = 0;
            spellHistory.SecondToLastSpell = 0;
            spellHistory.ThirdToLastSpell = 0;
            OpenerOrder = 1;
            Opener = true;
        }
        public int Tier19
        {
            get
            {
                string[] idSetbonuses = {
                    "Eyes of Azj'Aqir",
                    "Finery of Azj'Aqir",
                    "Pauldrons of Azj'Aqir",
                    "Clutch of Azj'Aqir",
                    "Leggings of Azj'Aqir",
                    "Cloak of Azj'Aqir"};
                int setbonuses = 0;
                for (int i = 0; i < idSetbonuses.Length; i++)
                    if (WoW.IsEquippedItem(idSetbonuses[i]))
                        setbonuses++;
                return setbonuses;
            }
        }
        public int Tier20
        {
            get
            {
                string[] idSetbonuses = {
                    "Diabolic Shroud",
                    "Diabolic Gloves",
                    "Diabolic Helm",
                    "Diabolic Leggings",
                    "Diabolic Robe",
                    "Diabolic Mantle"};
                int setbonuses = 0;
                for (int i = 0; i < idSetbonuses.Length; i++)
                    if (WoW.IsEquippedItem(idSetbonuses[i]))
                        setbonuses++;
                return setbonuses;
            }
        }
        


        // Demonology Statics
        private static int wildImpsOut;
        private static int dreadstalkersOut;
        private static int grimoireFelguardOut;
        private static int doomguardOut;
        public static int WildImpsOut { get => wildImpsOut; set => wildImpsOut = value; }
        public static int DreadstalkersOut { get => dreadstalkersOut; set => dreadstalkersOut = value; }
        public static int GrimoireFelguardOut { get => grimoireFelguardOut; set => grimoireFelguardOut = value; }
        public static int DoomguardOut { get => doomguardOut; set => doomguardOut = value; }

        // Demonology Spells
        private static int shadowBolt = 686;
        private static int demonBolt = 157695;
        private static int callDreadstalkers = 104316;
        private static int handOfGuldan = 105174;
        private static int demonicEmpowerment = 193396;
        private static int doom = 603;
        private static int demonWrath = 193440;
        private static int darkglare = 205180;
        private static int grimoireFelguard = 111898;
        private static int thalkielsConsumption = 211714;
        private static int shadowFlame = 205181;
        private static int felguard = 30146;
        private static int doomguard = 18540;
        private static int implosion = 196277;
        private static int shadowfury = 30283;
        private static int darkPact = 108416;
        public static int ShadowBolt { get => shadowBolt; set => shadowBolt = value; }
        public static int DemonBolt { get => demonBolt; set => demonBolt = value; }
        public static int CallDreadstalkers { get => callDreadstalkers; set => callDreadstalkers = value; }
        public static int HandOfGuldan { get => handOfGuldan; set => handOfGuldan = value; }
        public static int DemonicEmpowerment { get => demonicEmpowerment; set => demonicEmpowerment = value; }
        public static int Doom { get => doom; set => doom = value; }
        public static int DemonWrath { get => demonWrath; set => demonWrath = value; }
        public static int Darkglare { get => darkglare; set => darkglare = value; }
        public static int GrimoireFelguard { get => grimoireFelguard; set => grimoireFelguard = value; }
        public static int ThalkielsConsumption { get => thalkielsConsumption; set => thalkielsConsumption = value; }
        public static int ShadowFlame { get => shadowFlame; set => shadowFlame = value; }
        public static int Felguard { get => felguard; set => felguard = value; }
        public static int Doomguard { get => doomguard; set => doomguard = value; }
        public static int Implosion { get => implosion; set => implosion = value; }
        public static int Shadowfury { get => shadowfury; set => shadowfury = value; }
        public static int DarkPact { get => darkPact; set => darkPact = value; }

        // Demonology Methods
        public bool ShouldCastDoom()
        {
            //Doom
            if (WoW.HasTarget
                && WoW.TargetIsEnemy
                && WoW.IsInCombat
                && !WoW.IsMounted
                && (!WoW.TargetHasDebuff("Doom") || WoW.TargetDebuffTimeRemaining("Doom") <= 1500) // Change this to the current cast time of shadowbolt
                && (spellHistory.LastSpell != HandOfGuldan || spellHistory.SecondToLastSpell != HandOfGuldan))
            {
                return true;
            }
            return false;
        }
        public bool ShouldCastDemonicEmpowerment()
        {
            if (WoW.CanCast("Demonic Empowerment")
                // Normal demonic empowerment rotation
                && ((((!WoW.CanCast("Call Dreadstalkers") && (WoW.CurrentSoulShards < 2 || !WoW.PlayerHasBuff("Demonic Calling")))
                            || (!WoW.CanCast("Hand of Guldan") && WoW.CurrentSoulShards < 4)
                            || (!WoW.CanCast("Grimoire: Felguard") && WoW.Talent(6) == 2 && WoW.CurrentSoulShards < 1)
                            || (!WoW.CanCast("Doomguard") && WoW.Talent(6) != 1 && WoW.CurrentSoulShards < 1))
                        && (!WoW.PetHasBuff("Demonic Empowerment")
                            || WoW.PetBuffTimeRemaining("Demonic Empowerment") <= 3000
                            || spellHistory.LastSpell == CallDreadstalkers
                            || spellHistory.LastSpell == GrimoireFelguard
                            || spellHistory.LastSpell == Doomguard
                            || spellHistory.LastSpell == HandOfGuldan))
                    // Thalkiels pump
                    || (WoW.CanCast("Thalkiels Consumption") && TotalDemonWeight() >= 688 && spellHistory.LastSpell != DemonicEmpowerment)
                    // Memebuild with demonic empowerment weaving with shadow bolt 1/x/x/2/x/x/x
                    || (TotalDemonsOut() >= 6 && WoW.Talent(1) == 1 && WoW.Talent(4) == 2 && WoW.CurrentSoulShards != 5)
                    // Patchwork build spam DE for shards 3/x/x/2/x/x/x, repeats down below for overriding spell history
                    || (TotalDemonsOut() >= 13 && WoW.Talent(1) == 3 && WoW.Talent(4) == 2 && WoW.CurrentSoulShards != 5))
                && WoW.HasPet
                && (spellHistory.LastSpell != DemonicEmpowerment || (TotalDemonsOut() >= 13 && WoW.Talent(1) == 3 && WoW.Talent(4) == 2 && WoW.CurrentSoulShards != 5)))
            {
                return true;
            }
            return false;
        }
        public void UseShadowyInspiration()
        {
            if (WoW.PlayerHasBuff("Shadowy Inspiration") && WoW.CurrentSoulShards != 5)
            {
                WoW.CastSpell("Shadow Bolt");
                return;
            }
        }
        public void KeepPetSummoned()
        {
            if ((!WoW.HasPet || (WoW.HasPet && WoW.PetHealthPercent == 0))
                && WoW.CurrentSoulShards >= 1
                && !WoW.IsMounted
                && !WoW.PlayerIsCasting
                && !WoW.PlayerIsChanneling
                && (spellHistory.LastSpell != Felguard || (spellHistory.LastSpell != Doomguard && WoW.Talent(6) == 1)))
            {
                if (WoW.Talent(6) != 1)
                {
                    WoW.CastSpell("Felguard");
                    AddToSpellHistory(Felguard);
                    return;
                }
                if (WoW.Talent(6) == 1)
                {
                    WoW.CastSpell("Doomguard");
                    AddToSpellHistory(Doomguard);
                    return;
                }
            }
        }
        // Wild Imp control functions
        public void WildImpsSummoned(int shardsUsed)
        {
            WildImpsOut += shardsUsed;
            RunImpTimer(shardsUsed);
            return;
        }
        public void RunImpTimer(int shardsUsed)
        {
            System.Timers.Timer impTimer = new System.Timers.Timer(12000);
            impTimer.Elapsed += (sender, e) => WildImpsTimedOut(sender, e, shardsUsed);
            impTimer.AutoReset = false;
            impTimer.Enabled = true;
        }
        public void WildImpsTimedOut(object sender, ElapsedEventArgs e, int shardsUsed)
        {
            WildImpsOut -= shardsUsed;
            return;
        }
        // Dreadstalker control functions
        public void DreadStalkersSummoned()
        {
            if (WoW.Talent(2) == 2)
            {
                WildImpsSummoned(2);
            }
            DreadstalkersOut += 2;
            RunDreadTimer();
            return;
        }
        public void RunDreadTimer()
        {
            System.Timers.Timer dreadTimer = new System.Timers.Timer(12000);
            dreadTimer.Elapsed += DreadstalkerTimedOut;
            dreadTimer.AutoReset = false;
            dreadTimer.Enabled = true;
        }
        public void DreadstalkerTimedOut(object sender, ElapsedEventArgs e)
        {
            DreadstalkersOut -= 2;
            return;
        }
        // Grimoire Felguard control functions
        public void GrimoireSummoned()
        {
            GrimoireFelguardOut += 1;
            RunGrimoireTimer();
            return;
        }
        public void RunGrimoireTimer()
        {
            System.Timers.Timer grimoireTimer = new System.Timers.Timer(25000);
            grimoireTimer.Elapsed += GrimoireTimedOut;
            grimoireTimer.AutoReset = false;
            grimoireTimer.Enabled = true;
        }
        public void GrimoireTimedOut(object sender, ElapsedEventArgs e)
        {
            GrimoireFelguardOut -= 1;
            return;
        }
        // Doomguard control functions
        public void DoomguardSummoned()
        {
            DoomguardOut += 1;
            RunDoomguardTimer();
            return;
        }
        public void RunDoomguardTimer()
        {
            System.Timers.Timer doomguardTimer = new System.Timers.Timer(25000);
            doomguardTimer.Elapsed += DoomguardTimedOut;
            doomguardTimer.AutoReset = false;
            doomguardTimer.Enabled = true;
        }
        public void DoomguardTimedOut(object sender, ElapsedEventArgs e)
        {
            DoomguardOut -= 1;
            return;
        }
        // Demon Calulators
        public int TotalDemonsOut()
        {
            int total = 0;
            if (WoW.HasPet && WoW.PetHealthPercent > 0)
            {
                total += 1;
            }
            total += WildImpsOut + DreadstalkersOut + GrimoireFelguardOut + DoomguardOut;
            return total;
        }
        public int TotalDemonWeight()
        {
            //This formula is based on Not's Demonology Guide
            int total = 0;
            if (WoW.HasPet && WoW.PetHealthPercent > 0)
            {
                //Assumes you are using Felguard if you aren't specced for Doomguard
                if (WoW.Talent(6) != 1)
                {
                    total += 156;
                }
                //If you are specced for Doomguard
                if (WoW.Talent(6) == 1)
                {
                    total += 125;
                }
                total += (WildImpsOut * 47) + (DreadstalkersOut * 125) + (GrimoireFelguardOut * 156) + (DoomguardOut * 125);
            }
            return total;
        }

        // Affliction Spells
        private static int reapSouls = 216698;
        private static int agony = 980;
        private static int phantomSingularity = 205179;
        private static int corruption = 172;
        private static int seedOfCorruption = 27243;
        private static int unstableAffliction = 30108;
        private static int drainSoul = 198590;
        private static int drainSoulSnipe = 9999;
        private static int soulHarvest = 196098;
        private static int summonDoomguard = 157757;
        private static int summonInfernal = 157898;
        public static int ReapSouls { get => reapSouls; set => reapSouls = value; }
        public static int Agony { get => agony; set => agony = value; }
        public static int PhantomSingularity { get => phantomSingularity; set => phantomSingularity = value; }
        public static int Corruption { get => corruption; set => corruption = value; }
        public static int SeedOfCorruption { get => seedOfCorruption; set => seedOfCorruption = value; }
        public static int UnstableAffliction { get => unstableAffliction; set => unstableAffliction = value; }
        public static int DrainSoul { get => drainSoul; set => drainSoul = value; }
        public static int DrainSoulSnipe { get => drainSoulSnipe; set => drainSoul = value; }
        public static int SoulHarvest { get => soulHarvest; set => soulHarvest = value; }
        public static int SummonDoomguard { get => summonDoomguard; set => summonDoomguard = value; }
        public static int SummonInfernal { get => summonInfernal; set => summonInfernal = value; }

        // Affliction Methods

        // Destruction Spells
        private static int havoc = 80240;
        private static int immolate = 348;
        private static int conflagrate = 17962;
        private static int incinerate = 29722;
        private static int chaosBolt = 11658;
        private static int rainOfFire = 5740;
        private static int summonDoomguardDestro = 18540;
        private static int summonInfernalDestro = 1122;
        private static int dimensionalRift = 196586;
        private static int shadowBurn = 17877;
        private static int channelDemonfire = 196447;
        private static int cataclysm = 152108;
        private static int grimoireImp = 111859;
        public static int Havoc { get => havoc; set => havoc = value; }
        public static int Immolate { get => immolate; set => immolate = value; }
        public static int Conflagrate { get => conflagrate; set => conflagrate = value; }
        public static int Incinerate { get => incinerate; set => incinerate = value; }
        public static int ChaosBolt { get => chaosBolt; set => chaosBolt = value; }
        public static int RainOfFire { get => rainOfFire; set => rainOfFire = value; }
        public static int SummonDoomguardDestro { get => summonDoomguardDestro; set => summonDoomguardDestro = value; }
        public static int SummonInfernalDestro { get => summonInfernalDestro; set => summonInfernalDestro = value; }
        public static int DimensionalRift { get => dimensionalRift; set => dimensionalRift = value; }
        public static int ShadowBurn { get => shadowBurn; set => shadowBurn = value; }
        public static int ChannelDemonfire { get => channelDemonfire; set => channelDemonfire = value; }
        public static int Cataclysm { get => cataclysm; set => cataclysm = value; }
        public static int GrimoireImp { get => grimoireImp; set => grimoireImp = value; }

        // Destruction Statics

        // Destruction Methods
        public void DestructionOpenerBackdraft ()
        {
            switch (OpenerOrder)
            {
                case 1:
                    if (WoW.CanCast("Incinerate"))
                    {
                        WoW.CastSpell("Incinerate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 2:
                    if (WoW.CanCast("Immolate"))
                    {
                        WoW.CastSpell("Immolate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 3:
                    if (WoW.CanCast("Conflagrate"))
                    {
                        WoW.CastSpell("Conflagrate");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.PlayerSpellCharges("Conflagrate") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 4:
                    Log.Write("Infernal CD time remaining: " + WoW.SpellCooldownTimeRemaining("Infernal"));
                    if (WoW.CanCast("Infernal") && (WoW.CooldownsOn || WoW.PlayerHasBuff("Bloodlust") || WoW.PlayerHasBuff("Heroism") || WoW.PlayerHasBuff("Time Warp") || WoW.PlayerHasBuff("Netherwinds") || WoW.PlayerHasBuff("Drums of War")))
                    {
                        WoW.CastSpell("CursorInfernal");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.CanCast("Doomguard"))
                    {
                        WoW.CastSpell("Doomguard");
                        OpenerOrder++;
                        break;
                    }
                    /*else if (WoW.IsSpellOnCooldown("Infernal") || WoW.IsSpellOnCooldown("Doomguard")) BROKEN
                    {
                        OpenerOrder++;
                        break;
                    }*/
                    break;
                case 5:
                    Log.Write("Imp CD time remaining: " + WoW.SpellCooldownTimeRemaining("Grimoire: Imp"));
                    if (WoW.CanCast("Grimoire: Imp"))
                    {
                        WoW.CastSpell("Grimoire: Imp");
                        OpenerOrder++;
                        break;
                    }
                    /*else if (WoW.IsSpellOnCooldown("Grimoire: Imp")) BROKEN
                    {
                        OpenerOrder++;
                        break;
                    }*/
                    break;
                case 6:
                    if (WoW.CanCast("DimensionalRift") && WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        WoW.CastSpell("DimensionalRift");
                        OpenerOrder++;
                        break;
                    }
                    else if (!WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.PlayerSpellCharges("DimensionalRift") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 7:
                    if (WoW.CanCast("Soul Harvest"))
                    {
                        WoW.CastSpell("Soul Harvest");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.IsSpellOnCooldown("Soul Harvest"))
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 8:
                    if (WoW.CanCast("DimensionalRift") && !WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        WoW.CastSpell("DimensionalRift");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.PlayerSpellCharges("DimensionalRift") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 9:
                    if (WoW.CanCast("DimensionalRift") && !WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        WoW.CastSpell("DimensionalRift");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        OpenerOrder++;
                    }
                    else if (WoW.PlayerSpellCharges("DimensionalRift") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 10:
                    if (WoW.CanCast("DimensionalRift") && !WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        WoW.CastSpell("DimensionalRift");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.PlayerSpellCharges("DimensionalRift") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 11:
                    if (WoW.CanCast("Conflagrate"))
                    {
                        WoW.CastSpell("Conflagrate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 12:
                    if (WoW.HasFocusTarget)
                    {
                        if (WoW.CanCast("Havoc"))
                        {
                            WoW.CastSpell("FocusHavoc");
                            OpenerOrder++;
                            break;
                        }
                        else if (WoW.IsSpellOnCooldown("Havoc"))
                        {
                            OpenerOrder++;
                            break;
                        }
                    }
                    else
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 13:
                    if (WoW.CanCast("ChaosBolt"))
                    {
                        WoW.CastSpell("ChaosBolt");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 14:
                    if (WoW.CanCast("ChannelDemonfire"))
                    {
                        WoW.CastSpell("ChannelDemonfire");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 15:
                    if (WoW.CanCast("Incinerate") && !WoW.PlayerIsChanneling)
                    {
                        WoW.CastSpell("Incinerate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 16:
                    if (WoW.CanCast("Incinerate"))
                    {
                        WoW.CastSpell("Incinerate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 17:
                    if (WoW.CanCast("Conflagrate"))
                    {
                        WoW.CastSpell("Conflagrate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 18:
                    if (WoW.CanCast("ChaosBolt"))
                    {
                        WoW.CastSpell("ChaosBolt");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 19:
                    if (WoW.CanCast("Immolate"))
                    {
                        WoW.CastSpell("Immolate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 20:
                    Opener = false;
                    OpenerOrder = 1;
                    break;
            }
            return;
        }
        public void DestructionOpenerRoaring ()
        {
            switch (OpenerOrder)
            {
                case 1:
                    if (WoW.CanCast("Immolate"))
                    {
                        WoW.CastSpell("Immolate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 2:
                    if (WoW.CanCast("Infernal") && (WoW.CooldownsOn || WoW.PlayerHasBuff("Bloodlust") || WoW.PlayerHasBuff("Heroism") || WoW.PlayerHasBuff("Time Warp") || WoW.PlayerHasBuff("Netherwinds") || WoW.PlayerHasBuff("Drums of War")))
                    {
                        WoW.CastSpell("CursorInfernal");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.CanCast("Doomguard"))
                    {
                        WoW.CastSpell("Doomguard");
                        OpenerOrder++;
                        break;
                    }
                    /*else if (WoW.IsSpellOnCooldown("Infernal") || WoW.IsSpellOnCooldown("Doomguard")) BROKEN
                    {
                        OpenerOrder++;
                        break;
                    }*/
                    break;
                case 3:
                    if (WoW.CanCast("Grimoire: Imp"))
                    {
                        WoW.CastSpell("Grimoire: Imp");
                        OpenerOrder++;
                        break;
                    }
                    /*else if (WoW.IsSpellOnCooldown("Grimoire: Imp")) BROKEN
                    {
                        OpenerOrder++;
                        break;
                    }*/
                    break;
                case 4:
                    if (WoW.CanCast("DimensionalRift") && WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        WoW.CastSpell("DimensionalRift");
                        OpenerOrder++;
                        break;
                    }
                    else if (!WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.PlayerSpellCharges("DimensionalRift") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 5:
                    if (WoW.CanCast("Immolate"))
                    {
                        WoW.CastSpell("Immolate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 6:
                    if (WoW.CanCast("Soul Harvest"))
                    {
                        WoW.CastSpell("Soul Harvest");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.IsSpellOnCooldown("Soul Harvest"))
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 7:
                    if (WoW.CanCast("Conflagrate"))
                    {
                        WoW.CastSpell("Conflagrate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 8:
                    if (WoW.CanCast("Conflagrate"))
                    {
                        WoW.CastSpell("Conflagrate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 9:
                    if (Tier19 >= 4)
                    {
                        if (WoW.CanCast("Conflagrate"))
                        {
                            WoW.CastSpell("Conflagrate");
                            OpenerOrder++;
                            break;
                        }
                    }
                    else
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 10:
                    if (WoW.HasFocusTarget)
                    {
                        if (WoW.CanCast("Havoc"))
                        {
                            WoW.CastSpell("FocusHavoc");
                            OpenerOrder++;
                            break;
                        }
                        else if (WoW.IsSpellOnCooldown("Havoc"))
                        {
                            OpenerOrder++;
                            break;
                        }
                    }
                    else
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 11:
                    if (WoW.CanCast("ChaosBolt"))
                    {
                        WoW.CastSpell("ChaosBolt");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 12:
                    if (WoW.CanCast("Conflagrate"))
                    {
                        WoW.CastSpell("Conflagrate");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 13:
                    if (WoW.CanCast("ChannelDemonfire"))
                    {
                        WoW.CastSpell("ChannelDemonfire");
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 14:
                    if (WoW.CanCast("DimensionalRift") && !WoW.PlayerIsChanneling)
                    {
                        WoW.CastSpell("DimensionalRift");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.PlayerSpellCharges("DimensionalRift") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 15:
                    if (WoW.CanCast("DimensionalRift") && !WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        WoW.CastSpell("DimensionalRift");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.PlayerSpellCharges("DimensionalRift") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 16:
                    if (WoW.CanCast("DimensionalRift") && !WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        WoW.CastSpell("DimensionalRift");
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.IsEquippedItem("Lessons of Space-Time"))
                    {
                        OpenerOrder++;
                        break;
                    }
                    else if (WoW.PlayerSpellCharges("DimensionalRift") == 0)
                    {
                        OpenerOrder++;
                        break;
                    }
                    break;
                case 17:
                    Opener = false;
                    OpenerOrder = 1;
                    break;
            }
            return;
        }

        // Frozen Dependent Methods
        public override void Initialize()
        {
            Log.DrawHorizontalLine();
            Log.Write("Welcome to Possessed 7.3.9.7 - A Warlock rotation by JarlBrak", Color.FromArgb(148, 130, 201));
            Log.Write("To report a bug or to make a feature request, please create an issue on GitHub.", Color.FromArgb(148, 130, 201));
            Log.Write("github.com/jarlbrak/Possessed-Bug-Tracker", Color.FromArgb(148, 130, 201));
            Log.DrawHorizontalLine();
            Log.Write("AFFLICTION:", Color.FromArgb(148, 130, 201));
            Log.Write("Supported Talents: 2&3 / 1&2 / x / 1&2&3 / x / 1 / 1&3", Color.FromArgb(148, 130, 201));
            Log.Write("AOE toggle will NOT manage targets for you! Tab target on your own and the bot will do the rest.", Color.FromArgb(148, 130, 201));
            Log.Write("Use 'Burst' to toggle Soul Harvest casting and shard dumping.", Color.FromArgb(148, 130, 201));
            Log.Write("Use 'Cleave' to toggle Phantom Singularity casting.", Color.FromArgb(148, 130, 201));
            Log.DrawHorizontalLine();
            Log.Write("DEMONOLOGY:", Color.FromArgb(148, 130, 201));
            Log.Write("Supported Talents: 1&3 / 1&2 / x / 1&2 / x / 1&2&3 / 2&3", Color.FromArgb(148, 130, 201));
            Log.Write("If you are glyphed for Wrathguard, you MUST manually assign the Wrathstorm spell as Felstorm in the spellbook.", Color.FromArgb(148, 130, 201));
            Log.Write("AOE toggle will NOT manage targets for you! Tab target on your own and the bot will do the rest.", Color.FromArgb(148, 130, 201));
            Log.Write("Use 'Burst' to toggle cooldown usage.", Color.FromArgb(148, 130, 201));
            Log.DrawHorizontalLine();
            Log.Write("DESTRUCTION:", Color.FromArgb(148, 130, 201));
            Log.Write("Supported Talents: 1&2 / 1&2&3 / x / 2&3 / x / 2 / 1&2&3", Color.FromArgb(148, 130, 201));
            Log.Write("Please create the following macros and place them on your bars with an unused keybind:", Color.FromArgb(148, 130, 201));
            Log.Write("#showtooltip Havoc, /cast [@focus,exists,nodead,harm] Havoc", Color.FromArgb(148, 130, 201));
            Log.Write("#showtooltip Rain of Fire, /cast [@cursor] Rain of Fire", Color.FromArgb(148, 130, 201));
            Log.Write("#showtooltip Summon Infernal(Guardian), /cast [@cursor] Summon Infernal(Guardian)", Color.FromArgb(148, 130, 201));
            Log.Write("After this is complete, go into your Frozen Spellbook and manually bind the key that you assigned the macro to.", Color.FromArgb(148, 130, 201));
            Log.Write("AOE toggle will cast Rain of Fire at your cursor", Color.FromArgb(148, 130, 201));
            Log.Write("Use 'Burst' to toggle Dimensional Rift burst and Lord of Flames burst. Be sure to maintain your cursor on the enemy,", Color.FromArgb(148, 130, 201));
            Log.Write("Summon Infernal will auto cast wherever your cursor is!", Color.FromArgb(148, 130, 201));
            Log.DrawHorizontalLine();

            OutOfCombatReset();
        }
        public override void Stop()
        {
            OutOfCombatReset();
        }
        public override void Pulse()
        {
            if (Rotation == "Affliction")
            {
                // Life tap while moving
                if (WoW.CanCast("Life Tap")
                    && WoW.PlayerHealthPercent > 40
                    && WoW.IsMoving && WoW.Mana < 70)
                {
                    WoW.CastSpell("Life Tap");
                    return;
                }
                // Reap Souls
                if(WoW.CanCast("Reap Souls")
                    && WoW.Talent(1) != 3
                    && !WoW.PlayerIsChanneling
                    && WoW.PlayerHasBuff("Tormented Souls")
                    && !WoW.PlayerHasBuff("Deadwind Harvester")
                    && WoW.PlayerBuffStacks("Tormented Souls") >= 4)
                {
                    WoW.CastSpell("Reap Souls");
                    return;
                }
                // Shard sniping
                if (WoW.CanCast("Drain Soul")
                    && !WoW.HasBossTarget
                    && WoW.TargetIsEnemy
                    && !WoW.IsMounted
                    && !WoW.PlayerIsChanneling
                    && !WoW.IsMoving
                    && WoW.IsSpellInRange("Agony")
                    && WoW.TargetHealthPercent < 10
                    && WoW.CurrentSoulShards <= 5)
                {
                    WoW.CastSpell("Drain Soul");
                    AddToSpellHistory(DrainSoulSnipe);
                    return;
                }
                // Agony Default
                if(WoW.CanCast("Agony")
                    && WoW.HasTarget
                    && WoW.TargetIsEnemy
                    && !WoW.IsMounted
                    && WoW.IsSpellInRange("Agony")
                    && spellHistory.LastSpell != DrainSoulSnipe 
                    && (WoW.TargetDebuffTimeRemaining("Agony") <= 5400) || !WoW.TargetHasDebuff("Agony"))
                {
                    WoW.CastSpell("Agony");
                    return;
                }
                // Phantom Singularity
                if(WoW.Talent(4) == 1
                    && WoW.CanCast("Phantom Singularity")
                    && WoW.HasTarget
                    && WoW.TargetIsEnemy
                    && !WoW.IsMounted
                    && WoW.IsSpellInRange("Agony")
                    && WoW.TargetHasDebuff("Agony")
                    && WoW.TargetHasDebuff("Corruption")
                    && WoW.CleaveOn)
                {
                    WoW.CastSpell("Phantom Singularity");
                    return;
                }
                // Soul Harvest Default
                if (WoW.Talent(4) == 3
                    && WoW.CanCast("Soul Harvest")
                    && (WoW.CooldownsOn || WoW.PlayerHasBuff("Bloodlust") || WoW.PlayerHasBuff("Heroism") || WoW.PlayerHasBuff("Time Warp") || WoW.PlayerHasBuff("Netherwinds") || WoW.PlayerHasBuff("Drums of War")))
                {
                    WoW.CastSpell("Soul Harvest");
                    return;
                }
                // Writhe in Agony
                if (WoW.Talent(1) == 2)
                {
                    // Reap Souls
                    if (WoW.CanCast("Reap Souls")
                        && WoW.PlayerHasBuff("Tormented Souls")
                        && !WoW.PlayerHasBuff("Deadwind Harvester")
                        && WoW.TargetDebuffStacks("UA") >= 1)
                    {
                        WoW.CastSpell("Reap Souls");
                        return;
                    }
                    // Seed of Corruption
                    if (WoW.CanCast("SOC")
                        && WoW.HasTarget
                        && WoW.TargetIsEnemy
                        && !WoW.IsMounted
                        && WoW.AoeOn
                        && !WoW.IsMoving
                        && WoW.IsSpellInRange("Agony")
                        && !WoW.TargetHasDebuff("SOC")
                        && spellHistory.LastSpell != DrainSoulSnipe
                        && WoW.CurrentSoulShards >= 1)
                    {
                        WoW.CastSpell("SOC");
                        return;
                    }
                    // Absolute Corruption
                    if (WoW.Talent(2)== 2)
                    {
                        // Corruption
                        if(WoW.CanCast("Corruption")
                            && WoW.HasTarget
                            && WoW.TargetIsEnemy
                            && !WoW.IsMounted
                            && WoW.IsSpellInRange("Agony")
                            && spellHistory.LastSpell != DrainSoulSnipe
                            && !WoW.TargetHasDebuff("SOC")
                            && !WoW.TargetHasDebuff("Corruption")
                            && WoW.TargetHealthPercent > 5)
                        {
                            WoW.CastSpell("Corruption");
                            return;
                        }
                    }
                    // Contagion
                    else
                    {
                        // Corruption
                        if(WoW.CanCast("Corruption")
                            && WoW.HasTarget
                            && WoW.TargetIsEnemy
                            && !WoW.IsMounted
                            && WoW.IsSpellInRange("Agony")
                            && spellHistory.LastSpell != DrainSoulSnipe
                            && !WoW.TargetHasDebuff("SOC")
                            && WoW.TargetHealthPercent > 5
                            && ((WoW.TargetDebuffTimeRemaining("Corruption") <= 4200) || !WoW.TargetHasDebuff("Corruption")))
                        {
                            WoW.CastSpell("Corruption");
                            return;
                        }
                    }
                    // Unstable Affliction
                    if (WoW.CanCast("Unstable Affliction")
                        && WoW.HasTarget
                        && WoW.TargetIsEnemy
                        && !WoW.IsMounted
                        && !WoW.IsMoving
                        && WoW.IsSpellInRange("Agony")
                        && spellHistory.LastSpell != DrainSoulSnipe
                        && ((WoW.Talent(2) == 1 && WoW.CurrentSoulShards >= 1 && WoW.TargetDebuffStacks("UA") < 1) || WoW.CurrentSoulShards >= 4 || ((WoW.CooldownsOn || WoW.PlayerHasBuff("Soul Harvest") || WoW.PlayerHasBuff("Bloodlust") || WoW.PlayerHasBuff("Heroism") || WoW.PlayerHasBuff("Time Warp") || WoW.PlayerHasBuff("Netherwinds") || WoW.PlayerHasBuff("Drums of War")) && WoW.CurrentSoulShards >= 1))
                        && WoW.TargetDebuffStacks("UA") < 5)
                    {
                        WoW.CastSpell("Unstable Affliction");
                        AddToSpellHistory(UnstableAffliction);
                        return;
                    }
                }
                // Malefic Grasp
                if (WoW.Talent(1) == 3)
                {
                    // Life Tap unique to MG
                    if(WoW.CanCast("Life Tap")
                        && WoW.PlayerHealthPercent > 40
                        && !WoW.IsMoving
                        && !WoW.PlayerIsChanneling
                        && WoW.Mana <= 20
                        && WoW.TargetDebuffStacks("UA") < 2)
                    {
                        WoW.CastSpell("Life Tap");
                        return;
                    }
                    // Reap Souls unique to MG
                    if(WoW.CanCast("Reap Souls")
                        && WoW.HasTarget
                        && WoW.TargetIsEnemy
                        && !WoW.IsMounted
                        && !WoW.PlayerIsChanneling
                        && WoW.PlayerHasBuff("Tormented Souls")
                        && !WoW.PlayerHasBuff("Deadwind Harvester")
                        && ((WoW.TargetDebuffStacks("UA") == 2 && WoW.CurrentSoulShards == 0) || (WoW.TargetDebuffStacks("UA") >= 3)))
                    {
                        WoW.CastSpell("Reap Souls");
                        return;
                    }
                    // Seed of Corruption
                    if(WoW.CanCast("SOC")
                        && (WoW.HasTarget
                        && WoW.TargetIsEnemy
                        && !WoW.IsMounted
                        && WoW.AoeOn
                        && !WoW.IsMoving
                        && WoW.IsSpellInRange("Agony")
                        && spellHistory.LastSpell != DrainSoulSnipe
                        && !WoW.TargetHasDebuff("SOC"))
                        && WoW.CurrentSoulShards >= 1)
                    {
                        WoW.CastSpell("SOC");
                        return;
                    }
                    // Absolute Corruption
                    if (WoW.Talent(2) == 2)
                    {
                        // Corruption
                        if(WoW.CanCast("Corruption")
                            && WoW.HasTarget
                            && WoW.TargetIsEnemy
                            && !WoW.IsMounted
                            && WoW.IsSpellInRange("Agony")
                            && spellHistory.LastSpell != DrainSoulSnipe
                            && !WoW.TargetHasDebuff("SOC")
                            && !WoW.TargetHasDebuff("Corruption")
                            && ((WoW.HasBossTarget && WoW.TargetHealthPercent > 5) || (!WoW.HasBossTarget && WoW.TargetHealthPercent > 20)))
                        {
                            WoW.CastSpell("Corruption");
                            return;
                        }
                    }
                    // Contagion
                    else
                    {
                        // Corruption
                        if(WoW.CanCast("Corruption")
                            && WoW.HasTarget
                            && WoW.TargetIsEnemy
                            && !WoW.IsMounted
                            && WoW.IsSpellInRange("Agony")
                            && spellHistory.LastSpell != DrainSoulSnipe
                            && (!WoW.PlayerIsChanneling || WoW.TargetDebuffStacks("UA") == 0)
                            && !WoW.TargetHasDebuff("SOC")
                            && ((WoW.HasBossTarget && WoW.TargetHealthPercent > 5) || (!WoW.HasBossTarget && WoW.TargetHealthPercent > 20))
                            && (WoW.TargetDebuffTimeRemaining("Corruption") <= 4200) || !WoW.TargetHasDebuff("Corruption"))
                        {
                            WoW.CastSpell("Corruption");
                            return;
                        }
                    }
                    // UA unique to MG
                    if(WoW.CanCast("Unstable Affliction")
                        && WoW.HasTarget
                        && WoW.TargetIsEnemy
                        && !WoW.IsMounted
                        && !WoW.IsMoving
                        && WoW.IsSpellInRange("Agony")
                        && WoW.TargetDebuffTimeRemaining("Agony") > 9000
                        && spellHistory.LastSpell != DrainSoulSnipe
                        && (spellHistory.LastSpell != DrainSoul || WoW.TargetDebuffStacks("UA") == 0)
                        && ((WoW.CurrentSoulShards >= 1 && WoW.TargetDebuffStacks("UA") < 3) || ((WoW.CurrentSoulShards > 3 || (WoW.CurrentSoulShards >= 1 && (WoW.CooldownsOn || WoW.PlayerHasBuff("Soul Harvest") || WoW.PlayerHasBuff("Bloodlust") || WoW.PlayerHasBuff("Heroism") || WoW.PlayerHasBuff("Time Warp") || WoW.PlayerHasBuff("Netherwinds") || WoW.PlayerHasBuff("Drums of War"))) && WoW.TargetDebuffStacks("UA") < 5))))
                    {
                        WoW.CastSpell("Unstable Affliction");
                        AddToSpellHistory(UnstableAffliction);
                        return;
                    }
                    // Drain Soul unique to MG
                    if(WoW.CanCast("Drain Soul")
                        && WoW.HasTarget
                        && WoW.TargetIsEnemy
                        && !WoW.IsMounted
                        && !WoW.PlayerIsChanneling
                        && !WoW.IsMoving
                        && WoW.IsSpellInRange("Agony")
                        && WoW.TargetDebuffStacks("UA") >= 2)
                    {
                        WoW.CastSpell("Drain Soul");
                        AddToSpellHistory(DrainSoul);
                        return;
                    }
                }
                // Low mana stationary fight
                if (WoW.CanCast("Life Tap")
                    && WoW.PlayerHealthPercent > 40
                    && !WoW.PlayerIsChanneling
                    && !WoW.IsMoving && WoW.Mana < 10)
                {
                    WoW.CastSpell("Life Tap");
                    return;
                }
                // Drain Soul Default
                if (WoW.CanCast("Drain Soul")
                    && WoW.HasTarget
                    && WoW.TargetIsEnemy
                    && !WoW.IsMounted
                    && !WoW.PlayerIsChanneling
                    && !WoW.IsMoving
                    && WoW.IsSpellInRange("Agony")
                    && WoW.CurrentSoulShards < 5)
                {
                    WoW.CastSpell("Drain Soul");
                    AddToSpellHistory(DrainSoul);
                    return;
                }
                // Summon DG
                if(WoW.CanCast("Summon Doomguard")
                    && (!WoW.HasPet || WoW.PetHealthPercent == 0)
                    && !WoW.AoeOn
                    && WoW.RotationOn
                    && WoW.CurrentSoulShards >= 1)
                {
                    WoW.CastSpell("Summon Doomguard");
                    return;
                }
                // Summon Infernal
                if(WoW.CanCast("Summon Infernal")
                    && (!WoW.HasPet || WoW.PetHealthPercent == 0)
                    && WoW.AoeOn
                    && WoW.RotationOn
                    && WoW.CurrentSoulShards >= 1)
                {
                    WoW.CastSpell("Summon Infernal");
                    return;
                }
                // Clear drain soul snipe condition if you can not do anything
                if (spellHistory.LastSpell == DrainSoulSnipe)
                {
                    AddToSpellHistory(DrainSoul);
                    return;
                }
            }
            if (Rotation == "Demonology")
            {
                KeepPetSummoned();

                //Doom
                if (ShouldCastDoom())
                {
                    WoW.CastSpell("Doom");
                    return;
                }

                //Life Tap
                if (WoW.CanCast("Life Tap")
                    && !WoW.IsMounted
                    && ((WoW.IsMoving && WoW.Mana < 60) || (!WoW.IsMoving && WoW.Mana < 20))
                    && WoW.PlayerHealthPercent > 40)
                {
                    WoW.CastSpell("Life Tap");
                    return;
                }

                //Burst mode enabled
                if (WoW.CooldownsOn && ShouldPerformRotation())
                {

                    //Grimoire of Service
                    if (WoW.CanCast("Grimoire: Felguard") && WoW.Talent(6) == 2 && WoW.CurrentSoulShards >= 1)
                    {
                        WoW.CastSpell("Grimoire: Felguard");
                        GrimoireSummoned();
                        AddToSpellHistory(GrimoireFelguard);
                        return;
                    }

                    //Doomguard
                    if (WoW.CanCast("Doomguard") && WoW.Talent(6) != 1 && WoW.CurrentSoulShards >= 1)
                    {
                        WoW.CastSpell("Doomguard");
                        DoomguardSummoned();
                        AddToSpellHistory(Doomguard);
                        return;
                    }
                }

                //Rotation
                if (ShouldPerformRotation())
                {
                    UseShadowyInspiration();

                    //Demonic Empowerment
                    if (ShouldCastDemonicEmpowerment())
                    {
                        WoW.CastSpell("Demonic Empowerment");
                        AddToSpellHistory(DemonicEmpowerment);
                        return;
                    }

                    //If consumption is ready combo up to get more demons out
                    if (WoW.CanCast("Thalkiels Consumption"))
                    {
                        //Doomguard/Felguard + Dreadstalkers combo
                        if (WoW.CanCast("Call Dreadstalkers")
                            && (spellHistory.LastSpell == Doomguard || spellHistory.LastSpell == Felguard)
                            && (WoW.PlayerHasBuff("Demonic Calling") || WoW.CurrentSoulShards >= 2))
                        {
                            WoW.CastSpell("Call Dreadstalkers");
                            AddToSpellHistory(CallDreadstalkers);
                            DreadStalkersSummoned();
                            return;
                        }

                        //Doomguard/Felguard + Hand of Guldan combo
                        if (WoW.CanCast("Hand of Guldan")
                            && WoW.CurrentSoulShards >= 2
                            && (spellHistory.LastSpell == Doomguard || spellHistory.LastSpell == Felguard))
                        {
                            if (WoW.CurrentSoulShards > 4)
                            {
                                WoW.CastSpell("Hand of Guldan");
                                AddToSpellHistory(HandOfGuldan);
                                WildImpsSummoned(4);
                            }
                            else
                            {
                                WoW.CastSpell("Hand of Guldan");
                                AddToSpellHistory(HandOfGuldan);
                                WildImpsSummoned(WoW.CurrentSoulShards);
                            }
                            return;
                        }

                        //Hand of Guldan + Dreadstalkers combo
                        if (WoW.CanCast("Call Dreadstalkers")
                            && spellHistory.LastSpell == HandOfGuldan
                            && (WoW.PlayerHasBuff("Demonic Calling") || WoW.CurrentSoulShards >= 2))
                        {
                            WoW.CastSpell("Call Dreadstalkers");
                            AddToSpellHistory(CallDreadstalkers);
                            DreadStalkersSummoned();
                            return;
                        }

                        //Thalkiels Consumption combo with Demonic Empowerment
                        if (WoW.CanCast("Thalkiels Consumption")
                            && TotalDemonWeight() >= 688 //Equivalent of Felguard(Pet) + 6 Imps + 2 Dreadstalkers
                            && (spellHistory.LastSpell == DemonicEmpowerment || (spellHistory.SecondToLastSpell == DemonicEmpowerment && (spellHistory.LastSpell != HandOfGuldan || spellHistory.LastSpell != CallDreadstalkers))))
                        {
                            Log.Write("Total Demons Out: " + TotalDemonsOut(), Color.Purple);
                            Log.Write("Total Demon Weight: " + TotalDemonWeight(), Color.Purple);
                            WoW.CastSpell("Thalkiels Consumption");
                            AddToSpellHistory(ThalkielsConsumption);
                            return;
                        }
                    }

                    //Dreadstalkers
                    if (WoW.CanCast("Call Dreadstalkers")
                        && (WoW.CurrentSoulShards >= 2 || WoW.PlayerHasBuff("Demonic Calling")))
                    {
                        WoW.CastSpell("Call Dreadstalkers");
                        AddToSpellHistory(CallDreadstalkers);
                        DreadStalkersSummoned();
                        return;
                    }

                    //Hand of Guldan
                    if (WoW.CanCast("Hand of Guldan")
                        && spellHistory.LastSpell != HandOfGuldan
                        && (WoW.CurrentSoulShards >= 4 || (WoW.CurrentSoulShards >= 2 && WoW.TargetDebuffTimeRemaining("Doom") <= 3000)))
                    {
                        if (WoW.CurrentSoulShards > 4)
                        {
                            WoW.CastSpell("Hand of Guldan");
                            AddToSpellHistory(HandOfGuldan);
                            WildImpsSummoned(4);
                        }
                        else
                        {
                            WoW.CastSpell("Hand of Guldan");
                            AddToSpellHistory(HandOfGuldan);
                            WildImpsSummoned(WoW.CurrentSoulShards);
                        }
                        return;
                    }

                    //Felstorm
                    if (WoW.CanCast("Felstorm") && WoW.HasPet && WoW.Talent(6) != 1)
                    {
                        WoW.CastSpell("Felstorm");
                    }

                    //Shadowbolt/Demonbolt
                    if ((WoW.CanCast("Demonbolt") && !WoW.AoeOn && WoW.Talent(7) == 2)
                        && WoW.CurrentSoulShards != 5)
                    {
                        WoW.CastSpell("Demonbolt");
                        return;
                    }
                    if ((WoW.CanCast("Shadow Bolt") && !WoW.AoeOn)
                        && WoW.CurrentSoulShards != 5)
                    {
                        WoW.CastSpell("Shadow Bolt");
                        return;
                    }
                }

                //Health Funnel
                if (WoW.CanCast("Health Funnel")
                    && !WoW.PlayerIsCasting
                    && !WoW.PlayerIsChanneling
                    && WoW.PetHealthPercent <= 30
                    && WoW.IsInCombat
                    && !WoW.IsMoving
                    && !WoW.IsMounted
                    && WoW.HasPet)
                {
                    WoW.CastSpell("Health Funnel");
                    return;
                }

                // Cast Demonwrath when in combat and moving
                if (WoW.CanCast("Demonwrath")
                    && (WoW.IsMoving || (!WoW.IsMoving && WoW.AoeOn))
                    && WoW.CurrentSoulShards <= 4
                    && !WoW.IsMounted
                    && !WoW.PlayerIsCasting
                    && !WoW.PlayerIsChanneling
                    && WoW.HasTarget
                    && WoW.TargetIsEnemy
                    && WoW.IsInCombat
                    && WoW.TargetHasDebuff("Doom"))
                {
                    WoW.CastSpell("Demonwrath");
                    AddToSpellHistory(DemonWrath);
                    return;
                }
            }
            if (Rotation == "Destruction")
            {
                // Check for opener toggle
                if (Opener)
                {
                    // Backdraft
                    if (WoW.Talent(1) == 1)
                    {
                        DestructionOpenerBackdraft();
                        return;
                    }
                    // Roaring Blaze
                    if (WoW.Talent(1) == 2)
                    {
                        DestructionOpenerRoaring();
                        return;
                    }
                }

                // Life tap while moving
                if (WoW.CanCast("Life Tap") && WoW.PlayerHealthPercent > 40 && WoW.IsMoving && WoW.Mana < 70)
                {
                    WoW.CastSpell("Life Tap");
                    return;
                }

                // Apply Havoc if a secondary target is present
                if (WoW.HasFocusTarget && WoW.CanCast("Havoc") && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("FocusHavoc");
                    return;
                }

                // Maintain Immolate
                if (WoW.CanCast("Immolate") && !WoW.PlayerIsChanneling && spellHistory.LastSpell != Immolate && (!WoW.TargetHasDebuff("Immolate") || (WoW.FocusHasDebuff("Havoc") && !WoW.FocusHasDebuff("Immolate")) || (WoW.TargetDebuffTimeRemaining("Immolate") <= 5400 && WoW.Talent(1) != 2) || (WoW.TargetDebuffTimeRemaining("Immolate") <= GetCastTime(1.5f) && WoW.Talent(1) == 2 && WoW.PlayerSpellCharges("Conflagrate") == 2)))
                {
                    WoW.CastSpell("Immolate");
                    AddToSpellHistory(Immolate);
                    return;
                }

                // If playing Empower Life tap you should have 100% uptime on this regardless of not needing mana
                if (WoW.CanCast("Life Tap") && !WoW.PlayerIsChanneling && WoW.Talent(2) == 3 && (!WoW.PlayerHasBuff("EmpoweredLifeTap") || WoW.PlayerBuffTimeRemaining("EmpoweredLifeTap") < 1) && WoW.PlayerHealthPercent > 40)
                {
                    WoW.CastSpell("Life Tap");
                    return;
                }
                
                // Use Summon Infernal on CD if Lord of Flames is up
                if (WoW.CanCast("Infernal") && !WoW.PlayerIsChanneling && !WoW.PlayerHasDebuff("Lord of Flames") && WoW.CurrentSoulShards >= 1 && ((WoW.CooldownsOn || WoW.PlayerHasBuff("Bloodlust") || WoW.PlayerHasBuff("Heroism") || WoW.PlayerHasBuff("Time Warp") || WoW.PlayerHasBuff("Netherwinds") || WoW.PlayerHasBuff("Drums of War"))))
                {
                    WoW.CastSpell("CursorInfernal");
                    AddToSpellHistory(SummonInfernalDestro);
                    return;
                }

                // Soul Harvest
                if (WoW.CanCast("Soul Harvest") && !WoW.PlayerIsChanneling && WoW.TargetHasDebuff("Immolate") && (WoW.CooldownsOn || WoW.PlayerHasBuff("Bloodlust") || WoW.PlayerHasBuff("Heroism") || WoW.PlayerHasBuff("Time Warp") || WoW.PlayerHasBuff("Netherwinds") || WoW.PlayerHasBuff("Drums of War")))
                {
                    WoW.CastSpell("Soul Harvest");
                    return;
                }
                
                // Never cap on Soul Shards, make sure you cast Chaos Bolts at 4.5~ Soul Shards in order to avoid waisting a Soul Shard.
                // When playing Eradication you should focus on keeping as high uptime on the debuff as possible. Obviously make your Chaos Bolt hit a target affected by Eradication.
                if (WoW.CanCast("ChaosBolt") && !WoW.PlayerIsChanneling && (WoW.CurrentSoulShards >= 4 || ((((WoW.IsEquippedItem("Soul of the Netherlord") || WoW.Talent(2) == 2) && !WoW.TargetHasDebuff("Eradication")) || WoW.FocusHasDebuff("Havoc")) && WoW.CurrentSoulShards >= 2)))
                {
                    WoW.CastSpell("ChaosBolt");
                    AddToSpellHistory(ChaosBolt);
                    return;
                }

                // Dont cap on Dimensional rift, if playing with Lessons of Space-time you should save stacks for times when you're about to cast multiple Chaos Bolts. If you're not playing with Lessons of Space-time you should try save these stacks for when you have to move.
                if ((WoW.PlayerSpellCharges("DimensionalRift") == 3 || (WoW.PlayerSpellCharges("DimensionalRift") == 2 && WoW.SpellCooldownTimeRemaining("DimensionalRift") >= 4000) || WoW.IsMoving || WoW.CooldownsOn) && WoW.CanCast("DimensionalRift") && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("DimensionalRift");
                    AddToSpellHistory(DimensionalRift);
                    return;
                }
                
                // Use Summon Doomguard on CD
                if (WoW.CanCast("Doomguard") && WoW.CurrentSoulShards >= 1 && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("Doomguard");
                    AddToSpellHistory(SummonDoomguardDestro);
                    return;
                }
                
                // Use Grimoire: Imp on CD
                if (WoW.CanCast("Grimoire: Imp") && WoW.CurrentSoulShards >= 1 && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("Grimoire: Imp");
                    AddToSpellHistory(GrimoireImp);
                    return;
                }

                // Channel Demonfire on CD
                if (WoW.Talent(7) == 2 && WoW.CanCast("ChannelDemonfire") && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("ChannelDemonfire");
                    AddToSpellHistory(ChannelDemonfire);
                    return;
                }

                // Rain of Fire on 3 enemies, 4 if havoc is up and you can CB instead
                if (WoW.CanCast("RainOfFire") && WoW.AoeOn && WoW.CurrentSoulShards >= 3 && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("CursorRainOfFire");
                    return;
                }

                // Dont cap on Conflagrate stacks, use this to generate shards when low
                if ((WoW.PlayerSpellCharges("Conflagrate") == 2 || (WoW.PlayerSpellCharges("Conflagrate") == 1 && WoW.SpellCooldownTimeRemaining("Conflagrate") >= 1500) ||WoW.CurrentSoulShards <= 2) && WoW.CanCast("Conflagrate") && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("Conflagrate");
                    AddToSpellHistory(Conflagrate);
                    return;
                }

                // Life Tap if very low on mana
                if (WoW.CanCast("Life Tap") && WoW.PlayerHealthPercent > 40 && !WoW.PlayerIsChanneling && !WoW.IsMoving && WoW.Mana < 10 && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("Life Tap");
                    return;
                }

                // Fill with Incinerate
                if (WoW.CanCast("Incinerate") && !WoW.PlayerIsChanneling)
                {
                    WoW.CastSpell("Incinerate");
                    AddToSpellHistory(Incinerate);
                    return;
                }
            }
        }
        public override void OutOfCombatPulse()
        {
            OutOfCombatReset();
        }
    }
}

/*
[AddonDetails.db]
AddonAuthor=JarlBrak
AddonName=Frozen
WoWVersion=Legion - 70300
[SpellBook.db]
Spell,686,Shadow Bolt,1
Spell,157695,Demonbolt,2
Spell,193396,Demonic Empowerment,3
Spell,603,Doom,4
Spell,104316,Call Dreadstalkers,5
Spell,105174,Hand of Guldan,6
Spell,211714,Thalkiels Consumption,7
Spell,196277,Implosion,8
Spell,193440,Demonwrath,9
Spell,755,Health Funnel,10
Spell,1454,Life Tap,11
Spell,30146,Felguard,12
Spell,111898,Grimoire: Felguard,13
Spell,18540,Doomguard,14
Spell,205180,Darkglare,15
Spell,119914,Felstorm,16
Spell,205181,Shadowflame,17
Spell,30283,Shadowfury,18
Spell,108416,Dark Pact,19
Spell,216698,Reap Souls,20
Spell,980,Agony,21
Spell,172,Corruption,22
Spell,205179,Phantom Singularity,23
Spell,27243,SOC,24
Spell,30108,Unstable Affliction,25
Spell,198590,Drain Soul,26
Spell,196098,Soul Harvest,27
Spell,157757,Summon Doomguard,28
Spell,157898,Summon Infernal,29
Spell,80240,Havoc,30
Spell,999997,FocusHavoc,31
Spell,348,Immolate,32
Spell,17962,Conflagrate,33
Spell,29722,Incinerate,34
Spell,116858,ChaosBolt,35
Spell,999999,CursorRainOfFire,36
Spell,1122,Infernal,37
Spell,999998,CursorInfernal,38
Spell,196586,DimensionalRift,39
Spell,17877,Shadowburn,40
Spell,196447,ChannelDemonfire,41
Spell,152108,Cataclysm,42
Spell,111859,Grimoire: Imp,43
Spell,5740,RainOfFire,44
Aura,2825,Bloodlust
Aura,32182,Heroism
Aura,80353,Time Warp
Aura,160452,Netherwinds
Aura,230935,Drums of War
Aura,603,Doom
Aura,193396,Demonic Empowerment
Aura,205146,Demonic Calling
Aura,205181,Shadowflame
Aura,196606,Shadowy Inspiration
Aura,980,Agony
Aura,27243,SOC
Aura,196098,Soul Harvest
Aura,146739,Corruption
Aura,63106,Siphon Life
Aura,233490,UA
Aura,216708,Deadwind Harvester
Aura,216695,Tormented Souls
Aura,157736,Immolate
Aura,235156,EmpoweredLifeTap
Aura,196414,Eradication
Aura,80240,Havoc
Item,151649,Soul of the Netherlord
*/
