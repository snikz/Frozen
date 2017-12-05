namespace Frozen.Helpers
{
    public static class WoW
    {
        public static string RandomAdjective
        public static string RandomNoun
        private static string Version => Process.MainModule.FileVersionInfo.FileVersion;
        public static string AddonPath => InstallPath + "\\Interface\\AddOns";
        public static string Config => new StreamReader(Path.Combine(InstallPath, "WTF\\Config.wtf")).ReadToEnd();
        public static string LastSpell { private set; get; } = "";
        public static int GroupSize
        public static bool IsInCombat        
        public static bool PlayerIsChanneling        
        public static bool HasTarget        
        public static bool PlayerIsCasting        
        public static bool TargetIsCasting => TargetCastingSpellID != 0;
        public static bool TargetIsCastingAndSpellIsInterruptible
        public static int TargetPercentCast
        public static bool TargetIsVisible
        public static bool TargetIsFriend
        public static int CurrentChi => UnitPower;
        public static int CurrentArcaneCharges => UnitPower;
        public static int CurrentRunes => UnitPower;
        public static int CurrentComboPoints => UnitPower;
        public static int CurrentSoulShards => UnitPower;
        public static int CurrentHolyPower => UnitPower;
        public static int UnitPower
        public static bool TargetIsEnemy => !TargetIsFriend;
        public static int PlayerHealthPercent => HealthPercent;
        public static int KeyBind(int spellNoInArrayOfSpells)
        public static int ModifierKeyBind(int spellNoInArrayOfSpells)
        public static int PartyHealthPercent(int partyId)
        public static bool PartyNeedsDispel(int partyId)
        public static int PartyAverageHealthPercent
        public static int CountAlliesUnderHealthPercentage(int percent)
        public static int PartyLowestHealthPercent
        public static int PartyMemberIsNeedingADispel
        public static int PartyMemberIdWithLowestHealthPercent
        public static int TankHealth => PartyHealthPercent(TankId);
        public static void SetTank(int id)
        public static int TankId { get; private set; }
        public static void TargetMember(int i)
        public static int CurrentPartyTargetId { get; private set; }
        public static int CountEnemyNPCsInRange
        public static bool Nameplates        
        public static int PetHealthPercent
        public static bool InGame
        public static bool InRaid
        public static bool RotationOn
        public static int RangeToTarget
        public static int RangeToPet
        public static int PetRangeToTarget => RangeToTarget - RangeToPet;
        public static bool HasFocusTarget
        public static bool CooldownsOn
        public static bool AoeOn
        public static bool CleaveOn
        public static bool SingleTargetOn => !AoeOn && !CleaveOn;
        public static int LastSpellCastedID //returns the ID of the spell
        public static int TargetCastingSpellID //returns the ID of the spell
        public static int Arena1CastingSpellID //returns the ID of the spell
        public static int Arena2CastingSpellID //returns the ID of the spell
        public static int Arena3CastingSpellID //returns the ID of the spell
        public static bool HasPet
        public static int TargetHealthPercent
        public static int Level
        public static int Power
        public static int Focus => Power;
        public static int Mana => Power;
        public static int Energy => Power;
        public static int Rage => Power;
        public static int Pain => Power;
        public static int Fury => Power;
        public static int RunicPower => Power;
        public static int CurrentAstralPower => Power;
        public static int Maelstrom => Power;
        public static int Insanity => Power;
        public static int HastePercent
        public static bool WowWindowHasFocus
        public static bool AutoAtacking
        public static bool IsMoving
        public static bool IsMounted
        public static bool TargetIsPlayer
        public static bool IsOutdoors
        public static bool HasBossTarget
        public static bool IsBoss => HasBossTarget;
        public static int WildImpsCount
        public static int DreadstalkersCount
        public static void TargetNearestEnemy()
        public static void TargetNextEnemy()
        public static bool WasLastCasted(string spellBookSpellName)
        public static void Speak(string words)
        public static Bitmap GetScreenCapture(Rectangle fov)
        public static Point SearchColor(ref Bitmap screenCapture, Color searchColor, int tolerance = 0)
        public static string InstallPath => ConfigFile.ReadValue("Frozen", "WoWPath");
        public static bool TargetHasBuff(string buffName)
        public static int FocusCastingSpellID //returns the ID of the spell
        public static int FocusHealthPercent
        public static bool FocusHasDebuff(string debuffName)
        public static int FocusDebuffTimeRemaining(string debuffName, bool debug = false)
        public static bool IsSpellOnCooldown(string spellBookSpellName)
        public static int Talent(int row)
        public static string PlayerRace
        public static string PlayerClassSpec
        public static int SpellCooldownTimeRemaining(string spellBookSpellName, bool debug = false)
        public static bool IsSpellOnGCD(string spellBookSpellName)
        public static bool IsSpellInRange(string spellBookSpellName)                
        public static bool CanCast(string spellBookSpellName, bool checkIfPlayerIsCasting = true, bool checkIfSpellIsOnCooldown = true, bool checkIfSpellIsInRange = false, bool checkSpellCharges = false, bool checkIfTargetIsVisible = true)
        public static T ParseEnum<T>(string value)        
        public static void CastSpellOnMe(string spellName)        
        public static void SendKeyAtLocation(Keys key, int x, int y)        
        internal static void SendMacro(string macro)
        public static int PlayerBuffStacks(string auraName)
        public static void Reload()
        public static int PetBuffStacks(string auraName)
        public static int TargetDebuffTimeRemaining(string debuffName, bool debug = false)        
        public static int PlayerBuffTimeRemaining(string buffName, bool debug = false)
        public static int PetBuffTimeRemaining(string buffName)
        public static int TargetDebuffStacks(string debuffName)
        public static int PlayerSpellCharges(string spellName)
        public static int ItemCount(string itemName)
        public static bool IsEquippedItem(string itemName)
        public static bool ItemOnCooldown(string itemName)
        public static bool PlayerHasBuff(string buffName)
        public static bool IsSpellOverlayed(string spellName)
        public static bool PlayerHasDebuff(string debuffName)
        public static bool PetHasBuff(string buffName)
        public static bool TargetHasDebuff(string debuffName)
        public static void CastSpell(string spellBookSpellName)
        public static void KeyDown(Keys Key)
        public static void KeyUp(Keys Key)        
    }
}