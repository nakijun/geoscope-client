using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace SpaceViewer
{
	/// <summary>
	/// Summary description for LoginPanel.
	/// </summary>
	public class TfmLoginPanel : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox edSpaceServerURL;
		private System.Windows.Forms.TextBox edUserName;
		private System.Windows.Forms.TextBox edUserPassword;
		private System.Windows.Forms.Button btnOK;
		private System.Windows.Forms.Button btnCancel;
		private bool flAccepted;
		private System.Windows.Forms.CheckBox cbUseProxy;
		private System.Windows.Forms.GroupBox gbProxyServer;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.TextBox edProxyUserName;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.TextBox edProxyUserPassword;
		private System.Windows.Forms.TextBox edProxyAddress;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public TfmLoginPanel()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.edSpaceServerURL = new System.Windows.Forms.TextBox();
			this.edUserName = new System.Windows.Forms.TextBox();
			this.edUserPassword = new System.Windows.Forms.TextBox();
			this.btnOK = new System.Windows.Forms.Button();
			this.btnCancel = new System.Windows.Forms.Button();
			this.cbUseProxy = new System.Windows.Forms.CheckBox();
			this.gbProxyServer = new System.Windows.Forms.GroupBox();
			this.label4 = new System.Windows.Forms.Label();
			this.edProxyAddress = new System.Windows.Forms.TextBox();
			this.edProxyUserName = new System.Windows.Forms.TextBox();
			this.edProxyUserPassword = new System.Windows.Forms.TextBox();
			this.label6 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.gbProxyServer.SuspendLayout();
			this.SuspendLayout();
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.label1.Location = new System.Drawing.Point(24, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(320, 16);
			this.label1.TabIndex = 0;
			this.label1.Text = "Server URL";
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.label2.Location = new System.Drawing.Point(96, 184);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(168, 16);
			this.label2.TabIndex = 1;
			this.label2.Text = "User name";
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.label3.Location = new System.Drawing.Point(96, 232);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(168, 16);
			this.label3.TabIndex = 2;
			this.label3.Text = "Password";
			// 
			// edSpaceServerURL
			// 
			this.edSpaceServerURL.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.edSpaceServerURL.Location = new System.Drawing.Point(24, 32);
			this.edSpaceServerURL.Name = "edSpaceServerURL";
			this.edSpaceServerURL.Size = new System.Drawing.Size(320, 23);
			this.edSpaceServerURL.TabIndex = 3;
			this.edSpaceServerURL.Text = "";
			// 
			// edUserName
			// 
			this.edUserName.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.edUserName.Location = new System.Drawing.Point(96, 200);
			this.edUserName.Name = "edUserName";
			this.edUserName.Size = new System.Drawing.Size(168, 23);
			this.edUserName.TabIndex = 4;
			this.edUserName.Text = "";
			// 
			// edUserPassword
			// 
			this.edUserPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.edUserPassword.Location = new System.Drawing.Point(96, 248);
			this.edUserPassword.Name = "edUserPassword";
			this.edUserPassword.PasswordChar = '*';
			this.edUserPassword.Size = new System.Drawing.Size(168, 23);
			this.edUserPassword.TabIndex = 5;
			this.edUserPassword.Text = "";
			// 
			// btnOK
			// 
			this.btnOK.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.btnOK.Location = new System.Drawing.Point(88, 288);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(80, 24);
			this.btnOK.TabIndex = 6;
			this.btnOK.Text = "OK";
			this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
			// 
			// btnCancel
			// 
			this.btnCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.btnCancel.Location = new System.Drawing.Point(192, 288);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(80, 24);
			this.btnCancel.TabIndex = 7;
			this.btnCancel.Text = "Cancel";
			this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
			// 
			// cbUseProxy
			// 
			this.cbUseProxy.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.cbUseProxy.Location = new System.Drawing.Point(24, 64);
			this.cbUseProxy.Name = "cbUseProxy";
			this.cbUseProxy.Size = new System.Drawing.Size(320, 24);
			this.cbUseProxy.TabIndex = 8;
			this.cbUseProxy.Text = "Use proxy";
			this.cbUseProxy.CheckedChanged += new System.EventHandler(this.cbUseProxy_CheckedChanged);
			// 
			// gbProxyServer
			// 
			this.gbProxyServer.Controls.Add(this.label4);
			this.gbProxyServer.Controls.Add(this.edProxyAddress);
			this.gbProxyServer.Controls.Add(this.edProxyUserName);
			this.gbProxyServer.Controls.Add(this.edProxyUserPassword);
			this.gbProxyServer.Controls.Add(this.label6);
			this.gbProxyServer.Controls.Add(this.label5);
			this.gbProxyServer.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.gbProxyServer.Location = new System.Drawing.Point(24, 88);
			this.gbProxyServer.Name = "gbProxyServer";
			this.gbProxyServer.Size = new System.Drawing.Size(320, 80);
			this.gbProxyServer.TabIndex = 9;
			this.gbProxyServer.TabStop = false;
			this.gbProxyServer.Text = " Proxy settings ";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(8, 24);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(56, 23);
			this.label4.TabIndex = 1;
			this.label4.Text = "Address";
			// 
			// edProxyAddress
			// 
			this.edProxyAddress.Location = new System.Drawing.Point(64, 22);
			this.edProxyAddress.Name = "edProxyAddress";
			this.edProxyAddress.Size = new System.Drawing.Size(248, 23);
			this.edProxyAddress.TabIndex = 0;
			this.edProxyAddress.Text = "";
			// 
			// edProxyUserName
			// 
			this.edProxyUserName.Location = new System.Drawing.Point(48, 48);
			this.edProxyUserName.Name = "edProxyUserName";
			this.edProxyUserName.TabIndex = 0;
			this.edProxyUserName.Text = "";
			// 
			// edProxyUserPassword
			// 
			this.edProxyUserPassword.Location = new System.Drawing.Point(216, 48);
			this.edProxyUserPassword.Name = "edProxyUserPassword";
			this.edProxyUserPassword.PasswordChar = '*';
			this.edProxyUserPassword.Size = new System.Drawing.Size(96, 23);
			this.edProxyUserPassword.TabIndex = 0;
			this.edProxyUserPassword.Text = "";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(152, 51);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(72, 23);
			this.label6.TabIndex = 0;
			this.label6.Text = "Password";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(12, 51);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(40, 23);
			this.label5.TabIndex = 3;
			this.label5.Text = "User";
			// 
			// TfmLoginPanel
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(370, 335);
			this.Controls.Add(this.gbProxyServer);
			this.Controls.Add(this.cbUseProxy);
			this.Controls.Add(this.btnCancel);
			this.Controls.Add(this.btnOK);
			this.Controls.Add(this.edUserPassword);
			this.Controls.Add(this.edUserName);
			this.Controls.Add(this.edSpaceServerURL);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Name = "TfmLoginPanel";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Login";
			this.gbProxyServer.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion
		public bool Dialog(ref bool Connection_flUseProxy, ref string Connection_ProxyAddress, ref string Connection_ProxyUserName, ref string Connection_ProxyUserPassword, ref string SpaceServerURL, ref string UserName, ref string UserPassword)
		{
			flAccepted = false;
			cbUseProxy.Checked = Connection_flUseProxy;
			edProxyAddress.Text = Connection_ProxyAddress;
			edProxyUserName.Text = Connection_ProxyUserName;
			edProxyUserPassword.Text = Connection_ProxyUserPassword;
			gbProxyServer.Enabled = Connection_flUseProxy;
			edSpaceServerURL.Text = SpaceServerURL;
			edUserName.Text = UserName;
			edUserPassword.Text = UserPassword;
			ShowDialog();
			if (flAccepted)
			{
				Connection_flUseProxy = cbUseProxy.Checked;
				Connection_ProxyAddress = edProxyAddress.Text;
				Connection_ProxyUserName = edProxyUserName.Text;
				Connection_ProxyUserPassword = edProxyUserPassword.Text;
				SpaceServerURL = edSpaceServerURL.Text;
				UserName = edUserName.Text;
				UserPassword = edUserPassword.Text;
				return true; //. ->
			}
			else
				return false;
		}

		private void btnOK_Click(object sender, System.EventArgs e)
		{
			flAccepted = true;
			Close();
		}

		private void btnCancel_Click(object sender, System.EventArgs e)
		{
			Close();
		}

		private void cbUseProxy_CheckedChanged(object sender, System.EventArgs e)
		{
			gbProxyServer.Enabled = cbUseProxy.Checked;
		}

	}
}
