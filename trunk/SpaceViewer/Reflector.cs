namespace SpaceViewer
{
	using System;
	using System.IO;
	using System.Drawing;
	using System.Drawing.Imaging;
	using System.Collections;
	using System.Threading;
	using System.ComponentModel;
	using System.Windows.Forms;
	using System.Xml;
	using SpaceViewer.SpaceProvider;
	using SpaceViewer.TBase2DVisualizationSOAPFunctionality;

	using TPtr = System.Int32;
	using TScreenNode = System.Drawing.Point;

	
	/// <summary>
	/// Summary description for Reflector.
	/// </summary>
	public class TReflector : System.Windows.Forms.Form
	{
		public const string ProfileFolder = "Profile";
		public static TReflector Reflector = null;
		private static Color BackgroundColor = Color.Silver;
		public static double ScaleCoef = 0.01;
		public static int SelectShiftFactor = 2;
		public Thread MainThread = Thread.CurrentThread;
		public bool flCancelled = false;
		private bool flInitialized = false;
		private bool flEnabled = true;
		public TReflectorConfiguration Configuration;
		public THistory History;
		public int History_Index = 0;
		public TReflectionWindow ReflectionWindow = null;
		private Bitmap BMP = new Bitmap(1,1);
		private int ReflectionID = 0;
		private TElectedPlaces ElectedPlaces;
		private TElectedVisualizations ElectedVisualizations;
		private System.Drawing.Point MouseDown_StartPos = new Point(0,0);
		public System.Windows.Forms.Panel pnlScaleAreaBegin;
		public System.Windows.Forms.Panel pnlRotateAreaBegin;
		public TNavigationType NavigationType = TNavigationType.None;
		private TNavigations Navigations;
		public TSOAPDATATransferProgress DATATransferProgress;
		private System.Windows.Forms.Button btnShowHideControlPanel;
		private new System.Windows.Forms.ContextMenu ContextMenu;
		private System.Windows.Forms.MenuItem ContextMenu_ItemCreate;
		private System.Windows.Forms.MenuItem ContextMenu_ItemElectedPlaces;
		private System.Windows.Forms.MenuItem ContextMenu_ItemElectedObjects;
		private System.Windows.Forms.Button ControlPanel_btnElectedVisualizations;
		private System.Windows.Forms.Button ControlPanel_btnElectedPlaces;
		private System.Windows.Forms.Panel ControlPanel_Border;
		private System.Windows.Forms.CheckBox ControlPanel_cbVisualizationMonitoring;
		public System.Windows.Forms.Panel ControlPanel;
		private System.Windows.Forms.Button btnHistory;
		public System.Windows.Forms.Button btnHistoryPrev;
		public System.Windows.Forms.Button btnHistoryNext;
		private System.Windows.Forms.Button btnUpdateBitmap;

		public TReflector()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			//.
			Reflector = this;
			//. get config
			Configuration = new TReflectorConfiguration(this);
			//.
			History = new THistory(this);
			//.
			ClientSize = new Size((Configuration.ReflectionWindow.Xmx-Configuration.ReflectionWindow.Xmn),(Configuration.ReflectionWindow.Ymx-Configuration.ReflectionWindow.Ymn));
			//.
			ReflectionWindow = new TReflectionWindow(Configuration.ReflectionWindow);
			ReflectionWindow.Normalize();
			//.
			ControlPanel_cbVisualizationMonitoring.Checked = Configuration.Monitoring_flEnabled;
			//.
			Navigations = new TNavigations(this);
			//.
			DATATransferProgress = new TSOAPDATATransferProgress(this);
			DATATransferProgress.Visible = false;
			//.
			ElectedPlaces = new TElectedPlaces(this);
			ElectedVisualizations = new TElectedVisualizations(this);
			//.
			flInitialized = true;
			//.
			DoOnResize();
			//.
			Show();
			Update();
			//.
			TfmLoginPanel LP = new TfmLoginPanel();
			try
			{
				flCancelled = (!LP.Dialog(ref Configuration.Communication_flUseProxy, ref Configuration.Communication_ProxyAddress, ref Configuration.Communication_ProxyUserName, ref Configuration.Communication_ProxyUserPassword, ref Configuration.SpaceServerURL, ref Configuration.UserName, ref Configuration.UserPassword));
				if (flCancelled)
					return; //. ->
			}
			finally
			{
				LP.Dispose();
			};
			Update();
			//.
			PrepareAndReflect();
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if (History != null)
			{
				History.Destroy();
				History = null;
			};
			if (Configuration != null) 
			{
				Configuration.Destroy();
				Configuration = null;
			}
			//.
			if (flInitialized)
			{
				Hide();
				//.
				flInitialized = false;
			};
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.pnlScaleAreaBegin = new System.Windows.Forms.Panel();
			this.pnlRotateAreaBegin = new System.Windows.Forms.Panel();
			this.btnShowHideControlPanel = new System.Windows.Forms.Button();
			this.ContextMenu = new System.Windows.Forms.ContextMenu();
			this.ContextMenu_ItemCreate = new System.Windows.Forms.MenuItem();
			this.ContextMenu_ItemElectedPlaces = new System.Windows.Forms.MenuItem();
			this.ContextMenu_ItemElectedObjects = new System.Windows.Forms.MenuItem();
			this.btnUpdateBitmap = new System.Windows.Forms.Button();
			this.ControlPanel_btnElectedVisualizations = new System.Windows.Forms.Button();
			this.ControlPanel_btnElectedPlaces = new System.Windows.Forms.Button();
			this.ControlPanel_Border = new System.Windows.Forms.Panel();
			this.ControlPanel_cbVisualizationMonitoring = new System.Windows.Forms.CheckBox();
			this.ControlPanel = new System.Windows.Forms.Panel();
			this.btnHistory = new System.Windows.Forms.Button();
			this.btnHistoryPrev = new System.Windows.Forms.Button();
			this.btnHistoryNext = new System.Windows.Forms.Button();
			this.ControlPanel.SuspendLayout();
			this.SuspendLayout();
			// 
			// pnlScaleAreaBegin
			// 
			this.pnlScaleAreaBegin.BackColor = System.Drawing.Color.DimGray;
			this.pnlScaleAreaBegin.Location = new System.Drawing.Point(0, 0);
			this.pnlScaleAreaBegin.Name = "pnlScaleAreaBegin";
			this.pnlScaleAreaBegin.Size = new System.Drawing.Size(2, 216);
			this.pnlScaleAreaBegin.TabIndex = 4;
			// 
			// pnlRotateAreaBegin
			// 
			this.pnlRotateAreaBegin.BackColor = System.Drawing.Color.DimGray;
			this.pnlRotateAreaBegin.Location = new System.Drawing.Point(0, 0);
			this.pnlRotateAreaBegin.Name = "pnlRotateAreaBegin";
			this.pnlRotateAreaBegin.Size = new System.Drawing.Size(2, 216);
			this.pnlRotateAreaBegin.TabIndex = 3;
			// 
			// btnShowHideControlPanel
			// 
			this.btnShowHideControlPanel.BackColor = System.Drawing.Color.Silver;
			this.btnShowHideControlPanel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold);
			this.btnShowHideControlPanel.Location = new System.Drawing.Point(0, 0);
			this.btnShowHideControlPanel.Name = "btnShowHideControlPanel";
			this.btnShowHideControlPanel.Size = new System.Drawing.Size(24, 24);
			this.btnShowHideControlPanel.TabIndex = 1;
			this.btnShowHideControlPanel.Click += new System.EventHandler(this.btnShowHideControlPanel_Click);
			// 
			// ContextMenu
			// 
			this.ContextMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																						this.ContextMenu_ItemCreate,
																						this.ContextMenu_ItemElectedPlaces,
																						this.ContextMenu_ItemElectedObjects});
			// 
			// ContextMenu_ItemCreate
			// 
			this.ContextMenu_ItemCreate.Index = 0;
			this.ContextMenu_ItemCreate.Text = "Create";
			// 
			// ContextMenu_ItemElectedPlaces
			// 
			this.ContextMenu_ItemElectedPlaces.Index = 1;
			this.ContextMenu_ItemElectedPlaces.Text = "Bookmarks";
			// 
			// ContextMenu_ItemElectedObjects
			// 
			this.ContextMenu_ItemElectedObjects.Index = 2;
			this.ContextMenu_ItemElectedObjects.Text = "Elected objects";
			// 
			// btnUpdateBitmap
			// 
			this.btnUpdateBitmap.BackColor = System.Drawing.Color.Silver;
			this.btnUpdateBitmap.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F);
			this.btnUpdateBitmap.Location = new System.Drawing.Point(392, 0);
			this.btnUpdateBitmap.Name = "btnUpdateBitmap";
			this.btnUpdateBitmap.Size = new System.Drawing.Size(24, 24);
			this.btnUpdateBitmap.TabIndex = 5;
			this.btnUpdateBitmap.Text = "*";
			this.btnUpdateBitmap.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			this.btnUpdateBitmap.Click += new System.EventHandler(this.btnUpdateBitmap_Click);
			// 
			// ControlPanel_btnElectedVisualizations
			// 
			this.ControlPanel_btnElectedVisualizations.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
			this.ControlPanel_btnElectedVisualizations.BackColor = System.Drawing.Color.LightSlateGray;
			this.ControlPanel_btnElectedVisualizations.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
			this.ControlPanel_btnElectedVisualizations.Location = new System.Drawing.Point(40, 1);
			this.ControlPanel_btnElectedVisualizations.Name = "ControlPanel_btnElectedVisualizations";
			this.ControlPanel_btnElectedVisualizations.Size = new System.Drawing.Size(64, 21);
			this.ControlPanel_btnElectedVisualizations.TabIndex = 5;
			this.ControlPanel_btnElectedVisualizations.Text = "Objects";
			this.ControlPanel_btnElectedVisualizations.Click += new System.EventHandler(this.ControlPanel_btnElectedVisualizations_Click);
			// 
			// ControlPanel_btnElectedPlaces
			// 
			this.ControlPanel_btnElectedPlaces.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
			this.ControlPanel_btnElectedPlaces.BackColor = System.Drawing.Color.LightSlateGray;
			this.ControlPanel_btnElectedPlaces.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
			this.ControlPanel_btnElectedPlaces.Location = new System.Drawing.Point(200, 1);
			this.ControlPanel_btnElectedPlaces.Name = "ControlPanel_btnElectedPlaces";
			this.ControlPanel_btnElectedPlaces.Size = new System.Drawing.Size(56, 21);
			this.ControlPanel_btnElectedPlaces.TabIndex = 2;
			this.ControlPanel_btnElectedPlaces.Text = "Places";
			this.ControlPanel_btnElectedPlaces.Click += new System.EventHandler(this.ControlPanel_btnElectedPlaces_Click);
			// 
			// ControlPanel_Border
			// 
			this.ControlPanel_Border.BackColor = System.Drawing.Color.Black;
			this.ControlPanel_Border.Location = new System.Drawing.Point(0, 0);
			this.ControlPanel_Border.Name = "ControlPanel_Border";
			this.ControlPanel_Border.Size = new System.Drawing.Size(288, 1);
			this.ControlPanel_Border.TabIndex = 3;
			// 
			// ControlPanel_cbVisualizationMonitoring
			// 
			this.ControlPanel_cbVisualizationMonitoring.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
			this.ControlPanel_cbVisualizationMonitoring.BackColor = System.Drawing.Color.LightSlateGray;
			this.ControlPanel_cbVisualizationMonitoring.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold);
			this.ControlPanel_cbVisualizationMonitoring.Location = new System.Drawing.Point(108, 1);
			this.ControlPanel_cbVisualizationMonitoring.Name = "ControlPanel_cbVisualizationMonitoring";
			this.ControlPanel_cbVisualizationMonitoring.Size = new System.Drawing.Size(96, 20);
			this.ControlPanel_cbVisualizationMonitoring.TabIndex = 4;
			this.ControlPanel_cbVisualizationMonitoring.Text = "Monitoring";
			this.ControlPanel_cbVisualizationMonitoring.CheckedChanged += new System.EventHandler(this.ControlPanel_cbVisualizationMonitoring_CheckedChanged);
			// 
			// ControlPanel
			// 
			this.ControlPanel.BackColor = System.Drawing.Color.LightSlateGray;
			this.ControlPanel.Controls.Add(this.btnHistoryNext);
			this.ControlPanel.Controls.Add(this.btnHistoryPrev);
			this.ControlPanel.Controls.Add(this.btnHistory);
			this.ControlPanel.Controls.Add(this.ControlPanel_btnElectedVisualizations);
			this.ControlPanel.Controls.Add(this.ControlPanel_btnElectedPlaces);
			this.ControlPanel.Controls.Add(this.ControlPanel_Border);
			this.ControlPanel.Controls.Add(this.ControlPanel_cbVisualizationMonitoring);
			this.ControlPanel.Location = new System.Drawing.Point(8, 0);
			this.ControlPanel.Name = "ControlPanel";
			this.ControlPanel.Size = new System.Drawing.Size(384, 23);
			this.ControlPanel.TabIndex = 2;
			this.ControlPanel.Visible = false;
			// 
			// btnHistory
			// 
			this.btnHistory.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
			this.btnHistory.BackColor = System.Drawing.Color.LightSlateGray;
			this.btnHistory.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
			this.btnHistory.Location = new System.Drawing.Point(264, 1);
			this.btnHistory.Name = "btnHistory";
			this.btnHistory.Size = new System.Drawing.Size(64, 21);
			this.btnHistory.TabIndex = 6;
			this.btnHistory.Text = "History";
			this.btnHistory.Click += new System.EventHandler(this.btnHistory_Click);
			// 
			// btnHistoryPrev
			// 
			this.btnHistoryPrev.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
			this.btnHistoryPrev.BackColor = System.Drawing.Color.LightSlateGray;
			this.btnHistoryPrev.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
			this.btnHistoryPrev.Location = new System.Drawing.Point(328, 1);
			this.btnHistoryPrev.Name = "btnHistoryPrev";
			this.btnHistoryPrev.Size = new System.Drawing.Size(24, 21);
			this.btnHistoryPrev.TabIndex = 7;
			this.btnHistoryPrev.Text = "<";
			this.btnHistoryPrev.Click += new System.EventHandler(this.btnHistoryPrev_Click);
			// 
			// btnHistoryNext
			// 
			this.btnHistoryNext.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
			this.btnHistoryNext.BackColor = System.Drawing.Color.LightSlateGray;
			this.btnHistoryNext.Enabled = false;
			this.btnHistoryNext.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
			this.btnHistoryNext.Location = new System.Drawing.Point(352, 1);
			this.btnHistoryNext.Name = "btnHistoryNext";
			this.btnHistoryNext.Size = new System.Drawing.Size(24, 21);
			this.btnHistoryNext.TabIndex = 8;
			this.btnHistoryNext.Text = ">";
			this.btnHistoryNext.Click += new System.EventHandler(this.btnHistoryNext_Click);
			// 
			// TReflector
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.Gray;
			this.ClientSize = new System.Drawing.Size(448, 325);
			this.Controls.Add(this.btnUpdateBitmap);
			this.Controls.Add(this.btnShowHideControlPanel);
			this.Controls.Add(this.ControlPanel);
			this.Controls.Add(this.pnlRotateAreaBegin);
			this.Controls.Add(this.pnlScaleAreaBegin);
			this.MaximumSize = new System.Drawing.Size(640, 480);
			this.Name = "TReflector";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Space-Viewer";
			this.Resize += new System.EventHandler(this.TReflector_Resize);
			this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.Reflector_MouseDown);
			this.Closing += new System.ComponentModel.CancelEventHandler(this.TReflector_Closing);
			this.SizeChanged += new System.EventHandler(this.TReflector_SizeChanged);
			this.Load += new System.EventHandler(this.TReflector_Load);
			this.MouseUp += new System.Windows.Forms.MouseEventHandler(this.Reflector_MouseUp);
			this.Closed += new System.EventHandler(this.TReflector_Closed);
			this.Paint += new System.Windows.Forms.PaintEventHandler(this.Reflector_Paint);
			this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.Reflector_MouseMove);
			this.ControlPanel.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			//. set culture info
			System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
			//.
			TReflector Reflector = new TReflector();
			try
			{
				if (Reflector.flCancelled)
					return; //. ->
				Reflector.Hide();
				while (true)
				{
					try
					{
						Reflector.ShowDialog();
						break; //. >
					}
					catch (Exception E)
					{
						MessageBox.Show(E.Message,"Error",MessageBoxButtons.OK,MessageBoxIcon.Stop);
					};
				};
			}
			finally
			{
				Reflector.Dispose();
			};
		}

		public void GetVisualizationBindingPoint(int idTVisualization, int idVisualization, out double X, out double Y)
		{
			X = 0.0;
			Y = 0.0;
			ITBase2DVisualizationSOAPFunctionalityService VF = new ITBase2DVisualizationSOAPFunctionalityService(Configuration.SpaceServerURL);
			if (Configuration.Communication_flUseProxy)
			{
				VF.Proxy = new System.Net.WebProxy(Configuration.Communication_ProxyAddress, true); 
				VF.Proxy.Credentials = new System.Net.NetworkCredential(Configuration.Communication_ProxyUserName,Configuration.Communication_ProxyUserPassword);
			};
			byte[] BA = VF.GetNodes(Configuration.UserName,Configuration.UserPassword,idTVisualization,idVisualization);
			if (BA.Length < (4+2*8))
				return; //. ->
			int NodesCount = BitConverter.ToInt32(BA,0);
			X = BitConverter.ToDouble(BA,4);
			Y = BitConverter.ToDouble(BA,12);
			//.
			/*///////double ZoomFactor = 0.1;
			double DeltaX = ZoomFactor*ClientRectangle.Width/2.0;
			double DeltaY = ZoomFactor*ClientRectangle.Height/2.0;
			TReflectionWindowStruc RW;
			RW.X0 = X-DeltaX; RW.Y0 = Y+DeltaY;
			RW.X1 = X+DeltaX; RW.Y1 = Y+DeltaY;
			RW.X2 = X+DeltaX; RW.Y2 = Y-DeltaY;
			RW.X3 = X-DeltaX; RW.Y3 = Y-DeltaY;
			RW.Xmn = 0; RW.Ymn = 0;
			RW.Xmx = ClientRectangle.Width; RW.Ymx = ClientRectangle.Height;
			//.*/
		}

		private void PrepareAndReflect()
		{
			if (!flEnabled)
				return; //. ->
			//. preparing reflection window
			double cX = (ClientRectangle.Width+0.0)/(ReflectionWindow.Xmx-ReflectionWindow.Xmn);
			double dX = (ReflectionWindow.X1-ReflectionWindow.X0);
			double dY = (ReflectionWindow.Y1-ReflectionWindow.Y0);
			ReflectionWindow.X1 = ReflectionWindow.X0+dX*cX;
			ReflectionWindow.Y1 = ReflectionWindow.Y0+dY*cX;
			ReflectionWindow.Xmn = 0; ReflectionWindow.Ymn = 0;
			ReflectionWindow.Xmx = ClientRectangle.Width; ReflectionWindow.Ymx = ClientRectangle.Height;
			ReflectionWindow.Normalize();
			//.
			if (Configuration.Monitoring_flEnabled && (Configuration.Monitoring_idVisualization != 0))
			{
				double X,Y;
				GetVisualizationBindingPoint(Configuration.Monitoring_idTVisualization,Configuration.Monitoring_idVisualization, out X, out Y);
				X *= Defines.cfTransMeter;
				Y *= Defines.cfTransMeter;
				double DX = X - ReflectionWindow.Xcenter;
				double DY = Y - ReflectionWindow.Ycenter;
				ReflectionWindow.X0 += DX; ReflectionWindow.Y0 += DY; 
				ReflectionWindow.X1 += DX; ReflectionWindow.Y1 += DY; 
				ReflectionWindow.X2 += DX; ReflectionWindow.Y2 += DY; 
				ReflectionWindow.X3 += DX; ReflectionWindow.Y3 += DY; 
				ReflectionWindow.Update();
			};
			TReflectionWindowStruc RW;
			ReflectionWindow.GetWindow(true, out RW);
			flEnabled = false;
			try
			{
				ISpaceProviderService SP = new ISpaceProviderService(Configuration.SpaceServerURL);
				if (Configuration.Communication_flUseProxy)
				{
					SP.Proxy = new System.Net.WebProxy(Configuration.Communication_ProxyAddress, true); 
					SP.Proxy.Credentials = new System.Net.NetworkCredential(Configuration.Communication_ProxyUserName,Configuration.Communication_ProxyUserPassword);
				};
   				byte[] BA = SP.GetSpaceWindowBitmap(Configuration.UserName,Configuration.UserPassword,RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3, Configuration.InvesibleLays, 4,1.0, ClientRectangle.Width,ClientRectangle.Height);
				MemoryStream MS = new MemoryStream();
				try
				{
					MS.Write(BA,0,BA.Length);
					if (BMP != null)
						BMP.Dispose();
					BMP = new Bitmap(MS);	
				}
				finally
				{
					MS.Close();
				};
				//. add operation to the history
				History.AddNew(RW,BA);
				History_Reset();
			}
			finally
			{
				flEnabled = true;
			};
			//.
			ReflectBitmap();
		}

		public void PrepareAndReflectByHistoryItem(THistoryItem Item)
		{
			//. set reflection window
			ReflectionWindow.X0 = Item.ReflectionWindow.X0*Defines.cfTransMeter; ReflectionWindow.Y0 = Item.ReflectionWindow.Y0*Defines.cfTransMeter;
			ReflectionWindow.X1 = Item.ReflectionWindow.X1*Defines.cfTransMeter; ReflectionWindow.Y1 = Item.ReflectionWindow.Y1*Defines.cfTransMeter;
			ReflectionWindow.X2 = Item.ReflectionWindow.X2*Defines.cfTransMeter; ReflectionWindow.Y2 = Item.ReflectionWindow.Y2*Defines.cfTransMeter;
			ReflectionWindow.X3 = Item.ReflectionWindow.X3*Defines.cfTransMeter; ReflectionWindow.Y3 = Item.ReflectionWindow.Y3*Defines.cfTransMeter;
			ReflectionWindow.Xmn = Item.ReflectionWindow.Xmn; ReflectionWindow.Ymn = Item.ReflectionWindow.Ymn; 
			ReflectionWindow.Xmx = Item.ReflectionWindow.Xmx; ReflectionWindow.Ymx = Item.ReflectionWindow.Ymx; 
			ReflectionWindow.Normalize();
			//.
			if (Item.Index != 0)
			{
				Bitmap _BMP = new Bitmap(Item.BitmapData);
				try
				{
					if (BMP != null)
						BMP.Dispose();
					BMP = THistory.MakeGrayscaleBitmap(_BMP);
				}
				finally
				{
					_BMP.Dispose();
				};
			}
			else
			{
				if (BMP != null)
					BMP.Dispose();
				BMP = new Bitmap(Item.BitmapData);
			};
			//.
			ReflectBitmap();
		}

		public void Reflect()
		{
			//.
			PrepareAndReflect();
		}

		public void ReflectBitmap()
		{
			Graphics g = this.CreateGraphics();
			try
			{
				SolidBrush brush = new SolidBrush(BackgroundColor);
				try
				{
					g.FillRectangle(brush, 0,0,ClientRectangle.Width,ClientRectangle.Height);
				}
				finally
				{
					brush.Dispose();
				};
				g.DrawImageUnscaled(BMP,0,0);
			}
			finally
			{
				g.Dispose();
			};
			ReflectionID++;
		}

		public bool ConvertScrCrd2RealCrd(int SX, int SY,  out double X, out double Y)
		{
			X = 0;
			Y = 0;
			if (!(((ReflectionWindow.Xmn <= SX) && (SX <= ReflectionWindow.Xmx)) && ((ReflectionWindow.Ymn <= SY) && (SY <= ReflectionWindow.Ymx)))) return false; //. ->
			double VS = -(0.0+SY-ReflectionWindow.Ymn)/(ReflectionWindow.Ymx-ReflectionWindow.Ymn);
			double HS = -(0.0+SX-ReflectionWindow.Xmn)/(ReflectionWindow.Xmx-ReflectionWindow.Xmn);
			double diffX0X3 = (ReflectionWindow.X0-ReflectionWindow.X3);
			double diffY0Y3 = (ReflectionWindow.Y0-ReflectionWindow.Y3);
			double diffX0X1 = (ReflectionWindow.X0-ReflectionWindow.X1);
			double diffY0Y1 = (ReflectionWindow.Y0-ReflectionWindow.Y1);
			double ofsX = (diffX0X1)*HS+(diffX0X3)*VS;
			double ofsY = (diffY0Y1)*HS+(diffY0Y3)*VS;
			X = (ReflectionWindow.X0+ofsX)/Defines.cfTransMeter;
			Y = (ReflectionWindow.Y0+ofsY)/Defines.cfTransMeter;
			return true;
		}

		public void PixShiftReflection(int HorShift, int VertShift)
		{
			double VS;
			double HS;
			double ofsX;
			double ofsY;
			double diffX0X3;
			double diffY0Y3;
			double diffX0X1;
			double diffY0Y1;

			VS = (VertShift+0.0)/(ReflectionWindow.Ymx-ReflectionWindow.Ymn);
			HS = (HorShift+0.0)/(ReflectionWindow.Xmx-ReflectionWindow.Xmn);

			diffX0X3 = ReflectionWindow.X0-ReflectionWindow.X3; diffY0Y3 = ReflectionWindow.Y0-ReflectionWindow.Y3;
			diffX0X1 = ReflectionWindow.X0-ReflectionWindow.X1; diffY0Y1 = ReflectionWindow.Y0-ReflectionWindow.Y1;

			ofsX = (diffX0X1)*HS+(diffX0X3)*VS;
			ofsY = (diffY0Y1)*HS+(diffY0Y3)*VS;
			ReflectionWindow.X0 = ReflectionWindow.X0+ofsX; ReflectionWindow.Y0 = ReflectionWindow.Y0+ofsY;
			ReflectionWindow.X1 = ReflectionWindow.X1+ofsX; ReflectionWindow.Y1 = ReflectionWindow.Y1+ofsY;
			ReflectionWindow.X2 = ReflectionWindow.X2+ofsX; ReflectionWindow.Y2 = ReflectionWindow.Y2+ofsY;
			ReflectionWindow.X3 = ReflectionWindow.X3+ofsX; ReflectionWindow.Y3 = ReflectionWindow.Y3+ofsY;
			ReflectionWindow.Xcenter = ReflectionWindow.Xcenter+ofsX; ReflectionWindow.Ycenter = ReflectionWindow.Ycenter+ofsY;
			ReflectionWindow.Update();
		}

		private void ChangeScaleReflection_PrepCoord(double ScaleFactor, ref double X, ref double Y)
		{
			double diffXXc;
			double diffYYc;
			double ofsX;
			double ofsY;

			diffXXc = X-ReflectionWindow.Xcenter; diffYYc = Y-ReflectionWindow.Ycenter;

			ofsX = diffXXc*ScaleFactor;
			ofsY = diffYYc*ScaleFactor;

			X = X+ofsX;
			Y = Y+ofsY;
		}

		public void ChangeScaleReflection(double ScaleFactor)
		{
			ChangeScaleReflection_PrepCoord(ScaleFactor,ref ReflectionWindow.X0,ref ReflectionWindow.Y0);
			ChangeScaleReflection_PrepCoord(ScaleFactor,ref ReflectionWindow.X2,ref ReflectionWindow.Y2);
			ChangeScaleReflection_PrepCoord(ScaleFactor,ref ReflectionWindow.X1,ref ReflectionWindow.Y1);
			ChangeScaleReflection_PrepCoord(ScaleFactor,ref ReflectionWindow.X3,ref ReflectionWindow.Y3);
			ReflectionWindow.Update();
		}

		public void AlignReflectionToNorthPole()
		{
			//* if NOT (ConvertSpaceCRDToGeoCRD(ReflectionWindow.X3,ReflectionWindow.Y3, Lat,Long) AND ConvertSpaceCRDToGeoCRD(ReflectionWindow.X0,ReflectionWindow.Y0, Lat1,Long1)) then Exit; //. ->
			double Lat = ReflectionWindow.Y3, Long = ReflectionWindow.X3;
			double Lat1 = ReflectionWindow.Y0, Long1 = ReflectionWindow.X0;
			double Angle;
			if ((Lat1-Lat) != 0)
			{
				Angle = Math.Atan((Long1-Long)/(Lat1-Lat));
				if (((Lat1-Lat) < 0) && ((Long1-Long) > 0)) Angle = Angle+Math.PI; else
					if (((Lat1-Lat) < 0) && ((Long1-Long) < 0)) Angle = Angle+Math.PI; else
					if (((Lat1-Lat) > 0) && ((Long1-Long) < 0)) Angle = Angle+2*Math.PI;
			}
			else
			{
				if ((Long1-Long) >= 0) Angle = Math.PI/2; else Angle = -Math.PI/2;
			};
			double GAMMA = -Angle;
			if (GAMMA < -Math.PI)
			{
				GAMMA = GAMMA+2*Math.PI;
			}
			else
			{
				if (GAMMA > Math.PI) GAMMA = GAMMA-2*Math.PI;
			};
			//. rotating ...
			while (Math.Abs(GAMMA) > Math.PI/32) 
			{
				RotateReflection(Math.PI/32*(GAMMA/Math.Abs(GAMMA)));
				GAMMA = GAMMA-Math.PI/32*(GAMMA/Math.Abs(GAMMA));
			};
			RotateReflection(GAMMA);
		}

		public void SetReflectionByWindow(TReflectionWindowStruc pWindow)
		{
			//*
		}

		public void RotateReflection_PrepCoord(ref double X, ref double Y, double QdR, double Qdl, double DirRotate, double DPX, double DPY)
		{
			double diffXXc;
			double diffYYc;
			double ofsXrt1;
			double ofsYrt1;
			double ofsXrt2;
			double ofsYrt2;
			double a;
			double b;
			double c;

			diffXXc = (X-ReflectionWindow.Xcenter); diffYYc = (Y-ReflectionWindow.Ycenter);
			a = 4.0*QdR;
			if (Math.Abs(diffXXc) >= Math.Abs(diffYYc))
			{
				b = 4.0*Qdl*diffYYc;
				c = Qdl*(Qdl-4.0*diffXXc*diffXXc);
				ofsYrt1 = (-b+Math.Sqrt(b*b-4.0*a*c))/(2.0*a);
				ofsXrt1 = (-2.0*ofsYrt1*diffYYc-Qdl)/(2.0*diffXXc);
				ofsYrt2 = (-b-Math.Sqrt(b*b-4.0*a*c))/(2.0*a);
				ofsXrt2 = (-2.0*ofsYrt2*diffYYc-Qdl)/(2.0*diffXXc);
				if ((Math.Pow((X+ofsXrt1)-DPX,2)+Math.Pow((Y+ofsYrt1)-DPY,2))*DirRotate < (Math.Pow((X+ofsXrt2)-DPX,2)+Math.Pow((Y+ofsYrt2)-DPY,2))*DirRotate)
				{
					X = X+ofsXrt1;
					Y = Y+ofsYrt1;
				}
				else
				{
					X = X+ofsXrt2;
					Y = Y+ofsYrt2;
				}
			}
			else
			{
				b = 4.0*Qdl*diffXXc;
				c = Qdl*(Qdl-4.0*diffYYc*diffYYc);
				ofsXrt1 = (-b+Math.Sqrt(b*b-4.0*a*c))/(2.0*a);
				ofsYrt1 = (-2.0*ofsXrt1*diffXXc-Qdl)/(2.0*diffYYc);
				ofsXrt2 = (-b-Math.Sqrt(b*b-4.0*a*c))/(2.0*a);
				ofsYrt2 = (-2.0*ofsXrt2*diffXXc-Qdl)/(2.0*diffYYc);

				if ((Math.Pow((Y+ofsYrt1)-DPY,2)+Math.Pow((X+ofsXrt1)-DPX,2))*DirRotate < (Math.Pow((Y+ofsYrt2)-DPY,2)+Math.Pow((X+ofsXrt2)-DPX,2))*DirRotate)
				{
					Y = Y+ofsYrt1;
					X = X+ofsXrt1;
				}
				else
				{
					Y = Y+ofsYrt2;
					X = X+ofsXrt2;
				}
			}
		}

		public void RotateReflection(double Angle)
		{
			double QdR;
			double Qdl;
			int DirRotate;

			DirRotate = (int)(Angle/Math.Abs(Angle));
			/*!!! algorithm working area*/ if (Math.Abs(Angle) > Math.PI/32) Angle = Math.PI/32*DirRotate;
			QdR = Math.Pow((ReflectionWindow.X0-ReflectionWindow.Xcenter),2)+Math.Pow((ReflectionWindow.Y0-ReflectionWindow.Ycenter),2);
			Qdl = QdR*Math.Pow((2.0*Math.Sin(Angle/2.0)),2);
			
			RotateReflection_PrepCoord(ref ReflectionWindow.X0,ref ReflectionWindow.Y0, QdR,Qdl,DirRotate, ReflectionWindow.X1,ReflectionWindow.Y1);
			RotateReflection_PrepCoord(ref ReflectionWindow.X1,ref ReflectionWindow.Y1, QdR,Qdl,DirRotate, ReflectionWindow.X2,ReflectionWindow.Y2);
			RotateReflection_PrepCoord(ref ReflectionWindow.X2,ref ReflectionWindow.Y2, QdR,Qdl,DirRotate, ReflectionWindow.X3,ReflectionWindow.Y3);
			RotateReflection_PrepCoord(ref ReflectionWindow.X3,ref ReflectionWindow.Y3, QdR,Qdl,DirRotate, ReflectionWindow.X0,ReflectionWindow.Y0);

			ReflectionWindow.Update();
			if (((ReflectionWindow.X1 == ReflectionWindow.X0) || (ReflectionWindow.Y1 == ReflectionWindow.Y0)) || ((ReflectionWindow.X3 == ReflectionWindow.X0) || (ReflectionWindow.Y3 == ReflectionWindow.Y0)))
			{
				//. avoid algorithm except point
				RotateReflection(Math.PI/4000000);
				return; //. ->
			};
			//.
		}

		public void ProcessNode(TPoint Point,  out int oX, out int oY)
		{
			double X = Point.X.Value*Defines.cfTransMeter;
			double Y = Point.Y.Value*Defines.cfTransMeter;
			double X_A;
			double X_B;
			double X_D;
			double Y_A;
			double Y_B;
			double Y_D;
			double XC;
			double YC;
			double diffXCX0;
			double diffYCY0;
			double X_L;
			double Y_L;
		    
			X_A = ReflectionWindow.Y1-ReflectionWindow.Y0; X_B = ReflectionWindow.X0-ReflectionWindow.X1; X_D = -(ReflectionWindow.X0*X_A+ReflectionWindow.Y0*X_B);
			Y_A = ReflectionWindow.Y3-ReflectionWindow.Y0; Y_B = ReflectionWindow.X0-ReflectionWindow.X3; Y_D = -(ReflectionWindow.X0*Y_A+ReflectionWindow.Y0*Y_B);
			XC = (Y_A*X+Y_B*(Y+X_D/X_B))/(Y_A-(X_A*Y_B/X_B));
			diffXCX0 = XC-ReflectionWindow.X0;
			if (X_B != 0)
			{
				YC = -(X_A*XC+X_D)/X_B;
				diffYCY0 = YC-ReflectionWindow.Y0;
				X_L = Math.Sqrt(Math.Pow((diffXCX0),2)+Math.Pow((diffYCY0),2));
				if ((((-X_B) > 0) && ((diffXCX0) < 0)) || (((-X_B) < 0) && ((diffXCX0) > 0))) X_L = -X_L;
			}
			else 
			{
				YC = (Y_B*Y+Y_A*(X+X_D/X_A))/(Y_B-(X_B*Y_A/X_A));
				diffYCY0 = YC-ReflectionWindow.Y0;
				X_L = Math.Sqrt(Math.Pow((diffXCX0),2)+Math.Pow((diffYCY0),2));
				if (((X_A > 0) && ((diffYCY0) < 0)) || ((X_A < 0) && ((diffYCY0) > 0))) X_L = -X_L;
			};
			XC = (X_A*X+X_B*(Y+Y_D/Y_B))/(X_A-(Y_A*X_B/Y_B));
			diffXCX0 = XC-ReflectionWindow.X0;
			if (Y_B != 0)
			{
				YC = -(Y_A*XC+Y_D)/Y_B;
				diffYCY0 = YC-ReflectionWindow.Y0;
				Y_L = Math.Sqrt(Math.Pow((diffXCX0),2)+Math.Pow((diffYCY0),2));
				if ((((-Y_B) > 0) && ((diffXCX0) < 0)) || (((-Y_B) < 0) && ((diffXCX0) > 0))) Y_L = -Y_L;
			}
			else
			{
				YC = (X_B*Y+X_A*(X+Y_D/Y_A))/(X_B-(Y_B*X_A/Y_A));
				diffYCY0 = YC-ReflectionWindow.Y0;
				Y_L = Math.Sqrt(Math.Pow((diffXCX0),2)+Math.Pow((diffYCY0),2));
				if (((Y_A > 0) && ((diffYCY0) < 0)) || ((Y_A < 0) && ((diffYCY0) > 0))) Y_L = -Y_L;
			};
			oX = (int)(ReflectionWindow.Xmn+X_L/Math.Sqrt(Math.Pow(X_A,2)+Math.Pow(X_B,2))*(ReflectionWindow.Xmx-ReflectionWindow.Xmn));
			oY = (int)(ReflectionWindow.Ymn+Y_L/Math.Sqrt(Math.Pow(Y_A,2)+Math.Pow(Y_B,2))*(ReflectionWindow.Ymx-ReflectionWindow.Ymn));
		}

		private void DoOnResize()
		{
			pnlScaleAreaBegin.Top = 0; pnlScaleAreaBegin.Height = ClientRectangle.Height;
			pnlRotateAreaBegin.Top = 0; pnlRotateAreaBegin.Height = ClientRectangle.Height;
			pnlScaleAreaBegin.Left = ClientRectangle.Width-40;
			pnlRotateAreaBegin.Left = ClientRectangle.Width-20;
			//.
			ControlPanel.Left = 0;
			ControlPanel.Top = ClientRectangle.Height-ControlPanel.Height;
			ControlPanel.Width = pnlScaleAreaBegin.Left;
			ControlPanel_Border.Width = ControlPanel.Width;
			//.
			btnShowHideControlPanel.Left = pnlScaleAreaBegin.Left;
			btnShowHideControlPanel.Top = ControlPanel.Top;
			btnShowHideControlPanel.Width = pnlRotateAreaBegin.Left-pnlScaleAreaBegin.Left+(int)(pnlScaleAreaBegin.Width/2);
			btnShowHideControlPanel.Height = ControlPanel.Height;
			if (ControlPanel.Visible) btnShowHideControlPanel.Text = ">"; else btnShowHideControlPanel.Text = "<";
			//.
			//.
			btnUpdateBitmap.Left = pnlRotateAreaBegin.Left+(int)(pnlScaleAreaBegin.Width/2);
			btnUpdateBitmap.Top = ControlPanel.Top;
			btnUpdateBitmap.Width = ClientRectangle.Width-btnUpdateBitmap.Left;
			btnUpdateBitmap.Height = ControlPanel.Height;
		}

		public void ProgressPanel_SetValue(Panel P, Color ValueColor, double Value, double MaxValue)
		{
			if (Value == 0)
			{
				P.Controls.Clear();
				// ? P.Width = 2;
				Update();
			}
			else
			{
				Panel ProgressPanel;
				if (P.Controls.Count == 0)
				{
					ProgressPanel = new Panel();
					ProgressPanel.Visible = false;
					ProgressPanel.Parent = P;
					ProgressPanel.BackColor = ValueColor;
					//? P.Width = 4;
					Update();
				};
				int V = (int)(Value*(P.Height/MaxValue));
				ProgressPanel = (Panel)P.Controls[0];
				ProgressPanel.Left = 0;
				ProgressPanel.Top = (P.Height-V);
				ProgressPanel.Width = P.Width;
				ProgressPanel.Height = V;
				ProgressPanel.Show();
			};
		}

		private void History_Prev()
		{
			History_Index++;
			THistoryItem Item;
			if (History.GetHistoryItem(History_Index, out Item))
			{
				History.Reflector.PrepareAndReflectByHistoryItem(Item);
				btnHistoryNext.Enabled = true;
			}
			else
			{
				History_Index--;
				btnHistoryPrev.Enabled = false;
			};
		}

		private void History_Next()
		{
			if (History_Index == 0)
				return ; //. ->
			History_Index--;
			THistoryItem Item;
			if (History.GetHistoryItem(History_Index, out Item))
			{
				History.Reflector.PrepareAndReflectByHistoryItem(Item);
				btnHistoryPrev.Enabled = true;
			};
			if (History_Index == 0)
				btnHistoryNext.Enabled = false;
		}

		private void History_Reset()
		{
			History_Index = 0;
			btnHistoryPrev.Enabled = true;
			btnHistoryNext.Enabled = false;
		}

		private void Reflector_Paint(object sender, System.Windows.Forms.PaintEventArgs e)
		{
			Bitmap _BMP = new Bitmap(ClientRectangle.Width,ClientRectangle.Height);
			try
			{
				Graphics g = Graphics.FromImage(_BMP);
				try
				{
					SolidBrush brush = new SolidBrush(BackgroundColor);
					try
					{
						g.FillRectangle(brush, 0,0,ClientRectangle.Width,ClientRectangle.Height);
					}
					finally
					{
						brush.Dispose();
					};
					if (ReflectionID == Navigations.ReflectionID)
						Navigations.Transform(g);
					g.DrawImageUnscaled(BMP,0,0);
				}
				finally
				{
					g.Dispose();
				};
				g = this.CreateGraphics();
				try
				{
					g.DrawImageUnscaled(_BMP,0,0);
				}
				finally
				{
					g.Dispose();
				};
			}
			finally
			{
				_BMP.Dispose();
			};
		}

		private void Reflector_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if (!flEnabled)
				return; //. ->
			if (e.X < pnlScaleAreaBegin.Left) NavigationType = TNavigationType.Moving; else
				if (e.X < pnlRotateAreaBegin.Left) NavigationType = TNavigationType.Scaling; else
				if (e.X >= pnlRotateAreaBegin.Left) NavigationType = TNavigationType.Rotating; else NavigationType = TNavigationType.None; 
			//.
			MouseDown_StartPos.X = e.X;
			MouseDown_StartPos.Y = e.Y;
		}

		private void Reflector_MouseUp(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if (!flEnabled)
				return; //. ->
			int dX = e.X-MouseDown_StartPos.X;
			int dY = e.Y-MouseDown_StartPos.Y;
			//.
			if ((Math.Abs(dX) < SelectShiftFactor) && (Math.Abs(dY) < SelectShiftFactor)) 
			{
				NavigationType = TNavigationType.None;
				return ; //. ->
			};
			//.
			switch (NavigationType)
			{
				case TNavigationType.Moving:
				{
					Navigations.AddItem(ReflectionID, BMP, TNavigationType.Moving, dX,dY);
					PixShiftReflection(dX,dY);
					break; //. ->
				};

				case TNavigationType.Scaling:
				{
					double ScaleFactor = -1*dY*ScaleCoef;
					if (ScaleFactor <= -1) ScaleFactor  = -1+ScaleCoef;
					Navigations.AddItem(ReflectionID, BMP, TNavigationType.Scaling, 0,(1/(ScaleFactor+1.0)));
					ChangeScaleReflection(ScaleFactor);
					break; //. ->
				};

				case TNavigationType.Rotating:
				{
					double dX0,dY0;
					dX0 = (MouseDown_StartPos.X-ReflectionWindow.Xmd);
					dY0 = (MouseDown_StartPos.Y-ReflectionWindow.Ymd);
					double dX1,dY1;
					dX1 = (e.X-ReflectionWindow.Xmd);
					dY1 = (e.Y-ReflectionWindow.Ymd);
					double Alpha = Math.Atan(dY0/dX0);
					double Betta = Math.Atan(dY1/dX1);
					double Gamma = -(Betta-Alpha);
					Navigations.AddItem(ReflectionID, BMP, TNavigationType.Rotating, 0,Gamma);
					double Portion = Math.PI/32;
					double _Gamma = Gamma;
					if (_Gamma < 0) Portion = -Portion;
					while (Math.Abs(_Gamma) > Math.Abs(Portion)) 
					{
						RotateReflection(Portion);
						_Gamma = _Gamma - Portion;
					};
					if (_Gamma != 0) RotateReflection(_Gamma);
					break; //. ->
				};
			};
			if (NavigationType != TNavigationType.None)
			{
				NavigationType = TNavigationType.None;
				//.
				///////PrepareBMPAndReflect();
			};
		}

		private void Reflector_MouseMove(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if (!flEnabled)
				return; //. ->
			//.
			int dX = e.X-MouseDown_StartPos.X;
			int dY = e.Y-MouseDown_StartPos.Y;
			//.
			if ((Math.Abs(dX) < SelectShiftFactor) && (Math.Abs(dY) < SelectShiftFactor)) return ; //. ->
			//.
			switch (NavigationType)
			{
				case TNavigationType.Moving:
				{
					Bitmap _BMP = new Bitmap(ClientRectangle.Width,ClientRectangle.Height);
					try
					{
						Graphics g = Graphics.FromImage(_BMP);
						try
						{
							SolidBrush brush = new SolidBrush(BackgroundColor);
							try
							{
								g.FillRectangle(brush, 0,0,_BMP.Width,_BMP.Height);
							}
							finally
							{
								brush.Dispose();
							};
							g.TranslateTransform(dX,dY);
							if (ReflectionID == Navigations.ReflectionID)
								Navigations.Transform(g);
							g.DrawImageUnscaled(BMP,0,0);
						}
						finally
						{
							g.Dispose();
						};
						g = this.CreateGraphics();
						try
						{
							g.DrawImageUnscaled(_BMP,0,0);  
						}
						finally
						{
							g.Dispose();
						};
					}
					finally
					{
						_BMP.Dispose();
					};
					break; //. ->
				};

				case TNavigationType.Scaling:
				{
					double ScaleFactor = -1*dY*ScaleCoef;
					Bitmap _BMP = new Bitmap(ClientRectangle.Width,ClientRectangle.Height);
					try
					{
						Graphics g = Graphics.FromImage(_BMP);
						try
						{
							SolidBrush brush = new SolidBrush(BackgroundColor);
							try
							{
								g.FillRectangle(brush, 0,0,_BMP.Width,_BMP.Height);
							}
							finally
							{
								brush.Dispose();
							};
							double Scale = (1.0+ScaleFactor);
							if (Scale <= 0) Scale = ScaleCoef;
							Scale = 1/Scale;
							g.TranslateTransform(ReflectionWindow.Xmd,ReflectionWindow.Ymd);
							g.ScaleTransform((float)Scale,(float)Scale);
							g.TranslateTransform(-ReflectionWindow.Xmd,-ReflectionWindow.Ymd);
							if (ReflectionID == Navigations.ReflectionID)
								Navigations.Transform(g);
							g.DrawImageUnscaled(BMP,0,0);
						}
						finally
						{
							g.Dispose();
						};
						g = this.CreateGraphics();
						try
						{
							g.DrawImageUnscaled(_BMP,0,0);  
						}
						finally
						{
							g.Dispose();
						};
					}
					finally
					{
						_BMP.Dispose();
					};
					break; //. ->
				};

				case TNavigationType.Rotating:
				{
					double dX0,dY0;
					dX0 = (MouseDown_StartPos.X-ReflectionWindow.Xmd);
					dY0 = (MouseDown_StartPos.Y-ReflectionWindow.Ymd);
					double dX1,dY1;
					dX1 = (e.X-ReflectionWindow.Xmd);
					dY1 = (e.Y-ReflectionWindow.Ymd);
					double Alpha = Math.Atan(dY0/dX0);
					double Betta = Math.Atan(dY1/dX1);
					double Gamma = -(Betta-Alpha);
					Bitmap _BMP = new Bitmap(ClientRectangle.Width,ClientRectangle.Height);
					try
					{
						Graphics g = Graphics.FromImage(_BMP);
						try
						{
							SolidBrush brush = new SolidBrush(BackgroundColor);
							try
							{
								g.FillRectangle(brush, 0,0,_BMP.Width,_BMP.Height);
							}
							finally
							{
								brush.Dispose();
							};
							g.TranslateTransform(ReflectionWindow.Xmd,ReflectionWindow.Ymd);
							g.RotateTransform((float)(-Gamma*180.0/Math.PI));
							g.TranslateTransform(-ReflectionWindow.Xmd,-ReflectionWindow.Ymd);
							if (ReflectionID == Navigations.ReflectionID)
								Navigations.Transform(g);
							g.DrawImageUnscaled(BMP,0,0);
						}
						finally
						{
							g.Dispose();
						};
						g = this.CreateGraphics();
						try
						{
							g.DrawImageUnscaled(_BMP,0,0);  
						}
						finally
						{
							g.Dispose();
						};
					}
					finally
					{
						_BMP.Dispose();
					};
					break; //. ->
				};
			};
		}

		private void btnShowHideControlPanel_Click(object sender, System.EventArgs e)
		{
			if (!flEnabled)
				return; //. ->
			if (!ControlPanel.Visible) 
			{
				int dX = 32;
				ControlPanel.Width = 0;
				ControlPanel.Left = btnShowHideControlPanel.Left;
				ControlPanel.Visible = true;
				ControlPanel.BringToFront();
				while (ControlPanel.Left >= dX)
				{
					ControlPanel.Left = ControlPanel.Left-dX;
					ControlPanel.Width = ControlPanel.Width+dX;
					Application.DoEvents();
				};
				ControlPanel.Width = ControlPanel.Width+ControlPanel.Left;
				ControlPanel.Left = 0;
				btnShowHideControlPanel.Text = ">";
				ControlPanel.BringToFront();
			}
			else
			{
				int dX = 32;
				while (ControlPanel.Width >= dX)
				{
					ControlPanel.Width = ControlPanel.Width-dX;
					ControlPanel.Left = ControlPanel.Left+dX;
					Application.DoEvents();
				};
				ControlPanel.Width = 0;
				ControlPanel.Left = btnShowHideControlPanel.Left;
				ControlPanel.Visible = false;
				btnShowHideControlPanel.Text = "<";
			};
		}

		private void ControlPanel_btnReflectionConfiguration_Click(object sender, System.EventArgs e)
		{
			if (!flEnabled)
				return; //. ->
			/*///////if (ReflectionConfigurationPanel == null)
			{
				ReflectionConfigurationPanel = new TfmReflectionConfiguration(this);
				Cursor.Current = Cursors.WaitCursor;
				try
				{
					ReflectionConfigurationPanel.Update();
				}
				finally
				{
					Cursor.Current = Cursors.Default;
				};
			};
			ReflectionConfigurationPanel.ShowDialog();*/
		}

		private void TReflector_Resize(object sender, System.EventArgs e)
		{
		}

		private void TReflector_SizeChanged(object sender, System.EventArgs e)
		{
			if (!flEnabled)
				return; //. ->
			DoOnResize();
		}

		private void btnUpdateBitmap_Click(object sender, System.EventArgs e)
		{
			PrepareAndReflect();
		}

		private void ControlPanel_cbVisualizationMonitoring_CheckedChanged(object sender, System.EventArgs e)
		{
			Configuration.Monitoring_flEnabled = ControlPanel_cbVisualizationMonitoring.Checked;
		}

		private void ControlPanel_btnElectedPlaces_Click(object sender, System.EventArgs e)
		{
			TElectedPlace ElectedPlace;
			if (ElectedPlaces.PanelDialog(out ElectedPlace))
			{
				Update();
				ReflectionWindow.X0 = ElectedPlace.ReflectionWindow.X0*Defines.cfTransMeter; ReflectionWindow.Y0 = ElectedPlace.ReflectionWindow.Y0*Defines.cfTransMeter;
				ReflectionWindow.X1 = ElectedPlace.ReflectionWindow.X1*Defines.cfTransMeter; ReflectionWindow.Y1 = ElectedPlace.ReflectionWindow.Y1*Defines.cfTransMeter;
				ReflectionWindow.X2 = ElectedPlace.ReflectionWindow.X2*Defines.cfTransMeter; ReflectionWindow.Y2 = ElectedPlace.ReflectionWindow.Y2*Defines.cfTransMeter;
				ReflectionWindow.X3 = ElectedPlace.ReflectionWindow.X3*Defines.cfTransMeter; ReflectionWindow.Y3 = ElectedPlace.ReflectionWindow.Y3*Defines.cfTransMeter;
				ReflectionWindow.Update();
				Text = "place: "+ElectedPlace.Name;
				ControlPanel_cbVisualizationMonitoring.Checked = false;
				PrepareAndReflect();
			};
		}

		private void ControlPanel_btnElectedVisualizations_Click(object sender, System.EventArgs e)
		{
			TElectedVisualization ElectedVisualization;
			if (ElectedVisualizations.PanelDialog(out ElectedVisualization))
			{
				Update();
				Text = "object: "+ElectedVisualization.Name;
				Configuration.Monitoring_idTVisualization = ElectedVisualization.idTVisualization;
				Configuration.Monitoring_idVisualization = ElectedVisualization.idVisualization;
				ControlPanel_cbVisualizationMonitoring.Checked = true;
				PrepareAndReflect();
			};
		}

		private void btnHistory_Click(object sender, System.EventArgs e)
		{
			History.ShowPanel();
		}

		private void TReflector_Closed(object sender, System.EventArgs e)
		{
			Application.Exit();		
		}

		private void TReflector_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
		}

		private void TReflector_Load(object sender, System.EventArgs e)
		{
		
		}

		private void btnHistoryPrev_Click(object sender, System.EventArgs e)
		{
			History_Prev();
		}

		private void btnHistoryNext_Click(object sender, System.EventArgs e)
		{
			History_Next();
		}
	}

	public class Defines
	{
		public static TPtr nilPtr = -1;
		public static double nilCrd = 0;
		public static int TSpace_MinFreeArea = 100000; 
		public static int TSpace_IncreaseDelta = 1000000; 
		public static int TSpaceObj_maxPointsCount = 10000;
		public static int ofsptrFirstPoint = 12;
		public static int ofsptrListOwnerObj = 28;
		public static int SpacePtrSize = 4;
		public static int SpaceObjSize = 36;
		public static int ObjPointSize = 16;
		public static int cfTransMeter = 10000;
		public static int Reflection_VisibleFactor = 4;

		public enum TComponentOperation {opCreate,opDestroy,opUpdate,opInsert,opRemove};

		//. user component operations (tranferred from SecurityComponentOperations table)
		public static int idCreateOperation = 1;
		public static int idDestroyOperation = 2;
		public static int idReadOperation = 3;
		public static int idWriteOperation = 4;
		public static int idCloneOperation = 5;
		public static int idExecuteOperation = 6;
		public static int idChangeSecurityOperation = 7;

		public static int CoComponentsTypesIDBase = 1000000;

		public static int idTCoVisualization = 2064;
		public static string nmTCoVisualization = "Co-visualization";

		public static int idTVisualization = 2004;
		public static string nmTVisualization = "Visualization"; //. 

		public static int idTLay2DVisualization = 2011; //. 
		public static string nmTLay2DVisualization = "Lay of 2D-visualization";

		public static int idTPrivateAreaVisualization = 2042; //.  
		public static string nmTPrivateAreaVisualization = "Private Area aecoaeecaoey";

		public static int idTGeodesyPoint = 2043;
		public static string nmTGeodesyPoint = "Geodesy Point"; //.  

		public static int idTCoComponent = 2015;
		public static string nmTCoComponent = "Co-Component"; //. 

		public static int idTCoComponentType = 2016;
		public static string nmTCoComponentType = "Co-type";

		public static int idTCoComponentTypeMarker = 2017;
		public static string nmTCoComponentTypeMarker = "Co-type marker";

		public static int idTMODELUser = 2019;
		public static string nmTMODELUser = "Model user"; //. 

		public static int idTMODELServer = 2052;
		public static string nmTMODELServer = "MODEL-Server"; //. 

		public static int idTProxyObject = 2008;
		public static string nmTProxyObject = "Proxy"; //. 

		public static int idTDATAFile = 2018;
		public static string nmTDATAFile = "DATA file";

		public static int idTImage = 2002;
		public static string nmTImage = "Image";

		public static int idTDescription = 2001;
		public static string nmTDescription = "Description";

		public static int idTForumMessage = 2063;
		public static string nmTForumMessage = "Users forum message";

		public static int idTForum = 2062;
		public static string nmTForum = "Users forum";

		public static int idTCoReference = 2051;
		public static string nmTCoReference = "CoReference";

		public static int idTPositioner = 2050;
		public static string nmTPositioner = "Positioner";

		public static int idTOrientedWMFVisualization = 2049;
		public static string nmTOrientedWMFVisualization = "OrientedWMF-visualization";

		public static int idTCellVisualization = 2048;
		public static string nmTCellVisualization = "CELL-visualization";

		public static int idTEllipseVisualization = 2047;
		public static string nmTEllipseVisualization = "Ellipse-visualization";

		public static int idTWMFVisualization = 2046;
		public static string nmTWMFVisualization = "WMF-visualization";

		public static int idTPictureVisualization = 2045;
		public static string nmTPictureVisualization = "Picture-visualization";

		public static int idTRoundVisualization = 2044;
		public static string nmTRoundVisualization = "Round-visualization";

		public static int idTHyperText = 2041;
		public static string nmTHyperText = "Hyper-text";

		public static int idTComponentsFindService = 2040;
		public static string nmTComponentsFindService = "Objects service";

		public static int idTUsersService = 2039;
		public static string nmTUsersService = "User service";

		public static int idTMRKVisualization = 2034;
		public static string nmTMRKVisualization = "Mark-visualization";

		public static int idTOrientedPictureVisualization = 2033;
		public static string nmTOrientedPictureVisualization = "OrientedPicture-visualization";

		public static int idTOrientedTTFVisualization = 2032;
		public static string nmTOrientedTTFVisualization = "OrientedTTF-visualization";

		public static int idTIcon = 2031;
		public static string nmTIcon = "Icon";

		public static int idTMessageBoardMessage = 2030;
		public static string nmTMessageBoardMessage = "Message-board message";

		public static int idTMessageBoard = 2029;
		public static string nmTMessageBoard = "User message board";

		public static int idTHREF = 2028;     
		public static string nmTHREF = "Hipertext reference";

		public static int idTSecurityComponentOperation = 2025;
		public static string nmTSecurityComponentOperation = "Security Component Operation";

		public static int idTSecurityKey = 2024;
		public static string nmTSecurityKey = "Security Key";

		public static int idTSecurityFile = 2023;
		public static string nmTSecurityFile = "Security File";

		public static int idTSecurityComponent = 2022; //. 
		public static string nmTSecurityComponent = "Security Component";

		public static int idTAddress = 2014;
		public static string nmTAddress = "Address";

		public static int idTName = 2000;
		public static string nmTName = "Name";

		public static int idTHREFVisualization = 2060;
		public static string nmTHREFVisualization = "HREF-visualization";

		public static int idTTTFVisualization = 2006;
		public static string nmTTTFVisualization = "TTF-visualization";

		public static int idTHouse = 102;
		public static string nmTHouse = "House";

		public static int idTStreet = 101;
		public static string nmTStreet = "Street";

		public static int idTOtherObj = -1;
		public static string nmTOtherObj = "Other object";
	}

	public struct TCrd
		//. conversions: thanks goes to Richard Biffl
	{
		public ushort WD0;
		public ushort WD1;
		public ushort WD2;

		public TCrd(ref byte[] BA, ref int Index)
		{
			WD0 = (ushort)(BA[Index+0]+(BA[Index+1] << 8));
			WD1 = (ushort)(BA[Index+2]+(BA[Index+3] << 8));
			WD2 = (ushort)(BA[Index+4]+(BA[Index+5] << 8));
			Index +=6;
		}

		public TCrd(ushort val)
		{
			WD0 = val;
			WD1 = val;
			WD2 = val;
		}

		public void Set(byte[] BA, ref int Index)
		{
			WD0 = (ushort)(BA[Index+0]+(BA[Index+1] << 8));
			WD1 = (ushort)(BA[Index+2]+(BA[Index+3] << 8));
			WD2 = (ushort)(BA[Index+4]+(BA[Index+5] << 8));
			Index +=6;
		}

		public double Value 
		{
			get 
			{
				ushort x = (ushort)(WD0 & 0x00FF);  /* Real biased exponent in x */
				ushort W0;
				ushort W1;
				ushort W2;
				ushort W3;
				/* when exponent is 0, value is 0.0 */
				if (x == 0)
					return 0;
				else 
				{
					W3 = (ushort)
						(((x + 894) << 4) |  /* adjust exponent bias */
						(WD2 & 0x8000) |  /* sign bit */
						((WD2 & 0x7800) >> 11));  /* begin significand */
					W2 = (ushort)
						((WD2 << 5) |  /* continue shifting significand */
						(WD1 >> 11));
					W1 = (ushort)
						((WD1 << 5) |
						(WD0 >> 11));
					W0 = (ushort)((WD0 & 0xFF00) << 5); /* mask real's exponent */
				};
				byte[] BA = new byte[8];
				BA[0] = (byte)(W0 & 0xFF); BA[1] = (byte)(W0 >> 8);
				BA[2] = (byte)(W1 & 0xFF); BA[3] = (byte)(W1 >> 8);
				BA[4] = (byte)(W2 & 0xFF); BA[5] = (byte)(W2 >> 8);
				BA[6] = (byte)(W3 & 0xFF); BA[7] = (byte)(W3 >> 8);
				return BitConverter.ToDouble(BA,0);
			}
			set 
			{
				byte[] BA = BitConverter.GetBytes(value);
				ushort W0 = (ushort)(BA[0] | (BA[1] << 8));
				ushort W1 = (ushort)(BA[2] | (BA[3] << 8));
				ushort W2 = (ushort)(BA[4] | (BA[5] << 8));
				ushort W3 = (ushort)(BA[6] | (BA[7] << 8));
				/* check for 0.0 */
				if ((W0 == 0x0000) &&
					(W1 == 0x0000) &&
					(W2 == 0x0000) &&
					/* ignore sign bit */
					((W3 & 0x7FFF) == 0x0000)) 
				{
					/* exponent and significand are both 0, so value is 0.0 */
					WD2 = WD1 = WD0 = 0x0000;
					/* sign bit is ignored ( -0.0 -> 0.0 ) */
					return;
				}

				/* test for maximum exponent value */
				if ((W3 & 0x7FF0) == 0x7FF0) 
				{
					/* value is either Inf or NaN */
					if ((W0 == 0x0000) &&
						(W1 == 0x0000) &&
						(W2 == 0x0000) &&
						((W3 & 0x000F) == 0x0000)) 
					{
						/* significand is 0, so value is Inf */
						/* value becomes signed maximum real, */
						/* and error code prInf is returned */
						WD1 = WD0 = 0xFFFF;
						WD2 = (ushort)(0x7FFF | (W3 & 0x8000)); /* retain sign bit */
						return;
					} 
					else 
					{
						/* significand is not 0, so value is NaN */
						/* value becomes 0.0, and prNaN code is returned */
						/* sign bit is ignored (no negative NaN) */
						WD2 = WD1 = WD0 = 0x0000;
						/* sign bit is ignored ( -NaN -> +NaN ) */
						return;
					}
				}

				/* round significand if necessary */
				if ((W0 & 0x1000) == 0x1000) 
				{
					/* significand's 40th bit set, so round significand up */
					if ((W0 & 0xE000) != 0xE000)
						/* room to increment 3 most significant bits */
						W0 += 0x2000;
					else 
					{
						/* carry bit to next element */
						W0 = 0x0000;
						/* carry from 0th to 1st element */
						if (W1 != 0xFFFF)
							W1++;
						else 
						{
							W1 = 0x0000;
							/* carry from 1st to 2nd element */
							if (W2 != 0xFFFF)
								W2++;
							else 
							{
								W2 = 0x0000;
								/* carry from 2nd to 3rd element */
								/* significand may overflow into exponent */
								/* exponent not full, so won't overflow */
								W3++;
							}
						}
					}
				}

				/* get exponent for underflow/overflow tests */
				ushort x = (ushort)((W3 & 0x7FF0) >> 4);

				/* test for underflow */
				if (x < 895) 
				{
					/* value is below real range */
					WD2 = WD1 = WD0 = 0x0000;
					if ((W3 & 0x8000) == 0x8000)
						/* sign bit was set, so value was negative */
						throw new Exception("negative overflow"); //. =>
					else
						/* sign bit was not set */
						throw new Exception("positive overflow"); //. =>
				}

				/* test for overflow */
				if (x > 1149) 
				{
					/* value is above real range */
					WD1 = WD0 = 0xFFFF;
					WD2 = (ushort)(0x7FFF | (W3 & 0x8000)); /* retain sign bit */
					return ; // prOverflow;
				}

				/* value is within real range */
				WD0 = (ushort)
					((x - 894) |  /* re-bias exponent */
					((W0 & 0xE000) >> 5) |  /* begin significand */
					(W1 << 11));
				WD1 = (ushort)((W1 >> 5) | (W2 << 11));
				WD2 = (ushort)((W2 >> 5) | ((W3 & 0x000F) << 11) | (W3 & 0x8000));  /* copy sign bit */
				return ;
			}
		}

		public byte[] AsByteArray()
		{
			byte[] BA = new byte[6];
			byte[] BWD0 = BitConverter.GetBytes(WD0);
			byte[] BWD1 = BitConverter.GetBytes(WD1);
			byte[] BWD2 = BitConverter.GetBytes(WD2);
			BA[0] = BWD0[0]; BA[1] = BWD0[1];
			BA[2] = BWD1[0]; BA[3] = BWD1[1];
			BA[4] = BWD2[0]; BA[5] = BWD2[1];
			return BA;
		}
	}

	public struct TPoint
	{
		public TPtr ptrNextObj;
		public TCrd X;
		public TCrd Y;

		public TPoint(byte[] BA, ref int Idx)
		{
			ptrNextObj = BitConverter.ToInt32(BA,Idx); Idx +=4;
			X = new TCrd(ref BA, ref Idx);
			Y = new TCrd(ref BA, ref Idx);
		}

		public TPoint(ushort val)
		{
			ptrNextObj = Defines.nilPtr;
			X = new TCrd(val);
			Y = new TCrd(val);
		}

		public void Set(byte[] BA, ref int Idx)
		{
			ptrNextObj = BitConverter.ToInt32(BA,Idx); Idx +=4;
			X.Set(BA, ref Idx);
			Y.Set(BA, ref Idx);
		}

	}

	public struct TContainerCoord 
	{
		public double Xmin;
		public double Ymin;
		public double Xmax;
		public double Ymax;
	
		public bool IsObjectOutside(TContainerCoord Obj_ContainerCoord)
		{
			return (((Obj_ContainerCoord.Xmax < Xmin) || (Obj_ContainerCoord.Xmin > Xmax) || (Obj_ContainerCoord.Ymax < Ymin) || (Obj_ContainerCoord.Ymin > Ymax)));
		}
	}

	public class TReflectorConfiguration
	{
		public const string ConfigurationFileName = "Configuration.xml";
		public const string InvisibleLaysFileName = "InvisibleLays.txt";

		private TReflector Reflector;
		//.
		public string SpaceServerURL = "http://127.0.0.1";
		public string UserName = "Anonymous";
		public string UserPassword = "ra3tkq";
		public bool Communication_flUseProxy = false;
		public string Communication_ProxyAddress = "";
		public string Communication_ProxyUserName = "";
		public string Communication_ProxyUserPassword = "";
		public byte[] InvesibleLays;
		//. reflection window config
		public TReflectionWindowStruc ReflectionWindow = new TReflectionWindowStruc(-100,100,100,100,100,-100,-100,-100,0,0,320,240);
		//.
		public bool Monitoring_flEnabled = false;
		public int Monitoring_idTVisualization = 0;
		public int Monitoring_idVisualization = 0;
		public string Monitoring_VisualizationName = "?";

		public TReflectorConfiguration(TReflector pReflector)
		{
			Reflector = pReflector;
			Open();
		}

		public void Destroy()
		{
			Save();
		}

		public void Open()
		{
			string CFN = TReflector.ProfileFolder+"/"+ConfigurationFileName;
			if (!File.Exists(CFN))
				return; //. ->
			XmlDocument DataDoc = new XmlDocument();
			DataDoc.Load(CFN);
			XmlNode RootNode = DataDoc.SelectSingleNode("ROOT");
			XmlNode Node;
			XmlNode SubNode;
			Node = RootNode.SelectSingleNode("Communication");
			if (Node != null)
			{
				SubNode = Node.SelectSingleNode("UseProxy");
				if (SubNode != null)
					Communication_flUseProxy = Convert.ToBoolean(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("ProxyAddress");
				if (SubNode != null)
					Communication_ProxyAddress = SubNode.InnerText;
				SubNode = Node.SelectSingleNode("ProxyUserName");
				if (SubNode != null)
					Communication_ProxyUserName = SubNode.InnerText;
				SubNode = Node.SelectSingleNode("ProxyUserPassword");
				if (SubNode != null)
					Communication_ProxyUserPassword = SubNode.InnerText;
			};
			Node = RootNode.SelectSingleNode("SpaceServerURL");
			if (Node != null)
				SpaceServerURL = Node.InnerText;
			Node = RootNode.SelectSingleNode("UserName");
			if (Node != null)
				UserName = Node.InnerText;
			Node = RootNode.SelectSingleNode("UserPassword");
			if (Node != null)
				UserPassword = Node.InnerText;
			Node = RootNode.SelectSingleNode("ReflectionWindow");
			SubNode = Node.SelectSingleNode("X0");
			if (SubNode != null)
				ReflectionWindow.X0 = Convert.ToDouble(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("Y0");
			if (SubNode != null)
				ReflectionWindow.Y0 = Convert.ToDouble(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("X1");
			if (SubNode != null)
				ReflectionWindow.X1 = Convert.ToDouble(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("Y1");
			if (SubNode != null)
				ReflectionWindow.Y1 = Convert.ToDouble(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("X2");
			if (SubNode != null)
				ReflectionWindow.X2 = Convert.ToDouble(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("Y2");
			if (SubNode != null)
				ReflectionWindow.Y2 = Convert.ToDouble(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("X3");
			if (SubNode != null)
				ReflectionWindow.X3 = Convert.ToDouble(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("Y3");
			if (SubNode != null)
				ReflectionWindow.Y3 = Convert.ToDouble(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("Xmn");
			if (SubNode != null)
				ReflectionWindow.Xmn = Convert.ToInt32(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("Ymn");
			if (SubNode != null)
				ReflectionWindow.Ymn = Convert.ToInt32(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("Xmx");
			if (SubNode != null)
				ReflectionWindow.Xmx = Convert.ToInt32(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("Ymx");
			if (SubNode != null)
				ReflectionWindow.Ymx = Convert.ToInt32(SubNode.InnerText);
			Node = RootNode.SelectSingleNode("Monitoring");
			SubNode = Node.SelectSingleNode("Enabled");
			if (SubNode != null)
				Monitoring_flEnabled = Convert.ToBoolean(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("idTVisualization");
			if (SubNode != null)
				Monitoring_idTVisualization = Convert.ToInt32(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("idVisualization");
			if (SubNode != null)
				Monitoring_idVisualization = Convert.ToInt32(SubNode.InnerText);
			SubNode = Node.SelectSingleNode("VisualizationName");
			if (SubNode != null)
				Monitoring_VisualizationName = SubNode.InnerText;
			//.
			string ILFN = TReflector.ProfileFolder+"/"+InvisibleLaysFileName;
			if (!File.Exists(ILFN))
				return; //. ->
			TextReader TR = new StreamReader(ILFN);
			try
			{
				ArrayList List = new ArrayList();
				while (true)
				{
					string S = TR.ReadLine();
					if (S == null) 
						break; //. >
					if (S != "") 
						List.Add(S);
				};
				InvesibleLays = new byte[2/*SizeOf(LaysCount)*/+List.Count*2/*SizeOf(LayID)*/];
				int Idx = 0;
				byte[] BA = BitConverter.GetBytes((UInt16)List.Count);
				BA.CopyTo(InvesibleLays,Idx); Idx+=2;
				for (int I = 0; I < List.Count; I++)
				{
					UInt16 LayID = Convert.ToUInt16((string)List[I]);
					BA = BitConverter.GetBytes(LayID);
					BA.CopyTo(InvesibleLays,Idx); Idx+=2;
				};
			}
			finally
			{
				TR.Close();
			};
		}

		public void Save()
		{
			UpdateByReflector();
			//.
			XmlTextWriter writer = new XmlTextWriter(TReflector.ProfileFolder+"/"+ConfigurationFileName, System.Text.Encoding.UTF8);
			try
			{
				writer.WriteStartDocument();
				writer.WriteStartElement("ROOT");
				//. 
				writer.WriteStartElement("Communication");
				//.
				writer.WriteStartElement("UseProxy");
				writer.WriteString(Communication_flUseProxy.ToString());
				writer.WriteEndElement();
				//.
				writer.WriteStartElement("ProxyAddress");
				writer.WriteString(Communication_ProxyAddress);
				writer.WriteEndElement();
				//.
				writer.WriteStartElement("ProxyUserName");
				writer.WriteString(Communication_ProxyUserName);
				writer.WriteEndElement();
				//.
				writer.WriteStartElement("ProxyUserPassword");
				writer.WriteString(Communication_ProxyUserPassword);
				writer.WriteEndElement();
				//.
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("SpaceServerURL");
				writer.WriteString(SpaceServerURL);
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("UserName");
				writer.WriteString(UserName);
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("UserPassword");
				writer.WriteString(UserPassword);
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("ReflectionWindow");
				//. 
				TReflectionWindowStruc RW;
				Reflector.ReflectionWindow.GetWindow(true, out RW);
				writer.WriteStartElement("X0");
				writer.WriteString(RW.X0.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("Y0");
				writer.WriteString(RW.Y0.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("X1");
				writer.WriteString(RW.X1.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("Y1");
				writer.WriteString(RW.Y1.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("X2");
				writer.WriteString(RW.X2.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("Y2");
				writer.WriteString(RW.Y2.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("X3");
				writer.WriteString(RW.X3.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("Y3");
				writer.WriteString(RW.Y3.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("Xmn");
				writer.WriteString(RW.Xmn.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("Ymn");
				writer.WriteString(RW.Ymn.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("Xmx");
				writer.WriteString(RW.Xmx.ToString());
				writer.WriteEndElement();
				//. 
				writer.WriteStartElement("Ymx");
				writer.WriteString(RW.Ymx.ToString());
				writer.WriteEndElement();
				//.
				writer.WriteEndElement();
				//.
				writer.WriteStartElement("Monitoring");
				//.
				writer.WriteStartElement("Enabled");
				writer.WriteString(Monitoring_flEnabled.ToString());
				writer.WriteEndElement();
				//.
				writer.WriteStartElement("idTVisualization");
				writer.WriteString(Monitoring_idTVisualization.ToString());
				writer.WriteEndElement();
				//.
				writer.WriteStartElement("idVisualization");
				writer.WriteString(Monitoring_idVisualization.ToString());
				writer.WriteEndElement();
				//.
				writer.WriteStartElement("VisualizationName");
				writer.WriteString(Monitoring_VisualizationName);
				writer.WriteEndElement();
				//. 
				writer.WriteEndElement();
				writer.WriteEndDocument();
			}
			finally 
			{
				writer.Close();
			};
		}
	
		public void UpdateByReflector()
		{
		}
	}

	public struct TReflectionWindowStruc 
	{
		public double X0;
		public double Y0;
		public double X1;
		public double Y1;
		public double X2;
		public double Y2;
		public double X3;
		public double Y3;

		public int Xmn;
		public int Ymn;
		public int Xmx;
		public int Ymx;

		public TReflectionWindowStruc(double pX0, double pY0, double pX1, double pY1, double pX2, double pY2, double pX3, double pY3, int pXmn, int pYmn, int pXmx, int pYmx)
		{
			X0 = pX0; Y0 = pY0;
			X1 = pX1; Y1 = pY1;
			X2 = pX2; Y2 = pY2;
			X3 = pX3; Y3 = pY3;
			Xmn = pXmn; Ymn = pYmn;
			Xmx = pXmx; Ymx = pYmx;
		}

		public bool IsEqualTo(TReflectionWindowStruc RW)
		{
			return ((X0 == RW.X0) && (Y0 == RW.Y0) && (X1 == RW.X1) && (Y1 == RW.Y1) && (X2 == RW.X2) && (Y2 == RW.Y2) && (X3 == RW.X3) && (Y3 == RW.Y3) && (Xmn == RW.Xmn) && (Ymn == RW.Ymn) && (Xmx == RW.Xmx) && (Ymx == RW.Ymx));
		}

		public byte[] ToByteArray()
		{
			byte[] Result = new byte[8*8+4*4];
			int Idx = 0;
			byte[] BA;
			//.
			BA = BitConverter.GetBytes(X0); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=8;
			BA = BitConverter.GetBytes(Y0); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=8;
			BA = BitConverter.GetBytes(X1); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=8;
			BA = BitConverter.GetBytes(Y1); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=8;
			BA = BitConverter.GetBytes(X2); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=8;
			BA = BitConverter.GetBytes(Y2); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=8;
			BA = BitConverter.GetBytes(X3); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=8;
			BA = BitConverter.GetBytes(Y3); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=8;
			//.
			BA = BitConverter.GetBytes(Xmn); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=4;
			BA = BitConverter.GetBytes(Ymn); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=4;
			BA = BitConverter.GetBytes(Xmx); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=4;
			BA = BitConverter.GetBytes(Ymx); Array.Copy(BA,0,Result,Idx,BA.Length); Idx+=4;
			return Result;
		}

		public void FromByteArray(byte[] BA, ref int Idx)
		{
			X0 = BitConverter.ToDouble(BA,Idx); Idx+=8;
			Y0 = BitConverter.ToDouble(BA,Idx); Idx+=8;
			X1 = BitConverter.ToDouble(BA,Idx); Idx+=8;
			Y1 = BitConverter.ToDouble(BA,Idx); Idx+=8;
			X2 = BitConverter.ToDouble(BA,Idx); Idx+=8;
			Y2 = BitConverter.ToDouble(BA,Idx); Idx+=8;
			X3 = BitConverter.ToDouble(BA,Idx); Idx+=8;
			Y3 = BitConverter.ToDouble(BA,Idx); Idx+=8;
			Xmn = BitConverter.ToInt32(BA,Idx); Idx+=4;
			Ymn = BitConverter.ToInt32(BA,Idx); Idx+=4;
			Xmx = BitConverter.ToInt32(BA,Idx); Idx+=4;
			Ymx = BitConverter.ToInt32(BA,Idx); Idx+=4;
		}
	}

	public class TReflectionWindow
	{
		public double X0;
		public double Y0;
		public double X1;
		public double Y1;
		public double X2;
		public double Y2;
		public double X3;
		public double Y3;
		public double Xcenter;
		public double Ycenter;
		public double HorRange;
		public double VertRange;

		public int Xmn;
		public int Ymn;
		public int Xmx;
		public int Ymx;
		public int Xmd;
		public int Ymd;

		public TContainerCoord ContainerCoord;

		public TReflectionWindow(TReflectionWindowStruc pReflectionWindowStruc)
		{
			X0 = pReflectionWindowStruc.X0*Defines.cfTransMeter;
			Y0 = pReflectionWindowStruc.Y0*Defines.cfTransMeter;
			X1 = pReflectionWindowStruc.X1*Defines.cfTransMeter;
			Y1 = pReflectionWindowStruc.Y1*Defines.cfTransMeter;
			X2 = pReflectionWindowStruc.X2*Defines.cfTransMeter;
			Y2 = pReflectionWindowStruc.Y2*Defines.cfTransMeter;
			X3 = pReflectionWindowStruc.X3*Defines.cfTransMeter;
			Y3 = pReflectionWindowStruc.Y3*Defines.cfTransMeter;
			Xmn = pReflectionWindowStruc.Xmn;
			Ymn = pReflectionWindowStruc.Ymn;
			Xmx = pReflectionWindowStruc.Xmx;
			Ymx = pReflectionWindowStruc.Ymx;
			Update();
		}

		public void Update()
		{
			Xcenter = (X0+X2)/2;
			Ycenter = (Y0+Y2)/2;
			Xmd = (int)Math.Round((double)((Xmx+Xmn)/2));
			Ymd = (int)Math.Round((double)((Ymx+Ymn)/2));
			HorRange = Math.Sqrt(Math.Pow((X1-X0),2)+Math.Pow((Y1-Y0),2));
			VertRange = Math.Sqrt(Math.Pow((X3-X0),2)+Math.Pow((Y3-Y0),2));
			GetMaxMin(out ContainerCoord.Xmin,out ContainerCoord.Ymin,out ContainerCoord.Xmax,out ContainerCoord.Ymax);
		}

		public void Assign(TReflectionWindow Srs)
		{
			X0 = Srs.X0; Y0 = Srs.Y0;
			X1 = Srs.X1; Y1 = Srs.Y1;
			X2 = Srs.X2; Y2 = Srs.Y2;
			X3 = Srs.X3; Y3 = Srs.Y3;
			Xcenter = Srs.Xcenter; Ycenter = Srs.Ycenter;
			Xmn = Srs.Xmn; Ymn = Srs.Ymn;
			Xmx = Srs.Xmx; Ymx = Srs.Ymx;
			Xmd = Srs.Xmd; Ymd = Srs.Ymd;
			HorRange = Srs.HorRange;
			VertRange = Srs.VertRange;
			ContainerCoord = Srs.ContainerCoord;
		}

		public virtual double Scale()
		{
			return ((Xmx-Xmn)/(Math.Sqrt(Math.Pow((X1-X0),2)+Math.Pow((Y1-Y0),2))/Defines.cfTransMeter));
		}

		public void GetWindow(bool flReal, out TReflectionWindowStruc vReflectionWindowStruc)
		{
			if (flReal) 
			{
				vReflectionWindowStruc.X0 = X0/Defines.cfTransMeter; vReflectionWindowStruc.Y0 = Y0/Defines.cfTransMeter;
				vReflectionWindowStruc.X1 = X1/Defines.cfTransMeter; vReflectionWindowStruc.Y1 = Y1/Defines.cfTransMeter;
				vReflectionWindowStruc.X2 = X2/Defines.cfTransMeter; vReflectionWindowStruc.Y2 = Y2/Defines.cfTransMeter;
				vReflectionWindowStruc.X3 = X3/Defines.cfTransMeter; vReflectionWindowStruc.Y3 = Y3/Defines.cfTransMeter;
			}
			else
			{
				vReflectionWindowStruc.X0 = X0; vReflectionWindowStruc.Y0 = Y0;
				vReflectionWindowStruc.X1 = X1; vReflectionWindowStruc.Y1 = Y1;
				vReflectionWindowStruc.X2 = X2; vReflectionWindowStruc.Y2 = Y2;
				vReflectionWindowStruc.X3 = X3; vReflectionWindowStruc.Y3 = Y3;
			};
			vReflectionWindowStruc.Xmn = Xmn; vReflectionWindowStruc.Ymn = Ymn;
			vReflectionWindowStruc.Xmx = Xmx; vReflectionWindowStruc.Ymx = Ymx;
		}

		public void GetMaxMin(out double Xmin, out double Ymin, out double Xmax, out double Ymax)
		{
			Xmin = X0;
			Ymin = Y0;
			Xmax = X0;
			Ymax = Y0;
			if (X1 < Xmin) Xmin = X1; else if (X1 > Xmax) Xmax = X1;
			if (Y1 < Ymin) Ymin = Y1; else if (Y1 > Ymax) Ymax = Y1;
			if (X2 < Xmin) Xmin = X2; else if (X2 > Xmax) Xmax = X2;
			if (Y2 < Ymin) Ymin = Y2; else if (Y2 > Ymax) Ymax = Y2;
			if (X3 < Xmin) Xmin = X3; else if (X3 > Xmax) Xmax = X3;
			if (Y3 < Ymin) Ymin = Y3; else if (Y3 > Ymax) Ymax = Y3;
			Xmin = Xmin/Defines.cfTransMeter;
			Ymin = Ymin/Defines.cfTransMeter;
			Xmax = Xmax/Defines.cfTransMeter;
			Ymax = Ymax/Defines.cfTransMeter;
		}

		public void Normalize()
		{
			double diffX1X0;
			double diffY1Y0;
			double b;
			double V;
			double S0_X3;
			double S0_Y3;
			double S1_X3;
			double S1_Y3;
			double S0_X2;
			double S0_Y2;
			double S1_X2;
			double S1_Y2;

			diffX1X0 = X1-X0;
			diffY1Y0 = Y1-Y0;
			b = Math.Sqrt(Math.Pow(diffX1X0,2)+Math.Pow(diffY1Y0,2))*(Ymx-Ymn)/(Xmx-Xmn);
			if (Math.Abs(diffY1Y0) > Math.Abs(diffX1X0))
			{
				V = b/Math.Sqrt(1+Math.Pow((diffX1X0/diffY1Y0),2));
				S0_X3 = (V)+X0;
				S0_Y3 = (-V)*(diffX1X0/diffY1Y0)+Y0;
				S1_X3 = (-V)+X0;
				S1_Y3 = (V)*(diffX1X0/diffY1Y0)+Y0;

				S0_X2 = (V)+X1;
				S0_Y2 = (-V)*(diffX1X0/diffY1Y0)+Y1;
				S1_X2 = (-V)+X1;
				S1_Y2 = (V)*(diffX1X0/diffY1Y0)+Y1;
			}
			else 
			{
				V = b/Math.Sqrt(1+Math.Pow((diffY1Y0/diffX1X0),2));
				S0_Y3 = (V)+Y0;
				S0_X3 = (-V)*(diffY1Y0/diffX1X0)+X0;
				S1_Y3 = (-V)+Y0;
				S1_X3 = (V)*(diffY1Y0/diffX1X0)+X0;

				S0_Y2 = (V)+Y1;
				S0_X2 = (-V)*(diffY1Y0/diffX1X0)+X1;
				S1_Y2 = (-V)+Y1;
				S1_X2 = (V)*(diffY1Y0/diffX1X0)+X1;
			};
			if (Math.Sqrt(Math.Pow((X3-S0_X3),2)+Math.Pow((Y3-S0_Y3),2)) < Math.Sqrt(Math.Pow((X3-S1_X3),2)+Math.Pow((Y3-S1_Y3),2)))
			{
				X3 = S0_X3;
				Y3 = S0_Y3;
			}
			else
			{
				X3 = S1_X3;
				Y3 = S1_Y3;
			};
			if (Math.Sqrt(Math.Pow((X2-S0_X2),2)+Math.Pow((Y2-S0_Y2),2)) < Math.Sqrt(Math.Pow((X2-S1_X2),2)+Math.Pow((Y2-S1_Y2),2)))
			{
				X2 = S0_X2;
				Y2 = S0_Y2;
			}
			else 
			{
				X2 = S1_X2;
				Y2 = S1_Y2;
			};
			Update();
		}
	}

	public enum TNavigationType {None,Moving,Scaling,Rotating};

	public struct TNavigationItem
	{
		public TNavigationType Type;
		public double dX;
		public double dY;
	}

	public class TNavigations
	{
		private TReflector Reflector;
		private TReflectionWindow Reflector_LastReflectionWindow;
		public ArrayList Items;
		public int ReflectionID = -1;

		public TNavigations(TReflector pReflector)
		{
			Reflector = pReflector;
			Items = new ArrayList();
		}

		public void AddItem(int pReflectionID, Bitmap pReflectionBMP, TNavigationType pNavigationType, double dX, double dY)
		{
			TNavigationItem NewItem;
			NewItem.Type = pNavigationType;
			NewItem.dX = dX;
			NewItem.dY = dY;
			if (pReflectionID != ReflectionID)
			{
				TReflectionWindowStruc RW;
				Reflector.ReflectionWindow.GetWindow(true, out RW);
				Reflector_LastReflectionWindow = new TReflectionWindow(RW);
				Clear();
				Items.Add(NewItem);
				ReflectionID = pReflectionID;
			}
			else
			{
				Items.Add(NewItem);
			};
		}

		public void Clear()
		{
			Items.Clear();
			ReflectionID = -1;
		}

		public void RestoreReflectionWindow()
		{
			if (ReflectionID != -1)
			{
				Clear();
				Reflector.ReflectionWindow = Reflector_LastReflectionWindow;
			}
		}

		public void Transform(Graphics g)
		{
			for (int I = Items.Count-1; I >= 0; I--)
			{
				switch (((TNavigationItem)(Items[I])).Type)
				{
					case TNavigationType.Moving:
					{
						g.TranslateTransform((float)((TNavigationItem)Items[I]).dX,(float)((TNavigationItem)Items[I]).dY);
						break; //. ->
					};

					case TNavigationType.Scaling:
					{
						g.TranslateTransform((float)Reflector.ReflectionWindow.Xmd,Reflector.ReflectionWindow.Ymd);
						g.ScaleTransform((float)((TNavigationItem)Items[I]).dY,(float)((TNavigationItem)Items[I]).dY);
						g.TranslateTransform(-Reflector.ReflectionWindow.Xmd,-Reflector.ReflectionWindow.Ymd);
						break; //. ->
					};

					case TNavigationType.Rotating:
					{
						g.TranslateTransform(Reflector.ReflectionWindow.Xmd,Reflector.ReflectionWindow.Ymd);
						g.RotateTransform((float)(-((TNavigationItem)Items[I]).dY*180.0/Math.PI));
						g.TranslateTransform(-Reflector.ReflectionWindow.Xmd,-Reflector.ReflectionWindow.Ymd);
						break; //. ->
					};
				};
			};
		}
	}

	public class TElectedPlace
	{
		public string Name;
		public TReflectionWindowStruc ReflectionWindow;
	}

	public class TElectedPlaces
	{
		public const string ElectedPlacesFileName = "ElectedPlaces.xml";


		public TReflector Reflector;
		public ArrayList Items = new ArrayList();
		
		public TElectedPlaces(TReflector pReflector)
		{
			Reflector = pReflector;
			Open();
		}

		public void Open()
		{
			string FN = TReflector.ProfileFolder+"/"+ElectedPlacesFileName;
			if (!File.Exists(FN))
				return; //. ->
			XmlDocument DataDoc = new XmlDocument();
			DataDoc.Load(FN);
			XmlNode RootNode = DataDoc.SelectSingleNode("ROOT");
			XmlNode ItemsNode = RootNode.SelectSingleNode("Items");
			for (int I = 0; I < ItemsNode.ChildNodes.Count; I++)
			{
				XmlNode ItemNode = ItemsNode.ChildNodes[I];
				TElectedPlace NewItem = new TElectedPlace();
				XmlNode Node = ItemNode.SelectSingleNode("Name");
				NewItem.Name = Node.InnerText;
				Node = ItemNode.SelectSingleNode("ReflectionWindow");
				XmlNode SubNode = Node.SelectSingleNode("X0");
				NewItem.ReflectionWindow.X0 = Convert.ToDouble(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("Y0");
				NewItem.ReflectionWindow.Y0 = Convert.ToDouble(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("X1");
				NewItem.ReflectionWindow.X1 = Convert.ToDouble(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("Y1");
				NewItem.ReflectionWindow.Y1 = Convert.ToDouble(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("X2");
				NewItem.ReflectionWindow.X2 = Convert.ToDouble(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("Y2");
				NewItem.ReflectionWindow.Y2 = Convert.ToDouble(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("X3");
				NewItem.ReflectionWindow.X3 = Convert.ToDouble(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("Y3");
				NewItem.ReflectionWindow.Y3 = Convert.ToDouble(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("Xmn");
				NewItem.ReflectionWindow.Xmn = Convert.ToInt32(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("Ymn");
				NewItem.ReflectionWindow.Ymn = Convert.ToInt32(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("Xmx");
				NewItem.ReflectionWindow.Xmx = Convert.ToInt32(SubNode.InnerText);
				SubNode = Node.SelectSingleNode("Ymx");
				//.
				Items.Add(NewItem);
			};
		}

		public void Save()
		{
			XmlTextWriter writer = new XmlTextWriter(TReflector.ProfileFolder+"/"+ElectedPlacesFileName, System.Text.Encoding.UTF8);
			try
			{
				writer.WriteStartDocument();
				writer.WriteStartElement("ROOT");
				//. 
				writer.WriteStartElement("Items");
				for (int I = 0; I < Items.Count; I++)
				{
					writer.WriteStartElement("Item");
					//.
					writer.WriteStartElement("Name");
					writer.WriteString(((TElectedPlace)Items[I]).Name);
					writer.WriteEndElement();
					//.
					writer.WriteStartElement("ReflectionWindow");
					//. 
					writer.WriteStartElement("X0");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.X0.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("Y0");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.Y0.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("X1");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.X1.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("Y1");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.Y1.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("X2");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.X2.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("Y2");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.Y2.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("X3");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.X3.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("Y3");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.Y3.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("Xmn");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.Xmn.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("Ymn");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.Ymn.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("Xmx");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.Xmx.ToString());
					writer.WriteEndElement();
					//. 
					writer.WriteStartElement("Ymx");
					writer.WriteString(((TElectedPlace)Items[I]).ReflectionWindow.Ymx.ToString());
					writer.WriteEndElement();
					//.
					writer.WriteEndElement();
					writer.WriteEndElement();
				};
				writer.WriteEndElement();
				//. 
				writer.WriteEndElement();
				writer.WriteEndDocument();
			}
			finally 
			{
				writer.Close();
			};
		}

		public void RemoveItem(int Idx)
		{
			Items.RemoveAt(Idx);
			Save();
		}

		public void AddItem(string pName, TReflectionWindowStruc pReflectionWindow)
		{
			TElectedPlace NewItem = new TElectedPlace();
			NewItem.Name = pName;
			NewItem.ReflectionWindow = pReflectionWindow;
			Items.Add(NewItem);
			Save();
		}
		public bool PanelDialog(out TElectedPlace ElectedPlace)
		{
			TfmElectedPlacesPanel Panel = new TfmElectedPlacesPanel(this);
			try
			{
				return Panel.Dialog(out ElectedPlace);
			}
			finally
			{
				Panel.Dispose();
			};		
		}
	}

	public class TElectedVisualization
	{
		public string Name;
		public int idTVisualization;
		public int idVisualization;
	}

	public class TElectedVisualizations
	{
		public const string ElectedVisualizationsFileName = "ElectedVisualizations.xml";


		public TReflector Reflector;
		public ArrayList Items = new ArrayList();
		
		public TElectedVisualizations(TReflector pReflector)
		{
			Reflector = pReflector;
			Open();
		}

		public void Open()
		{
			string FN = TReflector.ProfileFolder+"/"+ElectedVisualizationsFileName;
			if (!File.Exists(FN))
				return; //. ->
			XmlDocument DataDoc = new XmlDocument();
			DataDoc.Load(FN);
			XmlNode RootNode = DataDoc.SelectSingleNode("ROOT");
			XmlNode ItemsNode = RootNode.SelectSingleNode("Items");
			for (int I = 0; I < ItemsNode.ChildNodes.Count; I++)
			{
				XmlNode ItemNode = ItemsNode.ChildNodes[I];
				TElectedVisualization NewItem = new TElectedVisualization();
				XmlNode Node = ItemNode.SelectSingleNode("Name");
				NewItem.Name = Node.InnerText;
				Node = ItemNode.SelectSingleNode("idTVisualization");
				NewItem.idTVisualization = Convert.ToInt32(Node.InnerText);
				Node = ItemNode.SelectSingleNode("idVisualization");
				NewItem.idVisualization = Convert.ToInt32(Node.InnerText);
				//.
				Items.Add(NewItem);
			};
		}

		public void Save()
		{
			XmlTextWriter writer = new XmlTextWriter(TReflector.ProfileFolder+"/"+ElectedVisualizationsFileName, System.Text.Encoding.UTF8);
			try
			{
				writer.WriteStartDocument();
				writer.WriteStartElement("ROOT");
				//. 
				writer.WriteStartElement("Items");
				for (int I = 0; I < Items.Count; I++)
				{
					writer.WriteStartElement("Item");
					//.
					writer.WriteStartElement("Name");
					writer.WriteString(((TElectedVisualization)Items[I]).Name);
					writer.WriteEndElement();
					//.
					writer.WriteStartElement("idTVisualization");
					writer.WriteString(((TElectedVisualization)Items[I]).idTVisualization.ToString());
					writer.WriteEndElement();
					//.
					writer.WriteStartElement("idVisualization");
					writer.WriteString(((TElectedVisualization)Items[I]).idVisualization.ToString());
					writer.WriteEndElement();
					//.
					writer.WriteEndElement();
				};
				writer.WriteEndElement();
				//. 
				writer.WriteEndElement();
				writer.WriteEndDocument();
			}
			finally 
			{
				writer.Close();
			};
		}

		public void RemoveItem(int Idx)
		{
			Items.RemoveAt(Idx);
			Save();
		}

		public void AddItem(string pName, int pidTVisualization, int pidVisualization)
		{
			TElectedVisualization NewItem = new TElectedVisualization();
			NewItem.Name = pName;
			NewItem.idTVisualization = pidTVisualization;
			NewItem.idVisualization = pidVisualization;
			Items.Add(NewItem);
			Save();
		}
		public bool PanelDialog(out TElectedVisualization ElectedVisualization)
		{
			TfmElectedVisualizationsPanel Panel = new TfmElectedVisualizationsPanel(this);
			try
			{
				return Panel.Dialog(out ElectedVisualization);
			}
			finally
			{
				Panel.Dispose();
			};		
		}
	}

	public class THistoryItem
	{
		public int Index = -1;
		public TReflectionWindowStruc ReflectionWindow;
		public MemoryStream BitmapData;

		public THistoryItem(TReflectionWindowStruc pReflectionWindow, byte[] pBitmapData)
		{
			ReflectionWindow = pReflectionWindow;
			BitmapData = new MemoryStream();
			BitmapData.Write(pBitmapData,0,pBitmapData.Length);
		}

		public void Destroy()
		{
			if (BitmapData != null)
			{
				BitmapData.Close();
				BitmapData = null;
			};
		}

		public THistoryItem(string ItemFileName)
		{
			string HistoryFolder = TReflector.ProfileFolder+"/"+THistory.HistoryFolderName;
			if (!Directory.Exists(HistoryFolder))
				throw new Exception("History folder does not exist"); //. =>
			FileStream FS = new FileStream(HistoryFolder+"/"+ItemFileName,FileMode.Open);
			try
			{
				FromStream(FS);
			}
			finally
			{
				FS.Close();
			};
		}

		public void ToStream(Stream S)
		{
			UInt16 Version = 0;
			byte[] BA = BitConverter.GetBytes(Version);
			byte[] RWBA = ReflectionWindow.ToByteArray();
			byte[] BDBA = BitmapData.ToArray();	
			S.Position = 0;
			S.Write(BA,0,BA.Length);
			S.Write(RWBA,0,RWBA.Length);
			S.Write(BDBA,0,BDBA.Length);
		}

		public void FromStream(Stream S)
		{
			int Idx = 0;
			byte[] BA = new byte[S.Length-S.Position];
			S.Read(BA,0,BA.Length);
			UInt16 Version = BitConverter.ToUInt16(BA, Idx); Idx+=2;
			if (Version != 0) 
				throw new Exception("unknown version"); //. =>
			ReflectionWindow.FromByteArray(BA, ref Idx);
			if (BitmapData != null)
				BitmapData.Close();
			BitmapData = new MemoryStream();
			BitmapData.Write(BA,Idx,BA.Length-Idx);
		}
	}

	public class THistory
	{
		public const string HistoryFolderName = "History";
		public const int MaxHistoryItems = 100;

		public static Bitmap MakeGrayscaleBitmap(Bitmap original)
		{
			//create a blank bitmap the same size as original
			Bitmap newBitmap = 
				new Bitmap(original.Width, original.Height);
   
			//get a graphics object from the new image
			Graphics g = Graphics.FromImage(newBitmap);
			try
			{
				//create the grayscale ColorMatrix
				ColorMatrix colorMatrix = new ColorMatrix(
					new float[][] 
				{
					new float[] {.3f, .3f, .3f, 0, 0},
					new float[] {.59f, .59f, .59f, 0, 0},
					new float[] {.11f, .11f, .11f, 0, 0},
					new float[] {0, 0, 0, 1, 0},
					new float[] {0, 0, 0, 0, 1}
				});

				//create some image attributes
				ImageAttributes attributes = new ImageAttributes();

				//set the color matrix attribute
				attributes.SetColorMatrix(colorMatrix);

				//draw the original image on the new image
				//using the grayscale color matrix
				g.DrawImage(original,
					new Rectangle(0, 0, original.Width, original.Height),
					0, 0, original.Width, original.Height,
					GraphicsUnit.Pixel, attributes);
			}
			finally
			{
				g.Dispose();
			}
			return newBitmap;
		}

		public TReflector Reflector;
		private TfmHistoryPanel Panel = null;

		public THistory(TReflector pReflector)
		{
			Reflector = pReflector;
		}

		public void Destroy()
		{
			if (Panel != null)
			{
				Panel.Dispose();
				Panel = null;
			};
		}

		public void AddNew(TReflectionWindowStruc pReflectionWindow, byte[] pBitmapData)
		{
			THistoryItem LastItem;
			if (GetHistoryItem(0, out LastItem))
			{
				if (LastItem.ReflectionWindow.IsEqualTo(pReflectionWindow) && (LastItem.BitmapData.Length == pBitmapData.Length))
					return ; //. ->
			};
			string HistoryFolder = TReflector.ProfileFolder+"/"+HistoryFolderName;
			if (!Directory.Exists(HistoryFolder))
				Directory.CreateDirectory(HistoryFolder);
			THistoryItem NewItem = new THistoryItem(pReflectionWindow,pBitmapData);
			try
			{
				string FN = HistoryFolder+"/"+DateTime.Now.ToOADate().ToString();
				FileStream FS = new FileStream(FN,FileMode.Create);
				try
				{
					NewItem.ToStream(FS);
				}
				finally
				{
					FS.Close();
				};
			}
			finally
			{
				NewItem.Destroy();
			};
			RemoveOldItems();
			//.
			if (Panel != null)
				Panel.UpdatePanel();
		}

		public void RemoveOldItems()
		{
			string HistoryFolder = TReflector.ProfileFolder+"/"+HistoryFolderName;
			if (!Directory.Exists(HistoryFolder))
				return ; //. ->
			string[] Items = Directory.GetFiles(HistoryFolder);
			if (Items.Length > MaxHistoryItems)
			{
				for (int I = Items.Length-1-MaxHistoryItems; I >= 0; I--)
					File.Delete(Items[I]);
			};
		}

		public double[] GetHistoryItems(int Count)
		{
			string HistoryFolder = TReflector.ProfileFolder+"/"+HistoryFolderName;
			if (!Directory.Exists(HistoryFolder))
				return null; //. ->
			string[] Items = Directory.GetFiles(HistoryFolder);
			int Limit;
			if (Items.Length < Count)
				Limit = Items.Length;
			else
				Limit = Count;
			double[] Result = new double[Limit];
			int Idx = 0;
			for (int I = Items.Length-1; I >= Items.Length-Limit; I--)
			{
				string FN = Path.GetFileName(Items[I]);
				double D = Convert.ToDouble(FN);
				Result[Idx] = D; Idx++;
			};
			return Result;
		}

		public bool GetHistoryItem(int Index, out THistoryItem Item)
		{
			Item = null;
			string HistoryFolder = TReflector.ProfileFolder+"/"+HistoryFolderName;
			if (!Directory.Exists(HistoryFolder))
				return false; //. ->
			string[] Items = Directory.GetFiles(HistoryFolder);
			if (Index >= Items.Length)
				return false; //. ->
			string FN = Path.GetFileName(Items[Items.Length-1-Index]);
			Item = new THistoryItem(FN);
			Item.Index = Index;
			return true;
		}

		public void ShowPanel()
		{
			if (Panel == null)
				Panel = new TfmHistoryPanel(this);
			Panel.Show();
			Panel.BringToFront();
		}
	}
}
