using System;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using Frozen.Helpers;

namespace Frozen.Plugins
{
    internal class SamplePlugin : Plugin
    {
        int trinketOneCooldownInSeconds = 120;
        int trinketTwoCooldownInSeconds = 120;
        bool shouldUseTrinketOneUse = false;
        bool shouldUseTrinketTwoUse = false;
        bool shouldUseTrinketOneCd = false;
        bool shouldUseTrinketOneAlways = false;
        bool shouldUseTrinketTwoCd = false;
        bool shouldUseTrinketTwoAlways = false;

        private Stopwatch trinketOne = new Stopwatch();
        private Stopwatch trinketTwo = new Stopwatch();

        public override string Name
        {
            get
            {
                return "TrinketUsage";
            }
        }

        public override Form SettingsForm { get; set; }

        public override void Initialize()
        {
            Log.Write("");
            Log.Write("");
            Log.Write("Welcome to Snikzz trinket user", Color.Red);
            Log.Write("There are multiple things you have to do for this to work.", Color.Red);
            Log.Write("Open the .sb file for the rotation you wan't to use and add these two lines:", Color.Red);
            Log.Write("Spell,1000,TrinketOne,1", Color.Blue);
            Log.Write("Spell,1001,TrinketTwo,2", Color.Blue);
            Log.Write("Then go into the Forced Keybind window of Frozen and set the keybinding where you have the trinkets.", Color.Red);
            Log.Write("Last step is to load the plugin via File -> Load Plugin and a settings box comes up where you can configure your trinkets.", Color.Red);
            Log.Write("Once that is done press the \"Plugin On\" button in frozen and your good to go.", Color.Red);
            Log.Write("");
            Log.Write("");

            Form myGui = new UseTrinketGui();
            myGui.Show();
        }

        public override void Stop()
        {
        }

        private void resetStopwatch()
        {
            if (trinketOne.Elapsed.TotalSeconds >= trinketOneCooldownInSeconds)
                trinketOne.Reset();
            if (trinketTwo.Elapsed.TotalSeconds >= trinketTwoCooldownInSeconds)
                trinketTwo.Reset();
        }

        public override void OutOfCombatPulse()
        {
            resetStopwatch();
            shouldUseTrinketOneUse = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "UseTrinketOne");
            shouldUseTrinketTwoUse = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "UseTrinketTwo");
            trinketOneCooldownInSeconds = ConfigFile.ReadValue<int>("SnikzzInterrupt", "CdTrinketOne");
            trinketTwoCooldownInSeconds = ConfigFile.ReadValue<int>("SnikzzInterrupt", "CdTrinketTwo");
            shouldUseTrinketOneAlways = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "TrinketOneAlways");
            shouldUseTrinketTwoAlways = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "TrinketTwoAlways");
            shouldUseTrinketOneCd = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "TrinketOneCd");
            shouldUseTrinketTwoCd = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "TrinketTwoCd");
            base.OutOfCombatPulse();
        }

        public override void Pulse()
        {
            resetStopwatch();
            if (!WoW.CooldownsOn)
            {
                if (shouldUseTrinketOneAlways || shouldUseTrinketOneCd)
                    if (!trinketOne.IsRunning)
                    {
                        WoW.CastSpell("TrinketOne");
                        trinketOne.Start();
                    }
                if (shouldUseTrinketTwoAlways || shouldUseTrinketTwoCd)
                    if (!trinketTwo.IsRunning)
                    {
                        WoW.CastSpell("TrinketTwo");
                        trinketTwo.Start();
                    }
            }
            else
            {
                if (shouldUseTrinketOneAlways)
                    if (!trinketOne.IsRunning)
                    {
                        WoW.CastSpell("TrinketOne");
                        trinketOne.Start();
                    }
                if (shouldUseTrinketTwoAlways)
                    if (!trinketTwo.IsRunning)
                    {
                        WoW.CastSpell("TrinketTwo");
                        trinketTwo.Start();
                    }
            }
        }
    }

    public partial class UseTrinketGui : Form
    {
        public const int WM_NCLBUTTONDOWN = 0xA1;
        public const int HT_CAPTION = 0x2;

        [System.Runtime.InteropServices.DllImportAttribute("user32.dll")]
        public static extern int SendMessage(IntPtr hWnd, int Msg, int wParam, int lParam);
        [System.Runtime.InteropServices.DllImportAttribute("user32.dll")]
        public static extern bool ReleaseCapture();

        public UseTrinketGui()
        {
            InitializeComponent();
            //this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Settings Saved", Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void FrozenGui_Load(object sender, EventArgs e)
        {
            checkBoxTrinketOneUse.Checked = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "UseTrinketOne");
            checkBoxTrinketTwoUse.Checked = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "UseTrinketTwo");
            numericUpDown1.Value = ConfigFile.ReadValue<int>("SnikzzInterrupt", "CdTrinketOne");
            numericUpDown2.Value = ConfigFile.ReadValue<int>("SnikzzInterrupt", "CdTrinketTwo");
            checkBoxTrinketOneAlways.Checked = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "TrinketOneAlways");
            checkBoxTrinketTwoAlways.Checked = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "TrinketTwoAlways");
            checkBoxTrinketOneCd.Checked = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "TrinketOneCd");
            checkBoxTrinketTwoCd.Checked = ConfigFile.ReadValue<bool>("SnikzzInterrupt", "TrinketTwoCd");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ConfigFile.WriteValue("SnikzzInterrupt", "UseTrinketOne", checkBoxTrinketOneUse.Checked.ToString());
            ConfigFile.WriteValue("SnikzzInterrupt", "UseTrinketTwo", checkBoxTrinketTwoUse.Checked.ToString());
            ConfigFile.WriteValue("SnikzzInterrupt", "CdTrinketOne", numericUpDown1.Value.ToString());
            ConfigFile.WriteValue("SnikzzInterrupt", "CdTrinketTwo", numericUpDown2.Value.ToString());
            ConfigFile.WriteValue("SnikzzInterrupt", "TrinketOneAlways", checkBoxTrinketOneAlways.Checked.ToString());
            ConfigFile.WriteValue("SnikzzInterrupt", "TrinketTwoAlways", checkBoxTrinketTwoAlways.Checked.ToString());
            ConfigFile.WriteValue("SnikzzInterrupt", "TrinketOneCd", checkBoxTrinketOneCd.Checked.ToString());
            ConfigFile.WriteValue("SnikzzInterrupt", "TrinketTwoCd", checkBoxTrinketTwoCd.Checked.ToString());

            MessageBox.Show("Settings Saved", Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void FrozenGui_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                ReleaseCapture();
                SendMessage(Handle, WM_NCLBUTTONDOWN, HT_CAPTION, 0);
            }
        }
        private void InitializeComponent()
        {
            this.checkBoxTrinketOneUse = new System.Windows.Forms.CheckBox();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.checkBoxTrinketOneAlways = new System.Windows.Forms.CheckBox();
            this.checkBoxTrinketOneCd = new System.Windows.Forms.CheckBox();
            this.checkBoxTrinketTwoCd = new System.Windows.Forms.CheckBox();
            this.checkBoxTrinketTwoAlways = new System.Windows.Forms.CheckBox();
            this.numericUpDown2 = new System.Windows.Forms.NumericUpDown();
            this.checkBoxTrinketTwoUse = new System.Windows.Forms.CheckBox();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).BeginInit();
            this.SuspendLayout();
            // 
            // checkBoxTrinketOneUse
            // 
            this.checkBoxTrinketOneUse.AutoSize = true;
            this.checkBoxTrinketOneUse.Location = new System.Drawing.Point(13, 3);
            this.checkBoxTrinketOneUse.Name = "checkBoxTrinketOneUse";
            this.checkBoxTrinketOneUse.Size = new System.Drawing.Size(169, 17);
            this.checkBoxTrinketOneUse.ForeColor = System.Drawing.Color.White;
            this.checkBoxTrinketOneUse.TabIndex = 0;
            this.checkBoxTrinketOneUse.Text = "Use trinket one with cooldown";
            this.checkBoxTrinketOneUse.UseVisualStyleBackColor = true;
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(188, 2);
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(50, 20);
            this.numericUpDown1.Maximum = 600;
            this.numericUpDown1.TabIndex = 1;
            // 
            // checkBoxTrinketOneAlways
            // 
            this.checkBoxTrinketOneAlways.AutoSize = true;
            this.checkBoxTrinketOneAlways.Location = new System.Drawing.Point(244, 3);
            this.checkBoxTrinketOneAlways.Name = "checkBoxTrinketOneAlways";
            this.checkBoxTrinketOneAlways.Size = new System.Drawing.Size(59, 17);
            this.checkBoxTrinketOneAlways.ForeColor = System.Drawing.Color.White;
            this.checkBoxTrinketOneAlways.TabIndex = 2;
            this.checkBoxTrinketOneAlways.Text = "Always";
            this.checkBoxTrinketOneAlways.UseVisualStyleBackColor = true;
            // 
            // checkBoxTrinketOneCd
            // 
            this.checkBoxTrinketOneCd.AutoSize = true;
            this.checkBoxTrinketOneCd.Location = new System.Drawing.Point(313, 3);
            this.checkBoxTrinketOneCd.Name = "checkBoxTrinketOneCd";
            this.checkBoxTrinketOneCd.Size = new System.Drawing.Size(62, 17);
            this.checkBoxTrinketOneCd.ForeColor = System.Drawing.Color.White;
            this.checkBoxTrinketOneCd.TabIndex = 3;
            this.checkBoxTrinketOneCd.Text = "At burst";
            this.checkBoxTrinketOneCd.UseVisualStyleBackColor = true;
            // 
            // checkBoxTrinketTwoCd
            // 
            this.checkBoxTrinketTwoCd.AutoSize = true;
            this.checkBoxTrinketTwoCd.Location = new System.Drawing.Point(313, 40);
            this.checkBoxTrinketTwoCd.Name = "checkBoxTrinketTwoCd";
            this.checkBoxTrinketTwoCd.Size = new System.Drawing.Size(62, 17);
            this.checkBoxTrinketTwoCd.ForeColor = System.Drawing.Color.White;
            this.checkBoxTrinketTwoCd.TabIndex = 7;
            this.checkBoxTrinketTwoCd.Text = "At burst";
            this.checkBoxTrinketTwoCd.UseVisualStyleBackColor = true;
            // 
            // checkBoxTrinketTwoAlways
            // 
            this.checkBoxTrinketTwoAlways.AutoSize = true;
            this.checkBoxTrinketTwoAlways.Location = new System.Drawing.Point(244, 40);
            this.checkBoxTrinketTwoAlways.Name = "checkBoxTrinketTwoAlways";
            this.checkBoxTrinketTwoAlways.Size = new System.Drawing.Size(59, 17);
            this.checkBoxTrinketTwoAlways.ForeColor = System.Drawing.Color.White;
            this.checkBoxTrinketTwoAlways.TabIndex = 6;
            this.checkBoxTrinketTwoAlways.Text = "Always";
            this.checkBoxTrinketTwoAlways.UseVisualStyleBackColor = true;
            // 
            // numericUpDown2
            // 
            this.numericUpDown2.Location = new System.Drawing.Point(188, 39);
            this.numericUpDown2.Name = "numericUpDown2";
            this.numericUpDown2.Size = new System.Drawing.Size(50, 20);
            this.numericUpDown2.Maximum = 600;
            this.numericUpDown2.TabIndex = 5;
            // 
            // checkBoxTrinketTwoUse
            // 
            this.checkBoxTrinketTwoUse.AutoSize = true;
            this.checkBoxTrinketTwoUse.Location = new System.Drawing.Point(13, 40);
            this.checkBoxTrinketTwoUse.Name = "checkBoxTrinketTwoUse";
            this.checkBoxTrinketTwoUse.Size = new System.Drawing.Size(169, 17);
            this.checkBoxTrinketTwoUse.ForeColor = System.Drawing.Color.White;
            this.checkBoxTrinketTwoUse.TabIndex = 4;
            this.checkBoxTrinketTwoUse.Text = "Use trinket one with cooldown";
            this.checkBoxTrinketTwoUse.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(300, 63);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 8;
            this.button1.Text = "Save";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // FrozenGui
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.ClientSize = new System.Drawing.Size(380, 91);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.checkBoxTrinketTwoCd);
            this.Controls.Add(this.checkBoxTrinketTwoAlways);
            this.Controls.Add(this.numericUpDown2);
            this.Controls.Add(this.checkBoxTrinketTwoUse);
            this.Controls.Add(this.checkBoxTrinketOneCd);
            this.Controls.Add(this.checkBoxTrinketOneAlways);
            this.Controls.Add(this.numericUpDown1);
            this.Controls.Add(this.checkBoxTrinketOneUse);
            this.Name = "FrozenGui";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.FrozenGui_Load);
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.FrozenGui_MouseDown);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private System.Windows.Forms.CheckBox checkBoxTrinketOneUse;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.CheckBox checkBoxTrinketOneAlways;
        private System.Windows.Forms.CheckBox checkBoxTrinketOneCd;
        private System.Windows.Forms.CheckBox checkBoxTrinketTwoCd;
        private System.Windows.Forms.CheckBox checkBoxTrinketTwoAlways;
        private System.Windows.Forms.NumericUpDown numericUpDown2;
        private System.Windows.Forms.CheckBox checkBoxTrinketTwoUse;
        private System.Windows.Forms.Button button1;
    }
}