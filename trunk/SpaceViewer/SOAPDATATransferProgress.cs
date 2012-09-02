using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace SpaceViewer
{
	using System.Threading;
	using System.IO;
	using System.Web.Services.Protocols;


	public class TSOAPDATATransferProgress : System.Windows.Forms.Form
	{
		public static int ShowTrafficValue = 4096;
		private new Form ParentForm = null;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Label lbTransfer;
		private System.Windows.Forms.Label lbTransferValue;
		public int ProgressValue;
		public bool flCancel = false;
		private System.Windows.Forms.Label lbMeasurement;
		private System.Windows.Forms.Button btnCancel;
		public EventHandler DoOnProgressDelegate;
	
		public TSOAPDATATransferProgress(Form pParentForm)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			//.
			ParentForm = pParentForm;
			//.
			DoOnProgressDelegate = new EventHandler(DoOnProgress);
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.panel1 = new System.Windows.Forms.Panel();
			this.btnCancel = new System.Windows.Forms.Button();
			this.lbMeasurement = new System.Windows.Forms.Label();
			this.lbTransferValue = new System.Windows.Forms.Label();
			this.lbTransfer = new System.Windows.Forms.Label();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// panel1
			// 
			this.panel1.BackColor = System.Drawing.Color.Silver;
			this.panel1.Controls.Add(this.btnCancel);
			this.panel1.Controls.Add(this.lbMeasurement);
			this.panel1.Controls.Add(this.lbTransferValue);
			this.panel1.Controls.Add(this.lbTransfer);
			this.panel1.Location = new System.Drawing.Point(1, 1);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(246, 30);
			this.panel1.TabIndex = 0;
			// 
			// btnCancel
			// 
			this.btnCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold);
			this.btnCancel.Location = new System.Drawing.Point(187, 3);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(56, 24);
			this.btnCancel.TabIndex = 0;
			this.btnCancel.Text = "stop";
			this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
			// 
			// lbMeasurement
			// 
			this.lbMeasurement.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
			this.lbMeasurement.Location = new System.Drawing.Point(160, 8);
			this.lbMeasurement.Name = "lbMeasurement";
			this.lbMeasurement.Size = new System.Drawing.Size(24, 16);
			this.lbMeasurement.TabIndex = 1;
			// 
			// lbTransferValue
			// 
			this.lbTransferValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold);
			this.lbTransferValue.Location = new System.Drawing.Point(80, 8);
			this.lbTransferValue.Name = "lbTransferValue";
			this.lbTransferValue.Size = new System.Drawing.Size(72, 16);
			this.lbTransferValue.TabIndex = 2;
			this.lbTransferValue.TextAlign = System.Drawing.ContentAlignment.TopRight;
			// 
			// lbTransfer
			// 
			this.lbTransfer.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
			this.lbTransfer.Location = new System.Drawing.Point(8, 8);
			this.lbTransfer.Name = "lbTransfer";
			this.lbTransfer.Size = new System.Drawing.Size(64, 16);
			this.lbTransfer.TabIndex = 3;
			// 
			// TSOAPDATATransferProgress
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.Black;
			this.ClientSize = new System.Drawing.Size(248, 32);
			this.Controls.Add(this.panel1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
			this.Name = "TSOAPDATATransferProgress";
			this.ShowInTaskbar = false;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "data transfer progress";
			this.TopMost = true;
			this.Click += new System.EventHandler(this.TSOAPDATATransferProgress_Click);
			this.VisibleChanged += new System.EventHandler(this.TSOAPDATATransferProgress_VisibleChanged);
			this.panel1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		public void DoOnProgress(object sender, EventArgs e)
		{
			int V;
			if (ProgressValue >= 0)
			{
				V = ProgressValue;
				if (V > 1024)
				{
					lbMeasurement.Text = "Kb";
					V = (int)(V/1024);
				}
				else
				{
					lbMeasurement.Text = "bt";
				};
				lbTransfer.Text = "Received: ";
				lbTransferValue.Text = V.ToString();
			}
			else
			{
				V = -ProgressValue;
				if (V > 1024)
				{
					lbMeasurement.Text = "Kb";
					V = (int)(V/1024);
				}
				else
				{
					lbMeasurement.Text = "bt";
				};
				lbTransfer.Text = "Transmitted: ";
				lbTransferValue.Text = V.ToString();
			};
			flCancel = false;
			if (Math.Abs(ProgressValue) >= ShowTrafficValue)
			{
				Visible = true;
				Update();
				Application.DoEvents();
			}
		}

		public void Cancel()
		{
			Hide();
			flCancel = true;
		}

		private void btnCancel_Click(object sender, System.EventArgs e)
		{
			Cancel();
		}

		private void TSOAPDATATransferProgress_Click(object sender, System.EventArgs e)
		{
			Cancel();
		}

		private void TSOAPDATATransferProgress_VisibleChanged(object sender, System.EventArgs e)
		{
			if (Visible)
			{
				if (ParentForm != null)
				{
					Left = ParentForm.Left+(int)((ParentForm.Width-Width)/2);
					Top = ParentForm.Top+(int)((ParentForm.Height-Height)/2);
				};
			};
		}
	}


	public class TerminatedByUserException: SoapException 
	{
		public TerminatedByUserException(): base("operation terminated by user",System.Xml.XmlQualifiedName.Empty)
		{
		}
	}


	public class TDATATransferSoapExtension : SoapExtension
	{
		private Stream OldStream;
		private Stream NewStream;
		private byte[] Buffer = null;
		private int BufferSize = 8192;
		private bool flProcessing = false;
		private TReflector Reflector = null;

		public override void ProcessMessage(SoapMessage message)
		{
			if (flProcessing)
			{
				switch(message.Stage)
				{
					case SoapMessageStage.AfterSerialize:
					{
						NewStream.Seek(0,System.IO.SeekOrigin.Begin);
						while (true)
						{
							int BytesRead = NewStream.Read(Buffer, 0, BufferSize);
							if (BytesRead != 0) 
							{
								OldStream.Write(Buffer, 0, BytesRead);
								// Update the progress
								Reflector.DATATransferProgress.ProgressValue -= BytesRead;
								Reflector.DATATransferProgress.DoOnProgress(this,EventArgs.Empty);
								if (Reflector.DATATransferProgress.flCancel) 
								{
									((SoapClientMessage)message).Client.Abort();
									throw new TerminatedByUserException(); //. =>
								};
							}
							else
							{
								OldStream.Flush();
								NewStream.Seek(0,System.IO.SeekOrigin.Begin);
								return ; //. ->
							};
						};
					};

					case SoapMessageStage.BeforeDeserialize:
					{
						while (true)
						{
							int BytesRead = OldStream.Read(Buffer, 0, BufferSize);
							if (BytesRead != 0) 
							{
								NewStream.Write(Buffer, 0, BytesRead);
								// Update the progress
								Reflector.DATATransferProgress.ProgressValue += BytesRead;
								Reflector.DATATransferProgress.DoOnProgress(this,EventArgs.Empty);
								if (Reflector.DATATransferProgress.flCancel) 
								{
									((SoapClientMessage)message).Client.Abort();
									throw new TerminatedByUserException(); //. =>
								};
							}
							else
							{
								NewStream.Seek(0,System.IO.SeekOrigin.Begin);
								return ; //. ->
							};
						};
					};

					case SoapMessageStage.AfterDeserialize:
					{
						//.
						Reflector.DATATransferProgress.Hide();
						break; //. ->
					};

					case SoapMessageStage.BeforeSerialize:
					{
						//.
						Reflector.DATATransferProgress.Hide();
						break; //. ->
					};
				};
			};
		}

		public override Stream ChainStream(Stream stream)
		{
			if (!flProcessing)
			{
				return stream; //. ->
			};
			OldStream = stream;
			NewStream = new MemoryStream();
			Buffer = new byte[BufferSize];
			return NewStream;
		}

		public override object GetInitializer(Type serviceType)
		{
			return null;
		}

		public override object GetInitializer(LogicalMethodInfo methodInfo, SoapExtensionAttribute attribute)
		{
			return null;
		}

		public override void Initialize(object initializer) 
		{
			Reflector = TReflector.Reflector;
			//.
			if (Thread.CurrentThread == Reflector.MainThread)
			{
				if (Reflector.DATATransferProgress.Visible) throw new SoapException("operation in progress",System.Xml.XmlQualifiedName.Empty); //. =>
				Reflector.DATATransferProgress.ProgressValue = 0;
				Reflector.DATATransferProgress.flCancel = false;
				flProcessing = true;
			}
			else
			{
				flProcessing = false;
			};
		}
	}


	[AttributeUsage(AttributeTargets.Method)]
	public class TDATATransferSoapExtensionAttribute : SoapExtensionAttribute 
	{
		public override Type ExtensionType 
		{
			get { return typeof(TDATATransferSoapExtension); }
		}
		public override int Priority 
		{
			get { return 1; }
			set {  }
		}
	}

}
