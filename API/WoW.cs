//////////////////////////////////////////////////
//                                              //
//   See License.txt for Licensing information  //
//                                              //
//////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Speech.Synthesis;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Frozen.GUI;
#pragma warning disable 618
#pragma warning disable CS0618 // Type or member is obsolete

// ReSharper disable UnusedMember.Local
// ReSharper disable PossibleNullReferenceException
// ReSharper disable once CheckNamespace

namespace Frozen.Helpers
{
    [SuppressMessage("ReSharper", "MemberCanBePrivate.Global")]
    [SuppressMessage("ReSharper", "UnusedMember.Global")]
    [SuppressMessage("ReSharper", "AssignNullToNotNullAttribute")]
    [SuppressMessage("ReSharper", "UnusedVariable")]
    [SuppressMessage("ReSharper", "MethodOverloadWithOptionalParameter")]

    [Obfuscation(Exclude = true, ApplyToMembers = true)]
    public static class WoW
    {
        internal static Process Process;
        private static Random random;
        private static readonly object thisLock = new object();
        private static readonly Bitmap screenPixel = new Bitmap(1, 1);
        private static DataTable dtColorHelper;
        private static SpeechSynthesizer synthesizer;
        private static readonly IDictionary<string, int> damageModifierHash = new Dictionary<string, int>();

        [Obfuscation(Exclude = true)]
        public static string RandomAdjective
        {
            get
            {
                random = new Random();

                var word = English.Adjective[random.Next(0, English.Adjective.Length)];

                var culture_info = Thread.CurrentThread.CurrentCulture;
                var text_info = culture_info.TextInfo;
                return text_info.ToTitleCase(word);
            }
        }

        [Obfuscation(Exclude = true)]
        public static string RandomNoun
        {
            get
            {
                random = new Random();

                var word = English.Noun[random.Next(0, English.Noun.Length)];

                var culture_info = Thread.CurrentThread.CurrentCulture;
                var text_info = culture_info.TextInfo;
                return text_info.ToTitleCase(word);
            }
        }

        [Obfuscation(Exclude = true)]
        private static string Version => Process.MainModule.FileVersionInfo.FileVersion;

        [Obfuscation(Exclude = true)]
        public static string AddonPath => InstallPath + "\\Interface\\AddOns";

        [Obfuscation(Exclude = true)]
        public static string Config => new StreamReader(Path.Combine(InstallPath, "WTF\\Config.wtf")).ReadToEnd();

        [Obfuscation(Exclude = true)]
        public static string LastSpell { private set; get; } = "";

        [Obfuscation(Exclude = true)]
        public static int GroupSize
        {
            get
            {
                var c = GetBlockColor(31, 1);
                try
                {
                    var val = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();
                    // ReSharper disable once AssignNullToNotNullAttribute
                    return val != null ? int.Parse(val) : 100;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in GroupSize R = " + c.B);

                    Log.Write(ex.Message, Color.Red);
                }
                return 0;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool IsInCombat
        {
            get
            {
                var c = GetBlockColor(4, 1);
                return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
            }
        }

        /// <summary>
        /// Gets a value indicating whether [player is channeling].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [player is channeling]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool PlayerIsChanneling
        {
            get
            {
                var blockColor = GetBlockColor(8, 1);
                return blockColor.R == 0 && blockColor.G == 255 && blockColor.B == 0;
            }
        }

        /// <summary>
        /// Gets a value indicating whether this instance has target.
        /// </summary>
        /// <value>
        /// <c>true</c> if this instance has target; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool HasTarget
        {
            get
            {
                if (HealthPercent == 0) return false;
                if (TargetHealthPercent == 0) return false;
                if (HasBossTarget) return true;

                var c = GetBlockColor(7, 1);
                return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
            }
        }

        /// <summary>
        /// Gets a value indicating whether [player is casting].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [player is casting]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool PlayerIsCasting
        {
            get
            {
                var c = GetBlockColor(8, 1);
                return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
            }
        }

        /// <summary>
        /// Gets a value indicating whether [target is casting].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [target is casting]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool TargetIsCasting => TargetCastingSpellID != 0;

        /// <summary>
        /// Gets a value indicating whether [target is casting and spell is interruptible].
        /// </summary>
        /// <value>
        /// <c>true</c> if [target is casting and spell is interruptible]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool TargetIsCastingAndSpellIsInterruptible
        {
            get
            {
                var pixelColor = GetBlockColor(9, 1);
                return Convert.ToInt32(Math.Round(Convert.ToSingle(pixelColor.R) / 255)) == 1;
            }
        }

        /// <summary>
        /// Gets the target percent cast.
        /// </summary>
        /// <value>
        /// The target percent cast.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int TargetPercentCast
        {
            get
            {
                var pixelColor = GetBlockColor(9, 1);
                var ret = Convert.ToInt32(Math.Round(Convert.ToSingle(pixelColor.G) * 100 / 255));
                return 100 - ret;
            }
        }

        /// <summary>
        /// Gets a value indicating whether [target is visible].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [target is visible]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool TargetIsVisible
        {
            get
            {
                var c = GetBlockColor(11, 1);
                return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
            }
        }

        /// <summary>
        /// Gets a value indicating whether [target is friend].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [target is friend]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool TargetIsFriend
        {
            get
            {
                var c = GetBlockColor(6, 1);
                return c.R == 0 && c.G == 255 && c.B == 0;
            }
        }

        /// <summary>
        /// Gets the current chi.
        /// </summary>
        /// <value>
        /// The current chi.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int CurrentChi => UnitPower;

        /// <summary>
        /// Gets the current arcane charges.
        /// </summary>
        /// <value>
        /// The current arcane charges.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int CurrentArcaneCharges => UnitPower;

        /// <summary>
        /// Gets the current runes.
        /// </summary>
        /// <value>
        /// The current runes.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int CurrentRunes => UnitPower;

        /// <summary>
        /// Gets the current combo points.
        /// </summary>
        /// <value>
        /// The current combo points.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int CurrentComboPoints => UnitPower;

        /// <summary>
        /// Gets the current soul shards.
        /// </summary>
        /// <value>
        /// The current soul shards.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int CurrentSoulShards => UnitPower;

        /// <summary>
        /// Gets the current holy power.
        /// </summary>
        /// <value>
        /// The current holy power.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int CurrentHolyPower => UnitPower;

        /// <summary>
        /// Gets the unit power.
        /// </summary>
        /// <value>
        /// The unit power.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int UnitPower
        {
            get
            {
                var c = GetBlockColor(5, 1);
                try
                {
                    var unitPower = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                    // ReSharper disable once AssignNullToNotNullAttribute
                    return unitPower != null ? int.Parse(unitPower) : 100;
                }
                catch (Exception ex)
                {
                    Log.Write($"[UnitPower] Red = {c.R}");
                    Log.Write(ex.Message, Color.Red);
                    return 100;
                }
            }
        }

        /// <summary>
        /// Gets a value indicating whether [target is enemy].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [target is enemy]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool TargetIsEnemy => !TargetIsFriend;

        /// <summary>
        /// Gets the health percent.
        /// </summary>
        /// <value>
        /// The health percent.
        /// </value>
        [Obsolete("Please use WoW.PlayerHealthPercent instead.")]
        [Obfuscation(Exclude = true)]
        public static int HealthPercent
        {
            get
            {
                var c = GetBlockColor(1, 1);
                try
                {
                    var health = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();

                    // ReSharper disable once AssignNullToNotNullAttribute
                    return health != null ? int.Parse(health) : 100;
                }
                catch (Exception ex)
                {
                    Log.Write($"[Health] Red = {c.R}");
                    Log.Write(ex.Message, Color.Red);
                    return 100;
                }
            }
        }

#pragma warning disable 618
        [Obfuscation(Exclude = true)]
        public static int PlayerHealthPercent => HealthPercent;
#pragma warning restore 618

        [Obfuscation(Exclude = true)]
        public static int KeyBind(int spellNoInArrayOfSpells)
        {
            var c = GetBlockColor(spellNoInArrayOfSpells, 15);

            //Log.Write("Spell No: " + spellNoInArrayOfSpells + " Color: " + c.R);
            try
            {
                var r = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();

                // ReSharper disable once AssignNullToNotNullAttribute
                return r != null ? int.Parse(r) : 100;
            }
            catch (Exception ex)
            {
                Log.Write($"[Keybind] Red = {c.R}");
                Log.Write(ex.Message, Color.Red);
                return 100;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int ModifierKeyBind(int spellNoInArrayOfSpells)
        {
            var c = GetBlockColor(spellNoInArrayOfSpells, 15);

            //Log.Write("Spell No: " + spellNoInArrayOfSpells + " Color: " + c.R);
            try
            {
                var g = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();

                // ReSharper disable once AssignNullToNotNullAttribute
                return g != null ? int.Parse(g) : 100;
            }
            catch (Exception ex)
            {
                Log.Write($"[Keybind] Red = {c.G}");
                Log.Write(ex.Message, Color.Red);
                return 100;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int PartyHealthPercent(int partyId)
        {
            if (partyId > GroupSize || partyId < 1)
            {
                Log.Write($"Failed to get health for Party member > {GroupSize} or < 1, you are trying to find it for member: {partyId}");
                return 100;
            }

            var c = GetBlockColor(partyId, 14);
            try
            {
                var health = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();

                // ReSharper disable once AssignNullToNotNullAttribute
                return health != null ? int.Parse(health) : 100;
            }
            catch (Exception ex)
            {
                Log.Write($"[Health] Red = {c.R}");
                Log.Write(ex.Message, Color.Red);
                return 100;
            }         
        }

        [Obfuscation(Exclude = true)]
        public static bool PartyNeedsDispel(int partyId)
        {
            if (partyId > GroupSize || partyId < 1)
            {
                Log.Write($"Failed to get Dispel for Party member > {GroupSize} or < 1");
                return false;
            }

            var c = GetBlockColor(partyId, 14);
            try
            {
                return (c.G == 255);
            }
            catch (Exception ex)
            {
                Log.Write($"[Dispel] Green = {c.G}");
                Log.Write(ex.Message, Color.Red);
                return false;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int PartyAverageHealthPercent
        {
            get
            {
                if (GroupSize == 0) return PlayerHealthPercent;

                int total = 0;

                for (int i = 1; i <= GroupSize; i++)
                {   
                    total += PartyHealthPercent(i);
                }

                return total / GroupSize;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int CountAlliesUnderHealthPercentage(int percent)
        {
            if (percent > 100 || percent < 0) return 0;

            if (GroupSize == 0)
            {
                return PlayerHealthPercent < percent ? 1 : 0;
            }

            var ret = 0;
            for (var i = 1; i <= GroupSize; i++)
            {
                var current = PartyHealthPercent(i);
                if (current < percent)
                {
                    ret++;
                }
            }
            return ret;
        }

        [Obfuscation(Exclude = true)]
        public static int PartyLowestHealthPercent
        {
            get
            {
                if (GroupSize == 0) return PlayerHealthPercent;

                int lowest = 100;                

                for(int i = 1; i <= GroupSize; i++)
                {
                    var current = PartyHealthPercent(i);
                    if (current < lowest)
                    {
                        lowest = current;
                    }                    
                }

                Log.WriteDirectlyToLogFile("Lowest hp in party = " + lowest + "%");

                return lowest;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int PartyMemberIsNeedingADispel
        {
            get
            {
                for (int i = 1; i <= GroupSize; i++)
                {
                    if (PartyNeedsDispel(i))
                    { 
                        return i;
                    }
                }
                return 0;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int PartyMemberIdWithLowestHealthPercent
        {
            get
            {
                if (GroupSize == 0) return 1;

                for (int i = 1; i <= GroupSize; i++)
                {
                    var current = PartyHealthPercent(i);
                    if (current == PartyLowestHealthPercent && current != 100)
                    {
                        return i;
                    }
                }
                return 0;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int TankHealth => PartyHealthPercent(TankId);

        [Obfuscation(Exclude = true)]
        public static void SetTank(int id)
        {
            TankId = id;
            Log.Write("Tank id set to: " + id, Color.Green);
        }

        [Obfuscation(Exclude = true)]
        public static int TankId { get; private set; }

        [Obfuscation(Exclude = true)]
        public static void TargetMember(int i)
        {
            if (CurrentPartyTargetId != i) // If we are not currently targeting the correct unit
                //KeyPressRelease(Keys.F6);  // Clears the current target (this is a macro setup in healer setup)

            if (GroupSize <= 5) // Party
            {
                CurrentPartyTargetId = i;
                if (i == 1)
                {
                    KeyPressRelease(Keys.F1);
                }
                else if (i == 2)
                {
                    KeyPressRelease(Keys.F2);
                }
                else if (i == 3)
                {
                    KeyPressRelease(Keys.F3);
                }
                else if (i == 4)
                {
                    KeyPressRelease(Keys.F4);
                }
                else if (i == 5)
                {
                    KeyPressRelease(Keys.F5);
                }
            }
            if (GroupSize > 5)
            {
                CurrentPartyTargetId = i;
                Keys modifier1 = Keys.Menu;
                Keys modifier2 = Keys.None;

                // Alt-Modifier Keys, Raid 1-10
                switch (i)
                {
                    case 1:
                        KeyPressRelease(Keys.F1, Keys.None, i);
                        break;
                    case 2:
                        KeyPressRelease(Keys.F2, Keys.None, i);
                        break;
                    case 3:
                        KeyPressRelease(Keys.F3, Keys.None, i);
                        break;
                    case 4:
                        KeyPressRelease(Keys.F5, Keys.None, i);
                        break;
                    case 5:
                        KeyPressRelease(Keys.F6, Keys.None, i);
                        break;
                    case 6:
                        KeyPressRelease(Keys.F7, Keys.None, i);
                        break;
                    case 7:
                        KeyPressRelease(Keys.F8, Keys.None, i);
                        break;
                    case 8:
                        KeyPressRelease(Keys.F9, Keys.None, i);
                        break;
                    case 9:
                        KeyPressRelease(Keys.F10, Keys.None, i);
                        break;
                    case 10:
                        KeyPressRelease(Keys.F11, Keys.None, i);
                        break;
                    case 11:
                        KeyPressRelease(Keys.F1, modifier1, i);
                        break;
                    case 12:
                        KeyPressRelease(Keys.F2, modifier1, i);
                        break;
                    case 13:
                        KeyPressRelease(Keys.F3, modifier1, i);
                        break;
                    case 14:
                        KeyPressRelease(Keys.F5, modifier1, i);
                        break;
                    case 15:
                        KeyPressRelease(Keys.F6, modifier1, i);
                        break;
                    case 16:
                        KeyPressRelease(Keys.F7, modifier1, i);
                        break;
                    case 17:
                        KeyPressRelease(Keys.F8, modifier1, i);
                        break;
                    case 18:
                        KeyPressRelease(Keys.F9, modifier1, i);
                        break;
                    case 19:
                        KeyPressRelease(Keys.F10, modifier1, i);
                        break;
                    case 20:
                        KeyPressRelease(Keys.F11, modifier1, i);
                        break;
                    case 21:
                        KeyPressRelease(Keys.NumPad0, modifier2, i);
                        break;
                    case 22:
                        KeyPressRelease(Keys.NumPad1, modifier2, i);
                        break;
                    case 23:
                        KeyPressRelease(Keys.NumPad2, modifier2, i);
                        break;
                    case 24:
                        KeyPressRelease(Keys.NumPad3, modifier2, i);
                        break;
                    case 25:
                        KeyPressRelease(Keys.NumPad4, modifier2, i);
                        break;
                    case 26:
                        KeyPressRelease(Keys.NumPad5, modifier2, i);
                        break;
                    case 27:
                        KeyPressRelease(Keys.NumPad6, modifier2, i);
                        break;
                    case 28:
                        KeyPressRelease(Keys.NumPad7, modifier2, i);
                        break;
                    case 29:
                        KeyPressRelease(Keys.NumPad8, modifier2, i);
                        break;
                    case 30:
                        KeyPressRelease(Keys.NumPad9, modifier2, i);
                        break;
                }
            }
        }

        [Obfuscation(Exclude = true)]
        public static int CurrentPartyTargetId { get; private set; }


        /// <summary>
        /// Counts Number of Hostile NPC Nameplaes
        /// </summary>
        /// <returns>Returns Count</returns>
        [Obfuscation(Exclude = true)]
        public static int CountEnemyNPCsInRange
        {
            get
            {
                var c = GetBlockColor(1, 23);
                try
                {
                    if (c.R != 255 || c.B == 0)
                        return 0;
                        var power = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                        return power != null ? int.Parse(power) : 0;
                    
                }
                catch (Exception ex)
                {
                    Log.Write("Error in Npc Count  Green = " + c.G);

                    Log.Write(ex.Message, Color.Red);
                }
                return 1;
            }
        }
        /// <summary>
        /// NpC NamePlates on/off
        /// </summary>
        /// <returns>True or False</returns>
        /// 
        [Obfuscation(Exclude = true)]
        public static bool Nameplates
        {
            get
            {
                var c = GetBlockColor(1, 23);
                try
                {
                    if (c.R != 255)
                        return false;
                    if (c.B == 255)
                        return true;
                    return false;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in NamePlateON  Blue = " + c.B);

                    Log.Write(ex.Message, Color.Red);
                }
                return false;
            }
        }
        /// <summary>
        /// Setbonus for Legion
        /// </summary>
        /// <param name="tier">What tier set bonus: 19-20 </param>
        /// <returns>#num of piece of set worn</returns>
        [Obfuscation(Exclude = true)]
        public static int SetBonus(int tier)
        {
            var c = GetBlockColor(4, 13);
            if (c.B != 0)
                return 0;
            try
            {
                if (tier > 20 || tier < 19)
                    return 0;

                c = GetBlockColor(5, 13);
                byte slot;
                switch (tier)
                {
                    case 19:
                        slot = c.G;
                        break;
                    case 20:
                        slot = c.B;
                        break;
                    default:
                        return 0;
                }
                var power = dtColorHelper.Select($"[Rounded] = '{slot}'").FirstOrDefault()?["Value"].ToString();
                return power != null ? int.Parse(power) : 0;
            }
            catch (Exception ex)
            {
                Log.Write("Error in Setbonus Red  = " + c.R);
                Log.Write(ex.Message, Color.Red);
            }
            return 0;
        }
        /// <summary>
        /// legendary piece worn
        /// </summary>
        /// <param name="num">What legendary 1 or 2 </param>
        /// <returns>EquipmentSlot legendar worn</returns>
        [Obfuscation(Exclude = true)]
        public static int Legendary(int num)
        {
            var c = GetBlockColor(4, 13);
            if (c.B != 0)
                return 0;
            try
            {
                c = GetBlockColor(6, 13);
                byte slot;
                switch (num)
                {
                    case 1:
                        slot = c.R;
                        break;
                    case 2:
                        slot = c.G;
                        break;
                    default:
                        return 0;
                }
                var power = dtColorHelper.Select($"[Rounded] = '{slot}'").FirstOrDefault()?["Value"].ToString();
                return power != null ? int.Parse(power) : 0;
            }
            catch (Exception ex)
            {
                Log.Write("Error in legendary Red  = " + c.R);

                Log.Write(ex.Message, Color.Red);
            }
            return 0;
        }

        /// <summary>
        /// Gets the pet health percent.
        /// </summary>
        /// <value>
        /// The pet health percent.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int PetHealthPercent
        {
            get
            {
                if (!HasPet) return 0;

                var c = GetBlockColor(13, 1);
                try
                {
                    var health = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();

                    // ReSharper disable once AssignNullToNotNullAttribute
                    return health != null ? int.Parse(health) : 100;
                }
                catch (Exception ex)
                {
                    Log.Write($"[PetHealth] Red = {c.R}");
                    Log.Write(ex.Message, Color.Red);
                    return 100;
                }
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool InGame
        {
            get
            {
                var c = GetBlockColor(31, 1);
                try
                {
                    if (c.G == 255)
                        return true;
                    return false;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in InGame G = " + c.G);

                    Log.Write(ex.Message, Color.Red);
                }
                return false;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool InRaid
        {
            get
            {
                var c = GetBlockColor(31, 1);
                try
                {
                    if (c.B == 255)
                        return true;
                    return false;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in InRaid B = " + c.B);

                    Log.Write(ex.Message, Color.Red);
                }
                return false;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool RotationOn
        {
            get
            {
                var c = GetBlockColor(30, 1);
                try
                {
                    if (c.R == 255)
                        return true;
                    return false;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in RotationOn R = " + c.R);

                    Log.Write(ex.Message, Color.Red);
                }
                return false;
            }
        }

        [Obfuscation(Exclude = true)]

        public static int RangeToTarget
        {
            get
            {
                var c = GetBlockColor(29, 1);
                try
                {
                    var range = int.Parse(dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString());
                    return range;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in RangeToTarget R = " + c.R);
                    Log.Write(ex.Message, Color.Red);
                }
                return -1;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int RangeToPet
        {
            get
            {
                var c = GetBlockColor(29, 1);
                try
                {
                    var range = int.Parse(dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString());
                    return range;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in RangeToPet G = " + c.R);
                    Log.Write(ex.Message, Color.Red);
                }
                return -1;
            }
        }

        [Obfuscation(Exclude = true)]
        public static int PetRangeToTarget => RangeToTarget - RangeToPet;

        [Obfuscation(Exclude = true)]
        public static bool HasFocusTarget
        {
            get
            {
                var c = GetBlockColor(29, 1);
                try
                {
                    if (c.B == 255)
                        return true;
                    return false;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in HasFocusTarget B = " + c.B);
                    Log.Write(ex.Message, Color.Red);
                }
                return false;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool CooldownsOn
        {
            get
            {
                var c = GetBlockColor(30, 1);
                try
                {
                    if (c.G == 255)
                        return true;
                    return false;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in CooldownsOn G = " + c.G);

                    Log.Write(ex.Message, Color.Red);
                }
                return false;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool AoeOn
        {
            get
            {
                var c = GetBlockColor(30, 1);
                try
                {
                    if (c.B == 255)
                        return true;
                    return false;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in AoeOn B = " + c.B);

                    Log.Write(ex.Message, Color.Red);
                }
                return false;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool CleaveOn
        {
            get
            {
                var c = GetBlockColor(30, 1);
                try
                {
                    if (c.B == 128)
                        return true;
                    return false;
                }
                catch (Exception ex)
                {
                    Log.Write("Error in Cleave B = " + c.B);

                    Log.Write(ex.Message, Color.Red);
                }
                return false;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool SingleTargetOn => !AoeOn && !CleaveOn;

        /// <summary>
        /// Gets the last spell casted identifier.
        /// </summary>
        /// <value>
        /// The last spell casted identifier.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int LastSpellCastedID //returns the ID of the spell
        {
            get
            {
                var c1 = GetBlockColor(5, 7);
                var c2 = GetBlockColor(6, 7);
                try
                {
                    var red1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.R}'").FirstOrDefault()?["Value"])/10);
                    var green1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.G}'").FirstOrDefault()?["Value"])/10);
                    var blue1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.B}'").FirstOrDefault()?["Value"])/10);

                    var red2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.R}'").FirstOrDefault()?["Value"])/10);
                    var green2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.G}'").FirstOrDefault()?["Value"])/10);
                    var blue2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.B}'").FirstOrDefault()?["Value"])/10);

                    var strRed1 = "";
                    var strGreen1 = "";
                    var strBlue1 = "";
                    var strRed2 = "";
                    var strGreen2 = "";
                    var strBlue2 = "";

                    if (red1 != 10)
                    {
                        strRed1 = red1.ToString();
                    }
                    if (green1 != 10)
                    {
                        strGreen1 = green1.ToString();
                    }
                    if (blue1 != 10)
                    {
                        strBlue1 = blue1.ToString();
                    }
                    if (red2 != 10)
                    {
                        strRed2 = red2.ToString();
                    }
                    if (green2 != 10)
                    {
                        strGreen2 = green2.ToString();
                    }
                    if (blue2 != 10)
                    {
                        strBlue2 = blue2.ToString();
                    }

                    var spellText = strRed1 + strGreen1 + strBlue1 + strRed2 + strGreen2 + strBlue2;
                    //Log.Write("Last casted ID: " + spellText);
                    return RemoveTrailingZerosFromSpell(spellText);
                }
                catch (Exception ex)
                {
                    Log.Write($" Red1 = {c1.R} Green1 = {c1.G} Blue1 = {c1.B} Red2 = {c2.R} Green2 = {c2.G} Blue2 = {c2.B}");
                    Log.Write(ex.Message, Color.Red);
                    return 0;
                }
            }
        }

        private static int RemoveTrailingZerosFromSpell(string spellId)
        {
            if (int.Parse(spellId) == 0)
                return 0;

            while(spellId.EndsWith("0"))
            {
                spellId = spellId.Substring(0, spellId.Length - 1);
            }
            return int.Parse(spellId);
        }

        /// <summary>
        /// Gets the target casting spell identifier.
        /// </summary>
        /// <value>
        /// The target casting spell identifier.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int TargetCastingSpellID //returns the ID of the spell
        {
            get
            {
                if (!HasTarget) return 0;
                var c1 = GetBlockColor(7, 7);
                var c2 = GetBlockColor(8, 7);
                try
                {
                    var red1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.R}'").FirstOrDefault()?["Value"])/10);
                    var green1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.G}'").FirstOrDefault()?["Value"])/10);
                    var blue1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.B}'").FirstOrDefault()?["Value"])/10);

                    var red2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.R}'").FirstOrDefault()?["Value"])/10);
                    var green2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.G}'").FirstOrDefault()?["Value"])/10);
                    var blue2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.B}'").FirstOrDefault()?["Value"])/10);

                    var strRed1 = "";
                    var strGreen1 = "";
                    var strBlue1 = "";
                    var strRed2 = "";
                    var strGreen2 = "";
                    var strBlue2 = "";

                    if (red1 != 10)
                    {
                        strRed1 = red1.ToString();
                    }
                    if (green1 != 10)
                    {
                        strGreen1 = green1.ToString();
                    }
                    if (blue1 != 10)
                    {
                        strBlue1 = blue1.ToString();
                    }
                    if (red2 != 10)
                    {
                        strRed2 = red2.ToString();
                    }
                    if (green2 != 10)
                    {
                        strGreen2 = green2.ToString();
                    }
                    if (blue2 != 10)
                    {
                        strBlue2 = blue2.ToString();
                    }

                    var spellText = strRed1 + strGreen1 + strBlue1 + strRed2 + strGreen2 + strBlue2;
                    //Log.Write("Target casting spell ID: " + spellText);
                    return RemoveTrailingZerosFromSpell(spellText);
                }
                catch (Exception ex)
                {
                    Log.Write($" Red1 = {c1.R} Green1 = {c1.G} Blue1 = {c1.B} Red2 = {c2.R} Green2 = {c2.G} Blue2 = {c2.B}");
                    Log.Write(ex.Message, Color.Red);
                    return 0;
                }
            }
        }

        /// <summary>
        /// Gets the arena1 casting spell identifier.
        /// </summary>
        /// <value>
        /// The arena1 casting spell identifier.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Arena1CastingSpellID //returns the ID of the spell
        {
            get
            {
                var c1 = GetBlockColor(9, 7);
                var c2 = GetBlockColor(10, 7);
                try
                {
                    var red1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.R}'").FirstOrDefault()?["Value"])/10);
                    var green1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.G}'").FirstOrDefault()?["Value"])/10);
                    var blue1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.B}'").FirstOrDefault()?["Value"])/10);

                    var red2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.R}'").FirstOrDefault()?["Value"])/10);
                    var green2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.G}'").FirstOrDefault()?["Value"])/10);
                    var blue2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.B}'").FirstOrDefault()?["Value"])/10);

                    var strRed1 = "";
                    var strGreen1 = "";
                    var strBlue1 = "";
                    var strRed2 = "";
                    var strGreen2 = "";
                    var strBlue2 = "";

                    if (red1 != 10)
                    {
                        strRed1 = red1.ToString();
                    }
                    if (green1 != 10)
                    {
                        strGreen1 = green1.ToString();
                    }
                    if (blue1 != 10)
                    {
                        strBlue1 = blue1.ToString();
                    }
                    if (red2 != 10)
                    {
                        strRed2 = red2.ToString();
                    }
                    if (green2 != 10)
                    {
                        strGreen2 = green2.ToString();
                    }
                    if (blue2 != 10)
                    {
                        strBlue2 = blue2.ToString();
                    }

                    var spellText = strRed1 + strGreen1 + strBlue1 + strRed2 + strGreen2 + strBlue2;
                    //Log.Write("Arena 1 casting spell ID: " + spellText);
                    return RemoveTrailingZerosFromSpell(spellText);
                }
                catch (Exception ex)
                {
                    Log.Write($" Red1 = {c1.R} Green1 = {c1.G} Blue1 = {c1.B} Red2 = {c2.R} Green2 = {c2.G} Blue2 = {c2.B}");
                    Log.Write(ex.Message, Color.Red);
                    return 0;
                }
            }
        }

        /// <summary>
        /// Gets the arena2 casting spell identifier.
        /// </summary>
        /// <value>
        /// The arena2 casting spell identifier.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Arena2CastingSpellID //returns the ID of the spell
        {
            get
            {
                var c1 = GetBlockColor(11, 7);
                var c2 = GetBlockColor(12, 7);
                try
                {
                    var red1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.R}'").FirstOrDefault()?["Value"])/10);
                    var green1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.G}'").FirstOrDefault()?["Value"])/10);
                    var blue1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.B}'").FirstOrDefault()?["Value"])/10);

                    var red2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.R}'").FirstOrDefault()?["Value"])/10);
                    var green2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.G}'").FirstOrDefault()?["Value"])/10);
                    var blue2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.B}'").FirstOrDefault()?["Value"])/10);

                    var strRed1 = "";
                    var strGreen1 = "";
                    var strBlue1 = "";
                    var strRed2 = "";
                    var strGreen2 = "";
                    var strBlue2 = "";

                    if (red1 != 10)
                    {
                        strRed1 = red1.ToString();
                    }
                    if (green1 != 10)
                    {
                        strGreen1 = green1.ToString();
                    }
                    if (blue1 != 10)
                    {
                        strBlue1 = blue1.ToString();
                    }
                    if (red2 != 10)
                    {
                        strRed2 = red2.ToString();
                    }
                    if (green2 != 10)
                    {
                        strGreen2 = green2.ToString();
                    }
                    if (blue2 != 10)
                    {
                        strBlue2 = blue2.ToString();
                    }

                    var spellText = strRed1 + strGreen1 + strBlue1 + strRed2 + strGreen2 + strBlue2;
                    //Log.Write("Arena 2 casting spell ID: " + spellText);
                    return RemoveTrailingZerosFromSpell(spellText);
                }
                catch (Exception ex)
                {
                    Log.Write($" Red1 = {c1.R} Green1 = {c1.G} Blue1 = {c1.B} Red2 = {c2.R} Green2 = {c2.G} Blue2 = {c2.B}");
                    Log.Write(ex.Message, Color.Red);
                    return 0;
                }
            }
        }

        /// <summary>
        /// Gets the arena3 casting spell identifier.
        /// </summary>
        /// <value>
        /// The arena3 casting spell identifier.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Arena3CastingSpellID //returns the ID of the spell
        {
            get
            {
                var c1 = GetBlockColor(13, 7);
                var c2 = GetBlockColor(14, 7);
                try
                {
                    var red1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.R}'").FirstOrDefault()?["Value"])/10);
                    var green1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.G}'").FirstOrDefault()?["Value"])/10);
                    var blue1 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c1.B}'").FirstOrDefault()?["Value"])/10);

                    var red2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.R}'").FirstOrDefault()?["Value"])/10);
                    var green2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.G}'").FirstOrDefault()?["Value"])/10);
                    var blue2 = (int) (float.Parse((string) dtColorHelper.Select($"[Rounded] = '{c2.B}'").FirstOrDefault()?["Value"])/10);

                    var strRed1 = "";
                    var strGreen1 = "";
                    var strBlue1 = "";
                    var strRed2 = "";
                    var strGreen2 = "";
                    var strBlue2 = "";

                    if (red1 != 10)
                    {
                        strRed1 = red1.ToString();
                    }
                    if (green1 != 10)
                    {
                        strGreen1 = green1.ToString();
                    }
                    if (blue1 != 10)
                    {
                        strBlue1 = blue1.ToString();
                    }
                    if (red2 != 10)
                    {
                        strRed2 = red2.ToString();
                    }
                    if (green2 != 10)
                    {
                        strGreen2 = green2.ToString();
                    }
                    if (blue2 != 10)
                    {
                        strBlue2 = blue2.ToString();
                    }

                    var spellText = strRed1 + strGreen1 + strBlue1 + strRed2 + strGreen2 + strBlue2;
                    //Log.Write("Arena 3 casting spell ID: " + spellText);
                    return RemoveTrailingZerosFromSpell(spellText);
                }
                catch (Exception ex)
                {
                    Log.Write($" Red1 = {c1.R} Green1 = {c1.G} Blue1 = {c1.B} Red2 = {c2.R} Green2 = {c2.G} Blue2 = {c2.B}");
                    Log.Write(ex.Message, Color.Red);
                    return 0;
                }
            }
        }

        private static bool IsLeftShiftDown => false;

        /// <summary>
        /// Gets a value indicating whether this instance has pet.
        /// </summary>
        /// <value>
        ///   <c>true</c> if this instance has pet; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool HasPet
        {
            get
            {
                var c = GetBlockColor(12, 1);
                return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
            }
        }

        /// <summary>
        /// Gets the target health percent.
        /// </summary>
        /// <value>
        /// The target health percent.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int TargetHealthPercent
        {
            get
            {
                var c = GetBlockColor(3, 1);
                try
                {
                    var health = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();

                    // ReSharper disable once AssignNullToNotNullAttribute
                    return health != null ? int.Parse(health) : 50;
                }
                catch (Exception ex)
                {
                    Log.Write($"[Target Health] Red = {c.R} Green = {c.G}");
                    Log.Write(ex.Message, Color.Red);
                    return 0;
                }
            }
        }

        /// <summary>
        /// Gets the level.
        /// </summary>
        /// <value>
        /// The level.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Level
        {
            get
            {
                var c = GetBlockColor(1, 1);

                try
                {
                    Log.WriteDirectlyToLogFile($"Green = {c.G} Blue = {c.B}");
                    if (c.B == 255 && c.B == 255)
                        return 0;

                    if (c.B != 0)
                    {
                        var lvl = dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()?["Value"].ToString();
                        if (lvl != null)
                            return int.Parse(lvl) + 100;
                    }
                    else
                    {
                        var lvl = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                        if (lvl != null)
                            return int.Parse(lvl);
                    }
                }
                catch (Exception ex)
                {
                    Log.Write($"Green = {c.G} Blue = {c.B}");
                    Log.Write(ex.Message, Color.Red);
                }
                return 0;
            }
        }

        /// <summary>
        /// Gets the power.
        /// </summary>
        /// <value>
        /// The power.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Power
        {
            get
            {
                var c = GetBlockColor(2, 1);

                try
                {
                    Log.WriteDirectlyToLogFile($"Red = {c.R} Green = {c.G}");
                    if (c.G == 255 && c.R == 255)
                        return 0;

                    if (c.G != 0)
                    {
                        var power = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                        if (power != null)
                            return int.Parse(power) + 100;
                    }
                    else
                    {
                        var power = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();
                        if (power != null)
                            return int.Parse(power);
                    }
                }
                catch (Exception ex)
                {
                    Log.Write($"Red = {c.R} Green = {c.G}");
                    Log.Write(ex.Message, Color.Red);
                }
                return 0;
            }
        }

        /// <summary>
        /// Gets the focus.
        /// </summary>
        /// <value>
        /// The focus.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Focus => Power;

        /// <summary>
        /// Gets the mana.
        /// </summary>
        /// <value>
        /// The mana.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Mana => Power;

        /// <summary>
        /// Gets the energy.
        /// </summary>
        /// <value>
        /// The energy.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Energy => Power;
        /// <summary>
        /// Gets the rage.
        /// </summary>
        /// <value>
        /// The rage.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Rage => Power;
        /// <summary>
        /// Gets the pain.
        /// </summary>
        /// <value>
        /// The pain.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Pain => Power;
        /// <summary>
        /// Gets the fury.
        /// </summary>
        /// <value>
        /// The fury.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Fury => Power;
        /// <summary>
        /// Gets the runic power.
        /// </summary>
        /// <value>
        /// The runic power.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int RunicPower => Power;
        /// <summary>
        /// Gets the current astral power.
        /// </summary>
        /// <value>
        /// The current astral power.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int CurrentAstralPower => Power;
        /// <summary>
        /// Gets the maelstrom.
        /// </summary>
        /// <value>
        /// The maelstrom.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Maelstrom => Power;
        /// <summary>
        /// Gets the insanity.
        /// </summary>
        /// <value>
        /// The insanity.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int Insanity => Power;

        /// <summary>
        /// Gets the haste percent.
        /// </summary>
        /// <value>
        /// The haste percent.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int HastePercent
        {
            get
            {
                var c = GetBlockColor(10, 1);

                try
                {
                    if (c.R == 0 || c.R == 255)
                    {
                        Log.WriteDirectlyToLogFile($"Red = {c.R} Green = {c.G}Blue = {c.B}");
                        var power1 = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();
                        var power2 = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                        var power3 = dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()?["Value"].ToString();
                        if (int.Parse(power1) == 100)
                            return int.Parse(power2) * 100 + int.Parse(power3);
                        return -(int.Parse(power2) * 100 + int.Parse(power3));
                    }
                }
                catch (Exception ex)
                {
                    Log.Write($"Error in haste Red = {c.R} Green = {c.G} Blue = {c.B}");
                    Log.Write(ex.Message, Color.Red);
                }
                return 0;
            }
        }

        /// <summary>
        /// Gets a value indicating whether [wow window has focus].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [wow window has focus]; otherwise, <c>false</c>.
        /// </value>
        /// <exception cref="Exception">World of warcraft is not detected / running, please login before attempting to restart the bot</exception>
        [Obfuscation(Exclude = true)]
        public static bool WowWindowHasFocus
        {
            get
            {
                var activatedHandle = GetForegroundWindow();
                if (activatedHandle == IntPtr.Zero)
                {
                    return false; // No window is currently activated
                }

                int activeProcId;
                GetWindowThreadProcessId(activatedHandle, out activeProcId);

                if (Process == null)
                {
                    throw new Exception("World of warcraft is not detected / running, please login before attempting to restart the bot");
                }

                return activeProcId == Process.Id;
            }
        }

        /// <summary>
        /// Gets a value indicating whether [automatic atacking].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [automatic atacking]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool AutoAtacking
        {
            get
            {
                var c = GetBlockColor(2, 7);
                return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
            }
        }

        /// <summary>
        /// Gets a value indicating whether this instance is moving.
        /// </summary>
        /// <value>
        ///   <c>true</c> if this instance is moving; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool IsMoving
        {
            get
            {
                var c = GetBlockColor(1, 7);
                return (c.R == Color.Red.R) && (c.B == Color.Blue.B);
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool IsMounted
        {
            get
            {
                var c = GetBlockColor(1, 7);
                return (c.G == Color.Green.G && (c.B == Color.Blue.B));
            }
        }
        /// <summary>
        /// Gets a value indicating whether [target is player].
        /// </summary>
        /// <value>
        ///   <c>true</c> if [target is player]; otherwise, <c>false</c>.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static bool TargetIsPlayer
        {
            get
            {
                var c = GetBlockColor(3, 7);
                return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool IsOutdoors
        {
            get
            {
                var c = GetBlockColor(4, 7);
                return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool HasBossTarget
        {
            get
            {
                var c = GetBlockColor(7, 1);
                return c.R == Color.Blue.R && c.G == Color.Blue.G && c.B == Color.Blue.B;
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool IsBoss => HasBossTarget;

        /// <summary>
        /// Gets the wild imps count.
        /// </summary>
        /// <value>
        /// The wild imps count.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int WildImpsCount
        {
            get
            {
                var c = GetBlockColor(14, 1);

                try
                {
                    var Red = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()["Value"].ToString();

                    return int.Parse(Red);
                }
                catch (Exception ex)
                {
                    Log.Write("Error: Wild Imps " + ex.Message, Color.Red);
                }

                return 0;
            }
        }

        /// <summary>
        /// Gets the dreadstalkers count.
        /// </summary>
        /// <value>
        /// The dreadstalkers count.
        /// </value>
        [Obfuscation(Exclude = true)]
        public static int DreadstalkersCount
        {
            get
            {
                var c = GetBlockColor(14, 1);

                try
                {
                    var Blue = dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()["Value"].ToString();

                    return int.Parse(Blue);
                }
                catch (Exception ex)
                {
                    Log.Write("Error: Dreadstalkers " + ex.Message, Color.Red);
                }
                return 0;
            }
        }

        [Obfuscation(Exclude = true)]
        public static void TargetNearestEnemy()
        {
            KeyPressRelease(Keys.Tab);
            CurrentPartyTargetId = 0;
        }

        /// <summary>
        /// Wases the last casted.
        /// </summary>
        /// <param name="spellBookSpellName">Name of the spell book spell.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static bool WasLastCasted(string spellBookSpellName)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellBookSpellName);
            var spellId = spell.SpellId;

            return spellId == LastSpellCastedID;
        }

        /// <summary>
        /// Speaks the specified words.
        /// </summary>
        /// <param name="words">The words.</param>
        
        public static void Speak(string words)
        {
            synthesizer.SpeakAsync(words);
        }

        [Obfuscation(Exclude = true)]
        public static Bitmap GetScreenCapture(Rectangle fov)
        {
            // Define the size of the screencopy.
            var screenCopy = new Bitmap(fov.Width, fov.Height, PixelFormat.Format24bppRgb);

            using (var gdest = Graphics.FromImage(screenCopy))

            using (var gsrc = Graphics.FromHwnd(Process.MainWindowHandle))
            {
                var hSrcDc = gsrc.GetHdc();
                var hDc = gdest.GetHdc();
                var bitBlt = BitBlt(hDc, 0, 0, fov.Width, fov.Height, hSrcDc, fov.X, fov.Y, (int)CopyPixelOperation.SourceCopy);

                gdest.ReleaseHdc();
                gsrc.ReleaseHdc();
            }

            return screenCopy;
        }

        [Obfuscation(Exclude = true)]
        public static Point SearchColor(ref Bitmap screenCapture, Color searchColor, int tolerance = 0)
        {
            unsafe
            {
                var output = Point.Empty;
                var bitmapData = screenCapture.LockBits(new Rectangle(0, 0, screenCapture.Width, screenCapture.Height), ImageLockMode.ReadOnly, screenCapture.PixelFormat);

                var bytesPerPixel = Image.GetPixelFormatSize(screenCapture.PixelFormat) / 8;
                var heightInPixels = bitmapData.Height;
                var widthInBytes = bitmapData.Width * bytesPerPixel;
                var ptrFirstPixel = (byte*)bitmapData.Scan0;

                Parallel.For(0, heightInPixels, (y, loopState) =>
                {
                    var searchX = 0;
                    var currentLine = ptrFirstPixel + (y * bitmapData.Stride);
                    for (var x = 0; x < widthInBytes; x = x + bytesPerPixel)
                    {
                        int oldBlue = currentLine[x];
                        int oldGreen = currentLine[x + 1];
                        int oldRed = currentLine[x + 2];

                        var sum = 0;

                        var diff = oldRed - searchColor.R;
                        sum += (1 + diff * diff) * oldRed / 256;

                        diff = oldGreen - searchColor.G;
                        sum += (1 + diff * diff) * oldGreen / 256;

                        diff = oldBlue - searchColor.B;
                        sum += (1 + diff * diff) * oldBlue / 256;

                        if (sum <= tolerance * tolerance * 4)
                        {
                            output = new Point(searchX, y);
                            loopState.Break();
                            break;
                        }

                        currentLine[x] = (byte)oldBlue;
                        currentLine[x + 1] = (byte)oldGreen;
                        currentLine[x + 2] = (byte)oldRed;

                        searchX++;
                    }
                });

                screenCapture.UnlockBits(bitmapData);

                return output;
            }
        }

        [Obfuscation(Exclude = true)]
        public static string InstallPath => ConfigFile.ReadValue("Frozen", "WoWPath");

        /// <summary>
        /// Initializes the specified wow process.
        /// </summary>
        /// <param name="wowProcess">The wow process.</param>
        public static void Initialize(Process wowProcess)
        {
            random = new Random();
            synthesizer = new SpeechSynthesizer
            {
                Volume = 100,
                Rate = 2
            };

            synthesizer.SelectVoiceByHints(VoiceGender.Female, VoiceAge.Adult);
            
            Process = wowProcess;

            Log.Write("Successfully connected to WoW with process ID: " + Process.Id, Color.Green);

            var is64 = Process.ProcessName.Contains("64");

            Log.Write($"WoW Version: {Version} (x{(is64 ? "64" : "86")})", Color.Gray);

            var wowRectangle = new Rectangle();
            GetWindowRect(Process.MainWindowHandle, ref wowRectangle);
            Log.Write($"WoW Screen Resolution: {wowRectangle.Width}x{wowRectangle.Height}", Color.Gray);

            if (ConfigFile.ReadValue("Frozen", "AddonName") == "")
            {
                Log.Write("This is the first time you have run the program, please specify a name you would like the Frozen addon to use");
                Log.Write("this can be anything you like (letters only no numbers)");

                while (ConfigFile.ReadValue("Frozen", "AddonName") == "")
                {
                    var f = new frmSelectAddonName();
                    f.ShowDialog();
                }
            }

            Log.Write($"Addon Name set to: [{ConfigFile.ReadValue("Frozen", "AddonName")}]", Color.Blue);

            try
            {
                dtColorHelper = new DataTable();
                dtColorHelper.Columns.Add("Percent");
                dtColorHelper.Columns.Add("Unrounded");
                dtColorHelper.Columns.Add("Rounded");
                dtColorHelper.Columns.Add("Value");

                for (var i = 0; i <= 99; i++)
                {
                    var drNew = dtColorHelper.NewRow();
                    drNew["Percent"] = i < 10 ? "0.0" + i : "0." + i;
                    drNew["Unrounded"] = double.Parse(drNew["Percent"].ToString()) * 255;
                    drNew["Rounded"] = Math.Round(double.Parse(drNew["Percent"].ToString()) * 255, 0);
                    drNew["Value"] = i;
                    dtColorHelper.Rows.Add(drNew);
                }
                {
                    var drNew = dtColorHelper.NewRow();
                    drNew["Percent"] = "1.00";
                    drNew["Unrounded"] = "255";
                    drNew["Rounded"] = "255";
                    drNew["Value"] = 100;
                    dtColorHelper.Rows.Add(drNew);
                }
                {
                    var drNew = dtColorHelper.NewRow();
                    drNew["Percent"] = "1.00";
                    drNew["Unrounded"] = "255";
                    drNew["Rounded"] = "77"; // Manually added from testing this color sometimes shows up 
                    drNew["Value"] = 30;
                    dtColorHelper.Rows.Add(drNew);
                }
                {
                    var drNew = dtColorHelper.NewRow();
                    drNew["Percent"] = "1.00";
                    drNew["Unrounded"] = "255";
                    drNew["Rounded"] = "179"; // Manually added from testing this color sometimes shows up 
                    drNew["Value"] = 70;
                    dtColorHelper.Rows.Add(drNew);
                }
            }
            catch (Exception ex)
            {
                Log.Write(ex.Message, Color.Red);
            }
        }

        /// <summary>
        /// Targets the has buff.
        /// </summary>
        /// <param name="buffName">Name of the buff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static bool TargetHasBuff(string buffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == buffName);

            if (aura == null)
            {
                Log.Write($"[TargetHasBuff] cant find buff '{buffName}' in Spell Book");
                return false;
            }

            return TargetHasBuff(aura.InternalAuraNo);
        }

        /// <summary>
        /// Targets the has buff.
        /// </summary>
        /// <param name="auraNoInArrayOfAuras">The aura no in array of auras.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        private static bool TargetHasBuff(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 6);
            return c.R != 255  && c.B != 255;
        }

        [DllImport("user32.dll")]
        private static extern bool GetWindowRect(IntPtr hWnd, ref Rectangle rect);

        /// <summary>
        /// Releases unmanaged and - optionally - managed resources.
        /// </summary>
        public static void Dispose()
        {
            Log.Write("Disposing of WoW Process...");
            Process?.Close();
            Process = null;
            Log.Write("Disposing of WoW Process Completed.");
        }


        private static bool IsSpellOnCooldown(int spellNoInArrayOfSpells) // This will take the spell no from the array of spells, 1, 2, 3 ..... n
        {
            var c = GetBlockColor(spellNoInArrayOfSpells, 2);
            return c.R == 0;
        }

        /// <summary>
        /// Determines whether [is spell on cooldown] [the specified spell book spell name].
        /// </summary>
        /// <param name="spellBookSpellName">Name of the spell book spell.</param>
        /// <returns>
        ///   <c>true</c> if [is spell on cooldown] [the specified spell book spell name]; otherwise, <c>false</c>.
        /// </returns>
        [Obfuscation(Exclude = true)]
        public static bool IsSpellOnCooldown(string spellBookSpellName)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellBookSpellName);

            if (spell != null) return IsSpellOnCooldown(spell.InternalSpellNo);

            Log.Write($"[IsSpellOnCooldown] Unable to find spell with name '{spellBookSpellName}' in Spell Book");
            return false;
        }

        /// <summary>
        /// Spells the cooldown time remaining.
        /// </summary>
        /// <param name="spellNoInArrayOfSpells">The spell no in array of spells.</param>
        /// <returns></returns>

        private static int SpellCooldownTimeRemaining(int spellNoInArrayOfSpells)
        {
            var c = GetBlockColor(spellNoInArrayOfSpells, 2);

            try
            {
                Log.WriteDirectlyToLogFile($"Red = {c.R} Green = {c.G} Blue = {c.B}");
                if (c.R == 255)
                    return 0;
                if (c.R == 0)
                {
                    var power = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                    var power2 = dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()?["Value"].ToString();
                    return power != null && power2 != null ? int.Parse(power) * 100 + int.Parse(power2) : 0;
                }
            }
            catch (Exception ex)
            {
                Log.Write($"Failure in Spell Cooldown Remaining Red = {c.R} Green = {c.G} Blue = {c.B}");
                Log.Write(ex.Message, Color.Red);
            }

            return 0;
        }

        /// <summary>
        /// Talent By Row
        /// </summary>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int Talent(int row)
        {
            var c = GetBlockColor(4, 13);
            if (c.B != 0) return 0;
            try
            {
                switch (row)
                {
                    case 1:
                        c = GetBlockColor(2, 13);
                        return int.Parse(dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()["Value"].ToString());
                    case 2:
                        c = GetBlockColor(2, 13);
                        return int.Parse(dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()["Value"].ToString());
                    case 3:
                        c = GetBlockColor(2, 13);
                        return int.Parse(dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()["Value"].ToString());
                    case 4:
                        c = GetBlockColor(3, 13);
                        return int.Parse(dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()["Value"].ToString());
                    case 5:
                        c = GetBlockColor(3, 13);
                        return int.Parse(dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()["Value"].ToString());
                    case 6:
                        c = GetBlockColor(3, 13);
                        return int.Parse(dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()["Value"].ToString());
                    case 7:
                        c = GetBlockColor(4, 13);
                        return int.Parse(dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()["Value"].ToString());
                }
            }
            catch (Exception ex)
            {
                Log.Write($"Error in Talents Red = {c.R} Green = {c.G} Blue = {c.G}");
                Log.Write(ex.Message, Color.Red);
            }

            return 0;
        }

        /// <summary>
        /// Returns Player Race
        /// </summary>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static string PlayerRace
        {
            get
            {
                var c = GetBlockColor(4, 13);

                try
                {
                    if (c.B != 0) return "none";
                    
                    string[] Race = {"None","Human","Dwarf", "NightElf", "Gnome", "Dreanei", "Pandaren", "Orc", "Undead", "Tauren", "Troll", "BloodElf", "Goblin", "Worgen" ,"none"};
                    Log.WriteDirectlyToLogFile($"Green = {c.G}");
                    var race = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                    if (int.Parse(race) > 13)
                        return "none";
                    return Race[int.Parse(race)];

                }
                catch (Exception ex)
                {
                    Log.Write($"Error in race  Green = {c.G}");
                    Log.Write(ex.Message, Color.Red);
                }
                return "none";
            }
        }

        /// <summary>
        /// Returns Player Spec
        /// </summary>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static string PlayerClassSpec
        {
            get
            {
                var c = GetBlockColor(5, 13); // Column 5, row 13
                try
                {
                    if (c.R == 0) return "None"; 
                    string[] Spec = {
                        "None",
                        "DeathKnight-Blood",
                        "DeathKnight-Frost",
                        "DeathKnight-Unholy",
                        "DemonHunter-Havoc",
                        "DemonHunter-Vengeance",
                        "Druid-Balance",
                        "Druid-Feral",
                        "Druid-Guardian",
                        "Druid-Restoration",
                        "Hunter-BeastMastery",
                        "Hunter-Marksmanship",
                        "Hunter-Survival",
                        "Mage-Arcane",
                        "Mage-Fire",
                        "Mage-Frost",
                        "Monk-Brewmaster",
                        "Monk-Windwalker",
                        "Monk-Mistweaver",
                        "Paladin-Holy",
                        "Paladin-Protection",
                        "Paladin-Retribution",
                        "Priest-Discipline",
                        "Priest-Holy",
                        "Priest-Shadow",
                        "Rogue-Assassination",
                        "Rogue-Outlaw",
                        "Rogue-Subtlety",
                        "Shaman-Elemental",
                        "Shaman-Enhancement",
                        "Shaman-Restoration",
                        "Warlock-Affliction",
                        "Warrior-Arms",
                        "Warrior-Fury",
                        "Warrior-Protection",
                        "Warlock-Demonology",
                        "Warlock-Destruction",
                        "None" };
                    var spec = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()?["Value"].ToString();
                    return spec != null && int.Parse(spec) < 37 ? Spec[int.Parse(spec)] : "none";
                }
                catch (Exception ex)
                {
                    Log.Write("Error in Spec  Green = " + c.R);

                    Log.Write(ex.Message, Color.Red);
                }
                return "none";
            }
        }
        /// <summary>
        /// Spells the cooldown time remaining.
        /// </summary>
        /// <param name="spellBookSpellName">Name of the spell book spell.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int SpellCooldownTimeRemaining(string spellBookSpellName)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellBookSpellName);

            if (spell != null) return SpellCooldownTimeRemaining(spell.InternalSpellNo);

            Log.Write($"[SpellCooldownTimeRemaining] Unable to find spell with name '{spellBookSpellName}' in Spell Book");
            return 0;
        }

        private static bool IsSpellOnGCD(int spellNoInArrayOfSpells)
        {
            var blockColor = GetBlockColor(spellNoInArrayOfSpells, 2);
            return blockColor.R == Color.Red.R && blockColor.G == Color.Red.G && blockColor.B == Color.Red.B;
        }

        /// <summary>
        /// Determines whether [is spell on GCD] [the specified spell book spell name].
        /// </summary>
        /// <param name="spellBookSpellName">Name of the spell book spell.</param>
        /// <returns>
        ///   <c>true</c> if [is spell on GCD] [the specified spell book spell name]; otherwise, <c>false</c>.
        /// </returns>
        [Obfuscation(Exclude = true)]
        public static bool IsSpellOnGCD(string spellBookSpellName)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellBookSpellName);
            var flag = spell == null;
            bool result;
            if (flag)
            {
                Log.Write($"[IsSpellOnCooldown] Unable to find spell with name '{spellBookSpellName}' in Spell Book");
                result = false;
            }
            else
            {
                result = IsSpellOnGCD(spell.InternalSpellNo);
            }
            return result;
        }

        private static bool IsSpellInRange(int spellNoInArrayOfSpells) // This will take the spell no from the array of spells, 1, 2, 3 ..... n
        {
            var c = GetBlockColor(spellNoInArrayOfSpells, 3);
            return c.R == Color.Red.R && c.G == Color.Red.G && c.B == Color.Red.B;
        }

        /// <summary>
        /// Determines whether [is spell in range] [the specified spell book spell name].
        /// </summary>
        /// <returns>
        ///   <c>true</c> if [is spell in range] [the specified spell book spell name]; otherwise, <c>false</c>.
        /// </returns>
        [Obfuscation(Exclude = true)]
        public static void SetupHealingKeybinds()
        {
            // Clear all previous macros
            SendMacro("/script for i=1,36 do DeleteMacro(1) DeleteMacro(37) end");
            
            SendMacro("/script SetBinding(\"F1\", \"TARGETSELF\") SaveBindings(2)");
            SendMacro("/script SetBinding(\"F2\", \"TARGETPARTYMEMBER1\") SaveBindings(2)");
            SendMacro("/script SetBinding(\"F3\", \"TARGETPARTYMEMBER2\") SaveBindings(2)");
            SendMacro("/script SetBinding(\"F4\", \"TARGETPARTYMEMBER3\") SaveBindings(2)");
            SendMacro("/script SetBinding(\"F5\", \"TARGETPARTYMEMBER4\") SaveBindings(2)");

            var clearTargetMacro = @"/run if not GetMacroInfo(""ClrTar"") then CreateMacro(""ClrTar"", ""INV_MISC_QUESTIONMARK"", ""/cleartarget"", nil); end; SetBindingMacro(""F6"", ""ClrTar""); SaveBindings(2);";
            SendMacro(clearTargetMacro);

            for (int i = 1; i <= 10; i++)
            {
                var macro = $@"/run if not GetMacroInfo(""Tar{i:00}"") then CreateMacro(""Tar{i:00}"", ""INV_MISC_QUESTIONMARK"", ""/tar raid{i};"", nil); end; SetBindingMacro(""ALT-NUMPAD{(i - 1)}"", ""Tar{i:00}""); SaveBindings(2);";
                SendMacro(macro);
            }
            for (int i = 11; i <= 20; i++)
            {
                var macro = $@"/run if not GetMacroInfo(""Tar{i}"") then CreateMacro(""Tar{i}"", ""INV_MISC_QUESTIONMARK"", ""/tar raid{i};"", nil); end; SetBindingMacro(""NUMPAD{(i - 11)}"", ""Tar{i}""); SaveBindings(2);";
                SendMacro(macro);
            }
            for (int i = 21; i <= 30; i++)
            {
                var macro = $@"/run if not GetMacroInfo(""Tar{i}"") then CreateMacro(""Tar{i}"", ""INV_MISC_QUESTIONMARK"", ""/tar raid{i};"", nil); end; SetBindingMacro(""CTRL-NUMPAD{(i - 11)}"", ""Tar{i}""); SaveBindings(2);";
                SendMacro(macro);
            }
        }

        [Obfuscation(Exclude = true)]
        public static bool IsSpellInRange(string spellBookSpellName)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellBookSpellName);

            if (spell != null) return IsSpellInRange(spell.InternalSpellNo);

            Log.Write($"[IsSpellInRange] Unable to find spell with name '{spellBookSpellName}' in Spell Book");
            return false;
        }

        private static bool CanCast(int spellNoInArrayOfSpells, bool checkIfPlayerIsCasting = true, bool checkIfSpellIsOnCooldown = true, bool checkIfSpellIsInRange = true,
            bool checkSpellCharges = true, bool checkIfTargetIsVisible = true)
        {
            if (checkIfPlayerIsCasting)
                if (PlayerIsCasting)
                    return false;

            if (checkIfSpellIsOnCooldown)
                if (IsSpellOnCooldown(spellNoInArrayOfSpells))
                    return false;

            if (checkIfSpellIsInRange)
                if (IsSpellInRange(spellNoInArrayOfSpells) == false)
                    return false;

            if (checkSpellCharges)
                if (PlayerSpellCharges(spellNoInArrayOfSpells) <= 0)
                    return false;

            if (checkIfTargetIsVisible)
                if (TargetIsVisible == false)
                    return false;

            return true;
        }

        /// <summary>
        /// Determines whether this instance can cast the specified spell book spell name.
        /// </summary>
        /// <param name="spellBookSpellName">Name of the spell book spell.</param>
        /// <param name="checkIfPlayerIsCasting">if set to <c>true</c> [check if player is casting].</param>
        /// <param name="checkIfSpellIsOnCooldown">if set to <c>true</c> [check if spell is on cooldown].</param>
        /// <param name="checkIfSpellIsInRange">if set to <c>true</c> [check if spell is in range].</param>
        /// <param name="checkSpellCharges">if set to <c>true</c> [check spell charges].</param>
        /// <param name="checkIfTargetIsVisible">if set to <c>true</c> [check if target is visible].</param>
        /// <returns>
        ///   <c>true</c> if this instance can cast the specified spell book spell name; otherwise, <c>false</c>.
        /// </returns>
        [Obfuscation(Exclude = true)]
        public static bool CanCast(string spellBookSpellName, 
            bool checkIfPlayerIsCasting = true, 
            bool checkIfSpellIsOnCooldown = true, 
            bool checkIfSpellIsInRange = false,
            bool checkSpellCharges = false, 
            bool checkIfTargetIsVisible = true)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellBookSpellName);

            if (spell == null)
            {
                Log.Write($"[CanCast] Unable to find spell with name '{spellBookSpellName}' in Spell Book");
                return false;
            }

            var ret = CanCast(spell.InternalSpellNo, checkIfPlayerIsCasting, checkIfSpellIsOnCooldown, checkIfSpellIsInRange, checkSpellCharges, checkIfTargetIsVisible);

            return ret;
        }
        
        public static T ParseEnum<T>(string value)
        {
            return (T)Enum.Parse(typeof(T), value, true);
        }

        private static void SendKey(int modifierColor, int keyColor, int spellId, int milliseconds = 50, string spellName = null)
        {
            Keys modifierKey = Keys.None;
            Keys key = Keys.None;

            bool forced;
            string myKeyMapping = ConfigFile.ReadValue("Keybinds-" + Path.GetFileName(frmMain.combatRoutine.FileName).Replace(" ", "").ToLower(), spellId.ToString());

            if (myKeyMapping != "")
            {
                if (myKeyMapping.Contains("|")) // If we using Modifiers
                {
                    string[] split = myKeyMapping.Split('|');
                    modifierKey = ParseEnum<Keys>(split[0]);
                    key = ParseEnum<Keys>(split[1]);
                }
                else
                {
                    key = ParseEnum<Keys>(myKeyMapping);
                }
                forced = true;
            }
            else
            {
                if (modifierColor == 1) modifierKey = Keys.ShiftKey;
                if (modifierColor == 2) modifierKey = Keys.ControlKey;
                if (modifierColor == 3) modifierKey = Keys.Menu;

                //elseif key == "\\" then
                //return 0.01
                if (keyColor == 1) key = Keys.Oem5;  // Correct

                //elseif key == "[" then
                //return 0.02
                if (keyColor == 2) key = Keys.OemOpenBrackets; // Correct

                //elseif key == "]" then
                //return 0.03
                if (keyColor == 3) key = Keys.Oem6; // Correct

                //elseif key == ";" then
                //return 0.04
                if (keyColor == 4) key = Keys.Oem1; // Correct

                //elseif key == "'" then
                //return 0.05
                if (keyColor == 5) key = Keys.Oem7; // Correct

                //elseif key == "," then
                //return 0.06
                if (keyColor == 6) key = Keys.Oemcomma; // Correct

                //elseif key == "." then
                //return 0.07
                if (keyColor == 7) key = Keys.OemPeriod; // Correct

                //elseif key == "/" then
                //return 0.08
                if (keyColor == 8) key = Keys.OemQuestion; // Correct

                //elseif key == "`" then
                //return 0.09
                if (keyColor == 9) key = Keys.Oemtilde;    // Correct

                //elseif key == "-" then
                //return 0.10
                if (keyColor == 10) key = Keys.OemMinus;    // Correct

                //elseif key == "=" then
                //return 0.11
                if (keyColor == 11) key = Keys.Oemplus;    // Correct

                //elseif key == "F1" then
                //return 0.12
                if (keyColor == 12) key = Keys.F1;

                //elseif key == "F2" then
                //return 0.13
                if (keyColor == 13) key = Keys.F2;

                //elseif key == "F3" then
                //return 0.14
                if (keyColor == 14) key = Keys.F3;

                //elseif key == "F4" then
                //return 0.15
                if (keyColor == 15) key = Keys.F4;

                //elseif key == "F5" then
                //return 0.16
                if (keyColor == 16) key = Keys.F5;

                //elseif key == "F6" then
                //return 0.17
                if (keyColor == 17) key = Keys.F6;

                //elseif key == "F7" then
                //return 0.18
                if (keyColor == 18) key = Keys.F7;

                //elseif key == "F8" then
                //return 0.19
                if (keyColor == 19) key = Keys.F8;

                //elseif key == "F9" then
                //return 0.20
                if (keyColor == 20) key = Keys.F9;

                //elseif key == "F10" then
                //return 0.21
                if (keyColor == 21) key = Keys.F10;

                //elseif key == "F11" then
                //return 0.22
                if (keyColor == 22) key = Keys.F11;

                //elseif key == "F12" then
                //return 0.23
                if (keyColor == 23) key = Keys.F12;

                //elseif key == "1" then
                //return 0.24
                if (keyColor == 24) key = Keys.D1;

                //elseif key == "2" then
                //return 0.25
                if (keyColor == 25) key = Keys.D2;

                //elseif key == "3" then
                //return 0.26
                if (keyColor == 26) key = Keys.D3;

                //elseif key == "4" then
                //return 0.27
                if (keyColor == 27) key = Keys.D4;

                //elseif key == "5" then
                //return 0.28
                if (keyColor == 28) key = Keys.D5;

                //elseif key == "6" then
                //return 0.29
                if (keyColor == 29) key = Keys.D6;

                //elseif key == "7" then
                //return 0.30
                if (keyColor == 30) key = Keys.D7;

                //elseif key == "8" then
                //return 0.31
                if (keyColor == 31) key = Keys.D8;

                //elseif key == "9" then
                //return 0.32
                if (keyColor == 32) key = Keys.D9;

                //elseif key == "0" then
                //return 0.33
                if (keyColor == 33) key = Keys.D0;

                //elseif key == "Q" then
                //return 0.34
                if (keyColor == 34) key = Keys.Q;

                //elseif key == "W" then
                //return 0.35
                if (keyColor == 35) key = Keys.W;

                //elseif key == "E" then
                //return 0.36
                if (keyColor == 36) key = Keys.E;

                //elseif key == "R" then
                //return 0.37
                if (keyColor == 37) key = Keys.R;

                //elseif key == "T" then
                //return 0.38
                if (keyColor == 38) key = Keys.T;

                //elseif key == "Y" then
                //return 0.39
                if (keyColor == 39) key = Keys.Y;

                //elseif key == "U" then
                //return 0.40
                if (keyColor == 40) key = Keys.U;

                //elseif key == "I" then
                //return 0.41
                if (keyColor == 41) key = Keys.I;

                //elseif key == "O" then
                //return 0.42
                if (keyColor == 42) key = Keys.O;

                //elseif key == "P" then
                //return 0.43
                if (keyColor == 43) key = Keys.P;

                //elseif key == "A" then
                //return 0.44
                if (keyColor == 44) key = Keys.A;

                //elseif key == "S" then
                //return 0.45
                if (keyColor == 45) key = Keys.S;

                //elseif key == "D" then
                //return 0.46
                if (keyColor == 46) key = Keys.D;

                //elseif key == "F" then
                //return 0.47
                if (keyColor == 47) key = Keys.F;

                //elseif key == "G" then
                //return 0.48
                if (keyColor == 48) key = Keys.G;

                //elseif key == "H" then
                //return 0.49
                if (keyColor == 49) key = Keys.H;

                //elseif key == "J" then
                //return 0.50
                if (keyColor == 50) key = Keys.J;

                //elseif key == "K" then
                //return 0.51
                if (keyColor == 51) key = Keys.K;

                //elseif key == "L" then
                //return 0.52
                if (keyColor == 52) key = Keys.L;

                //elseif key == "Z" then
                //return 0.53
                if (keyColor == 53) key = Keys.Z;

                //elseif key == "X" then
                //return 0.54
                if (keyColor == 54) key = Keys.X;

                //elseif key == "C" then
                //return 0.55
                if (keyColor == 55) key = Keys.C;

                //elseif key == "V" then
                //return 0.56
                if (keyColor == 56) key = Keys.V;

                //elseif key == "B" then
                //return 0.57
                if (keyColor == 57) key = Keys.B;

                //elseif key == "N" then
                //return 0.58
                if (keyColor == 58) key = Keys.N;

                //elseif key == "M" then
                //return 0.59
                if (keyColor == 59) key = Keys.M;

                //elseif key == "N1" then
                //return 0.60
                if (keyColor == 60) key = Keys.NumPad1;

                //elseif key == "N2" then
                //return 0.61
                if (keyColor == 61) key = Keys.NumPad2;

                //elseif key == "N3" then
                //return 0.62
                if (keyColor == 62) key = Keys.NumPad3;

                //elseif key == "N4" then
                //return 0.63
                if (keyColor == 63) key = Keys.NumPad4;

                //elseif key == "N5" then
                //return 0.64
                if (keyColor == 64) key = Keys.NumPad5;

                //elseif key == "N6" then
                //return 0.65
                if (keyColor == 65) key = Keys.NumPad6;

                //elseif key == "N7" then
                //return 0.66
                if (keyColor == 66) key = Keys.NumPad7;

                //elseif key == "N8" then
                //return 0.67
                if (keyColor == 67) key = Keys.NumPad8;

                //elseif key == "N9" then
                //return 0.68
                if (keyColor == 68) key = Keys.NumPad9;

                //elseif key == "N0" then
                //return 0.69
                if (keyColor == 69) key = Keys.NumPad0;

                forced = false;
            }
            
            if (milliseconds < 50)
                milliseconds = 50;

            random = new Random();
            milliseconds = milliseconds + random.Next(50);

            if (spellName != null && key != Keys.None)
            {
                if (forced)
                    Log.Write("Casting spell: " + spellName + ", power = " + Power + ", unit power = " + UnitPower + ", Key = " + modifierKey + "-" + key + ", Forced Key", Color.BlueViolet);
                else
                    Log.Write("Casting spell: " + spellName + ", power = " + Power + ", unit power = " + UnitPower + ", Key = " + modifierKey + "-" + key + ", KeyColor= " + keyColor, Color.Black);
                
            }
            else
            {
                Log.Write("Unable to cast spell: " + spellName + " as we were unable to find the key-bound to it on your action-bars", Color.Red);
                Log.Write("Attempt to disable action-bar addons (assuming the key is actually bound) and see if this helps.", Color.Red);
            }

            if (modifierKey != Keys.None)
                KeyDown(modifierKey);

            Thread.Sleep(50);
            KeyDown(key);
            Thread.Sleep(milliseconds);
            KeyUp(key);

            Thread.Sleep(50);
            if (modifierKey != Keys.None)
                KeyUp(modifierKey);
        }


        /// <summary>
        /// Casts the spell on me.
        /// </summary>
        /// <param name="spellName">Name of the spell.</param>
        [Obfuscation(Exclude = true)]
        public static void CastSpellOnMe(string spellName)
        {
            SendMacro($"/cast [@player] {spellName}");            
        }

        /// <summary>
        /// Sends the key at location.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <param name="x">The x.</param>
        /// <param name="y">The y.</param>
        [Obfuscation(Exclude = true)]
        public static void SendKeyAtLocation(Keys key, int x, int y)
        {
            Log.Write($"Sending keypress {key} at location: x = {x}, y = {y}", Color.Gray);

            KeyDown(key);
            Thread.Sleep(50);
            KeyUp(key);

            Mouse.RightRelease();
            Thread.Sleep(50);
            Mouse.LeftClick(x, y);
            Thread.Sleep(50);
            Mouse.RightDown();
        }

        /// <summary>
        /// Sends the macro.
        /// </summary>
        /// <param name="macro">The macro.</param>
        [Obfuscation(Exclude = true)]
        internal static void SendMacro(string macro)
        {
            Log.Write("Sending macro: " + macro, Color.Gray);

            KeyPressRelease(Keys.Enter);
            Thread.Sleep(100);
            Write(macro);
            Thread.Sleep(100);
            KeyPressRelease(Keys.Enter);
        }

        [Obfuscation(Exclude = true)]
        public static int PlayerBuffStacks(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 8);

            try
            {
                if (c.R == 255)
                    return 0;
                // ReSharper disable once PossibleNullReferenceException
                var stacks = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()["Value"].ToString();
                return int.Parse(stacks);
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find buff stacks for color G = " + c.R, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return 0;
        }

        [Obfuscation(Exclude = true)]
        public static int PlayerBuffStacks(string auraName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == auraName);

            if (aura == null)
            {
                Log.Write($"[PlayerBuffStacks] Unable to find buff with name '{auraName}' in Spell Book");
                return -1;
            }

            return PlayerBuffStacks(aura.InternalAuraNo);
        }

        /// <summary>
        /// Pets the buff stacks.
        /// </summary>
        /// <param name="auraNoInArrayOfAuras">The aura no in array of auras.</param>
        /// <returns></returns>
        private static int PetBuffStacks(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 10);

            try
            {
                if (c.R == 255)
                    return 0;
                // ReSharper disable once PossibleNullReferenceException
                var stacks = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()["Value"].ToString();
                return int.Parse(stacks);
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find buff stacks for color G = " + c.R, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return 0;
        }

        [Obfuscation(Exclude = true)]
        public static void Reload()
        {
            SendMacro("/reload");
        }

        /// <summary>
        /// Pets the buff stacks.
        /// </summary>
        /// <param name="auraName">Name of the aura.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int PetBuffStacks(string auraName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == auraName);

            if (aura == null)
            {
                Log.Write($"[PlayerBuffStacks] Unable to find buff with name '{auraName}' in Spell Book");
                return -1;
            }

            return PetBuffStacks(aura.InternalAuraNo);
        }

        private static int TargetDebuffTimeRemaining(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 4);

            try
            {
                if (c.R == 255)
                    return 0;
                // ReSharper disable once PossibleNullReferenceException
                var power = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                var power2 = dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()?["Value"].ToString();
                return power != null && power2 != null ? int.Parse(power) * 100 + int.Parse(power2) : 0;

            }
            catch (Exception ex)
            {
                Log.Write("Failed to find Debuff Time Remaining for color G = " + c.G, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return 0;
        }

        /// <summary>
        /// Targets the debuff time remaining.
        /// </summary>
        /// <param name="debuffName">Name of the debuff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int TargetDebuffTimeRemaining(string debuffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == debuffName);

            if (aura == null)
            {
                Log.Write($"[TargetDebuffTimeRemaining] Unable to find debuff with name '{debuffName}' in Spell Book");
                return -1;
            }

            return TargetDebuffTimeRemaining(aura.InternalAuraNo);
        }

        public static int PlayerBuffTimeRemaining(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 8);
            if (c.R == 255 || c.B == 255)
                return 0;
            try
            {
                // ReSharper disable once PossibleNullReferenceException
                var power = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                var power2 = dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()?["Value"].ToString();
                return power != null && power2 != null ? int.Parse(power) * 100 + int.Parse(power2) : 0;
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find buff Remaining for color R = " + c.R + "G = " + c.G +" B = " +c.B, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return 0;
        }

        /// <summary>
        /// Players the buff time remaining.
        /// </summary>
        /// <param name="buffName">Name of the buff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int PlayerBuffTimeRemaining(string buffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == buffName);

            if (aura == null)
            {
                Log.Write($"[PlayerBuffTimeRemaining] Unable to find buff with name '{buffName}' in Spell Book");
                return -1;
            }

            return PlayerBuffTimeRemaining(aura.InternalAuraNo);
        }

        public static int PetBuffTimeRemaining(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 10);

            try
            {
                if (c.R == 255 || c.B == 255)
                    return 0;
                var power = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()?["Value"].ToString();
                var power2 = dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()?["Value"].ToString();
                return power != null && power2 != null ? int.Parse(power) * 100 + int.Parse(power2) : 0;
                // ReSharper disable once PossibleNullReferenceException
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find pet buff remaining for color G = " + c.G, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return 0;
        }

        /// <summary>
        /// Pets the buff time remaining.
        /// </summary>
        /// <param name="buffName">Name of the buff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int PetBuffTimeRemaining(string buffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == buffName);

            if (aura == null)
            {
                Log.Write($"[GetPetBuffTimeRemaining] Unable to find buff with name '{buffName}' in Spell Book");
                return -1;
            }

            return PetBuffTimeRemaining(aura.InternalAuraNo);
        }


        public static int TargetDebuffStacks(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 4);

            try
            {
                Log.WriteDirectlyToLogFile($"Red = {c.R}");
                if (c.R == 255)
                    return 0;

                // ReSharper disable once PossibleNullReferenceException
                var stacks = dtColorHelper.Select($"[Rounded] = '{c.R}'").FirstOrDefault()["Value"].ToString();

                return int.Parse(stacks);
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find debuff stacks for color R = " + c.R, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return 0;
        }

        /// <summary>
        /// Targets the debuff stacks.
        /// </summary>
        /// <param name="debuffName">Name of the debuff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int TargetDebuffStacks(string debuffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == debuffName);

            if (aura == null)
            {
                Log.Write($"[TargetDebuffStacks] Unable to find debuff with name '{debuffName}' in Spell Book");
                return -1;
            }

            return TargetDebuffStacks(aura.InternalAuraNo);
        }

        public static int PlayerSpellCharges(int spellNoInArrayOfSpells)
        {
            var c = GetBlockColor(spellNoInArrayOfSpells, 5);

            try
            {
                // ReSharper disable once PossibleNullReferenceException
                var stacks = dtColorHelper.Select($"[Rounded] = '{c.G}'").FirstOrDefault()["Value"].ToString();

                return int.Parse(stacks);
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find spell charge stacks for color G = " + c.G, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return 0;
        }

        /// <summary>
        /// Players the spell charges.
        /// </summary>
        /// <param name="spellName">Name of the spell.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int PlayerSpellCharges(string spellName)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellName);

            if (spell == null)
            {
                Log.Write($"[PlayerSpellCharges] Unable to find spell with name '{spellName}' in Spell Book");
                return -1;
            }

            return PlayerSpellCharges(spell.InternalSpellNo);
        }

        /// <summary>
        /// Items the count.
        /// </summary>
        /// <param name="itemName">Name of the item.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static int ItemCount(string itemName)
        {
            var item = SpellBook.Items.FirstOrDefault(s => s.ItemName == itemName);

            if (item == null)
            {
                Log.Write($"[GetItemCount] Unable to find Item with name '{itemName}' in Item Book");
                return -1;
            }

            return ItemCount(item.InternalItemNo);
        }

        public static int ItemCount(int itemNoInArrayOfItems)
        {
            var c = GetBlockColor(itemNoInArrayOfItems, 9);

            try
            {
                // ReSharper disable once PossibleNullReferenceException
                var count = dtColorHelper.Select($"[Rounded] = '{c.B}'").FirstOrDefault()["Value"].ToString();

                return int.Parse(count);
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find Item count for color B = " + c.B, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return 0;
        }

        /// <summary>
        /// Items the on cooldown.
        /// </summary>
        /// <param name="itemName">Name of the item.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static bool IsEquippedItem(string itemName)
        {
            var item = SpellBook.Items.FirstOrDefault(s => s.ItemName == itemName);

            if (item == null)
            {
                Log.Write($"[IsEquippedItem] Unable to find Item with name '{itemName}' in Item Book");
                return false;
            }

            return IsEquippedItem(item.InternalItemNo);
        }

        [Obfuscation(Exclude = true)]
        public static bool IsEquippedItem(int itemNoInArrayOfItems)
        {
            var c = GetBlockColor(itemNoInArrayOfItems, 9);

            try
            {
                return c.G == 255;
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find IsEquippedItem for color G = " + c.G, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return false;
        }

        /// <summary>
        /// Items the on cooldown.
        /// </summary>
        /// <param name="itemName">Name of the item.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static bool ItemOnCooldown(string itemName)
        {
            var item = SpellBook.Items.FirstOrDefault(s => s.ItemName == itemName);

            if (item == null)
            {
                Log.Write($"[GetItemCooldown] Unable to find Item with name '{itemName}' in Item Book");
                return false;
            }

            return ItemOnCooldown(item.InternalItemNo);
        }

        [Obfuscation(Exclude = true)]
        public static bool ItemOnCooldown(int itemNoInArrayOfItems)
        {
            var c = GetBlockColor(itemNoInArrayOfItems, 9);

            try
            {
                return c.R == Color.Red.R;
            }
            catch (Exception ex)
            {
                Log.Write("Failed to find Item Cooldown for color R = " + c.B, Color.Red);
                Log.Write("Error: " + ex.Message, Color.Red);
            }

            return false;
        }

        [Obfuscation(Exclude = true)]
        public static bool PlayerHasBuff(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 8);
            return c.R != 255  && c.B != 255;
        }

        /// <summary>
        /// Players the has buff.
        /// </summary>
        /// <param name="buffName">Name of the buff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static bool PlayerHasBuff(string buffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == buffName);

            if (aura == null)
            {
                Log.Write($"[HasAura] Unable to find aura with name '{buffName}' in Spell Book");
                return false;
            }

            return PlayerHasBuff(aura.InternalAuraNo);
        }


        public static bool PlayerHasDebuff(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 11);
            return c.R != 255 && c.B != 255;
        }

        public static bool IsSpellOverlayed(int spellNoInArrayOfSpells)
        {
            var c = GetBlockColor(spellNoInArrayOfSpells, 12);
            //Log.Write("R = " + c.R + " G = " + c.G + " B = " + c.B);
            return c.R == 255 && c.G == 0 && c.B == 0;
        }

        /// <summary>
        /// Determines whether [is spell overlayed] [the specified spell name].
        /// </summary>
        /// <param name="spellName">Name of the spell.</param>
        /// <returns>
        ///   <c>true</c> if [is spell overlayed] [the specified spell name]; otherwise, <c>false</c>.
        /// </returns>
        [Obfuscation(Exclude = true)]
        public static bool IsSpellOverlayed(string spellName)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellName);

            if (spell == null)
            {
                Log.Write($"[IsSpellOverlayed] Unable to find spell with name '{spellName}' in Spell Book");
                return false;
            }

            return IsSpellOverlayed(spell.InternalSpellNo);
        }

        /// <summary>
        /// Players the has debuff.
        /// </summary>
        /// <param name="debuffName">Name of the debuff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static bool PlayerHasDebuff(string debuffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == debuffName);

            if (aura == null)
            {
                Log.Write($"[PlayerHasDebuff] Unable to find debuff with name '{debuffName}' in Spell Book");
                return false;
            }

            return PlayerHasDebuff(aura.InternalAuraNo);
        }

        public static bool PetHasBuff(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 10);
            return c.R != 255 &&  c.B != 255;
        }

        /// <summary>
        /// Pets the has buff.
        /// </summary>
        /// <param name="buffName">Name of the buff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static bool PetHasBuff(string buffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == buffName);

            if (aura == null)
            {
                Log.Write($"[PetHasBuff] Unable to find aura with name '{buffName}' in Spell Book");
                return false;
            }

            return PetHasBuff(aura.InternalAuraNo);
        }

        /// <summary>
        /// Targets the has debuff.
        /// </summary>
        /// <param name="debuffName">Name of the debuff.</param>
        /// <returns></returns>
        [Obfuscation(Exclude = true)]
        public static bool TargetHasDebuff(string debuffName)
        {
            var aura = SpellBook.Auras.FirstOrDefault(s => s.AuraName == debuffName);

            if (aura == null)
            {
                Log.Write($"[TargetHasDebuff] Unable to find debuff with name '{debuffName}' in Spell Book");
                return false;
            }

            return TargetHasDebuff(aura.InternalAuraNo);
        }

        private static bool TargetHasDebuff(int auraNoInArrayOfAuras)
        {
            var c = GetBlockColor(auraNoInArrayOfAuras, 4);
            return c.R != 255 && c.B != 255;
        }

        /// <summary>
        /// Casts the spell.
        /// </summary>
        /// <param name="spellBookSpellName">Name of the spell book spell.</param>
        
        [Obfuscation(Exclude = true)]
        public static void CastSpell(string spellBookSpellName)
        {
            var spell = SpellBook.Spells.FirstOrDefault(s => s.SpellName == spellBookSpellName);

            if (spell == null)
            {
                Log.Write($"[CastSpellByName] Unable to find spell with name '{spellBookSpellName}' in Spell Book");
                return;
            }

            LastSpell = spellBookSpellName;
            
            SendKey(ModifierKeyBind(spell.InternalSpellNo), KeyBind(spell.InternalSpellNo), spell.SpellId, 50, spellBookSpellName);
        }

        [Obsolete("Please use the new method CastSpell(string spellName)")]
        [Obfuscation(Exclude = true)]
        public static void CastSpell(string spell, bool requirements = true, bool ret = true)
		{
            Log.Write("Please use the original CastSpell(string spellName) method this version has been confirmed to contain bugs.", Color.Red);
			if (!CanCast(spell) || !requirements) return;
			CastSpell(spell);
			Thread.Sleep(100);
			if (ret)
			{
				if (IsMounted)
				{
					frmMain.combatRoutine.MountedPulse();
				}
				else
				{
					if (IsInCombat)
					{
						frmMain.combatRoutine.Pulse();
					}
					else
					{
						frmMain.combatRoutine.OutOfCombatPulse();
					}
				}
			}
		}

        [DllImport("gdi32.dll")]
        static extern int GetDeviceCaps(IntPtr hdc, int nIndex);
        private enum DeviceCap
        {
            VERTRES = 10,
            DESKTOPVERTRES = 117

            // http://pinvoke.net/default.aspx/gdi32/GetDeviceCaps.html
        }
        
        public static float WindowsScalingFactor
        {
            get
            {
                Graphics g = Graphics.FromHwnd(IntPtr.Zero);
                IntPtr desktop = g.GetHdc();
                int LogicalScreenHeight = GetDeviceCaps(desktop, (int)DeviceCap.VERTRES);
                int PhysicalScreenHeight = GetDeviceCaps(desktop, (int)DeviceCap.DESKTOPVERTRES);

                float ScreenScalingFactor = PhysicalScreenHeight / (float)LogicalScreenHeight;

                return ScreenScalingFactor; // 1.25 = 125%
            }
        }

        [DllImport("gdi32.dll")]
        private static extern int BitBlt(IntPtr srchDC, int srcX, int srcY, int srcW, int srcH, IntPtr desthDC, int destX, int destY, int op);

        // This is apparently one of the fastest ways to read single pixel color
        // http://stackoverflow.com/questions/17130138/fastest-way-to-get-screen-pixel-color-in-c-sharp

        /// <summary>
        /// Gets the color of the block.
        /// </summary>
        /// <param name="column">The column.</param>
        /// <param name="row">The row.</param>
        /// <returns></returns>
        /// <exception cref="Exception">x and or y must be >= 1</exception>
        public static Color GetBlockColor(int column, int row)
        {
            if (column <= 0 || row <= 0)
                throw new Exception("x and or y must be >= 1");

            column = column - 1;
            row = row - 1;

            lock (thisLock) // We lock the bitmap "screenPixel" here to avoid it from being accessed by multiple threads at the same time and crashing
            {
                if (Process == null)
                    return Color.Black;

                if (Process.HasExited)
                {
                    Process = null;
                    MessageBox.Show("Wow has been closed, Frozen will now exit", "Frozen", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Application.ExitThread();
                    return Color.Black;
                }

                try
                {
                    using (var gdest = Graphics.FromImage(screenPixel))
                    {
                        using (var gsrc = Graphics.FromHwnd(Process.MainWindowHandle))
                        {
                            var hSrcDC = gsrc.GetHdc();
                            var hDC = gdest.GetHdc();
                            BitBlt(hDC, 0, 0, 1, 1, hSrcDC, column, row, (int) CopyPixelOperation.SourceCopy);
                            gdest.ReleaseHdc();
                            gsrc.ReleaseHdc();
                        }
                    }
                    var temp = screenPixel.GetPixel(0, 0);

                    return temp;
                }
                catch (Exception ex)
                {
                    Log.Write("Failed to find pixel color from screen, this is usually due to wow closing while", Color.Red);
                    Log.Write("attempting to find the pixel color", Color.Red);
                    Log.Write("Error Details: " + ex.Message, Color.Red);

                    return Color.Orange; // Orange cause nothing currently uses it
                }
            }
        }

        public static double GetBrightness(Color color) => 0.2126 * color.R + 0.7152 * color.G + 0.0722 * color.B;

        /// <summary>
        /// Gets the color of the pixel.
        /// </summary>
        /// <param name="column">The column.</param>
        /// <param name="row">The row.</param>
        /// <returns></returns>
        internal static Color GetPixelColor(int column, int row)
        {
            if (Process == null)
                return Color.Black;

            lock (thisLock) // We lock the bitmap "screenPixel" here to avoid it from being accessed by multiple threads at the same time and crashing
            {
                try
                {
                    using (var gdest = Graphics.FromImage(screenPixel))
                    {
                        using (var gsrc = Graphics.FromHwnd(Process.MainWindowHandle))
                        {
                            var hSrcDC = gsrc.GetHdc();
                            var hDC = gdest.GetHdc();
                            BitBlt(hDC, 0, 0, 1, 1, hSrcDC, column, row, (int) CopyPixelOperation.SourceCopy);
                            gdest.ReleaseHdc();
                            gsrc.ReleaseHdc();
                        }
                    }
                    var temp = screenPixel.GetPixel(0, 0);

                    return temp;
                }
                catch (Exception ex)
                {
                    Log.Write("Failed to find pixel color from screen, this is usually due to wow closing while", Color.Red);
                    Log.Write("attempting to find the pixel color", Color.Red);
                    Log.Write("Error Details: " + ex.Message, Color.Red);

                    return Color.Orange; // Orange cause nothing currently uses it
                }
            }
        }
        
        [DllImport("user32.dll", CharSet = CharSet.Auto, ExactSpelling = true)]
        private static extern IntPtr GetForegroundWindow();

        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        private static extern int GetWindowThreadProcessId(IntPtr handle, out int processId);

        [Obfuscation(Exclude = true)]
        public static MemoryStream FromBytes(byte[] buffer)
        {
            return new MemoryStream(buffer);
        }

        #region Keyboard Input

        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = false)]
        private static extern IntPtr SendMessage(IntPtr hWnd, int Msg, int wParam, int lParam);

        [return: MarshalAs(UnmanagedType.Bool)]
        [DllImport("user32.dll", SetLastError = true)]
        private static extern bool PostMessage(IntPtr hWnd, uint msg, UIntPtr wParam, UIntPtr lParam);

        /// <summary>
        /// Keys down.
        /// </summary>
        /// <param name="Key">The key.</param>
        [Obfuscation(Exclude = true)]
        public static void KeyDown(Keys Key)
        {
            SendMessage(Process.MainWindowHandle, 0x100, (int) Key, 0);
        }

        [Obfuscation(Exclude = true)]
        public static void KeyUp(Keys Key)
        {
            SendMessage(Process.MainWindowHandle, 0x101, (int) Key, 0);
        }

        /// <summary>
        /// Keys the press release.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <param name="modifier"></param>
        /// <param name="raidMemberId"></param>
        [Obfuscation(Exclude = true)]
        public static void KeyPressRelease(Keys key, Keys modifier = Keys.None, int raidMemberId = 0)
        {
            if (raidMemberId != 0)
            {
                Log.Write("Targeting: " + raidMemberId);
            }

            if (modifier != Keys.None)
            {
                KeyDown(modifier);
                Thread.Sleep(50);
            }

            KeyDown(key);
            Thread.Sleep(50);
            KeyUp(key);

            if (modifier != Keys.None)
            {
                KeyUp(modifier);
                Thread.Sleep(50);
            }
        }

        [Obfuscation(Exclude = true)]
        private static void Write(string text, params object[] args)
        {
            foreach (var character in string.Format(text, args))
            {
                PostMessage(Process.MainWindowHandle, 0x0102, new UIntPtr(character), UIntPtr.Zero);
            }
        }

        #endregion
    }
}