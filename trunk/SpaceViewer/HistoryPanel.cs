using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace SpaceViewer
{
	/// <summary>
	/// Summary description for History.
	/// </summary>
	public class TfmHistoryPanel : System.Windows.Forms.Form
	{
		private const int lvItems_MaxCount = 50;
		private THistory History;
		private bool flSelected;
		private System.Windows.Forms.ListView lvItems;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.ColumnHeader columnHeader2;

		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public TfmHistoryPanel(THistory pHistory)
		{
			History = pHistory;
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			//.
			UpdatePanel();
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
			this.lvItems = new System.Windows.Forms.ListView();
			this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.SuspendLayout();
			// 
			// lvItems
			// 
			this.lvItems.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																					  this.columnHeader2,
																					  this.columnHeader1});
			this.lvItems.Dock = System.Windows.Forms.DockStyle.Fill;
			this.lvItems.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lvItems.FullRowSelect = true;
			this.lvItems.GridLines = true;
			this.lvItems.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.lvItems.HideSelection = false;
			this.lvItems.LabelWrap = false;
			this.lvItems.Location = new System.Drawing.Point(0, 0);
			this.lvItems.MultiSelect = false;
			this.lvItems.Name = "lvItems";
			this.lvItems.Size = new System.Drawing.Size(232, 273);
			this.lvItems.TabIndex = 2;
			this.lvItems.View = System.Windows.Forms.View.Details;
			this.lvItems.DoubleClick += new System.EventHandler(this.lvItems_DoubleClick);
			this.lvItems.SelectedIndexChanged += new System.EventHandler(this.lvItems_SelectedIndexChanged);
			// 
			// columnHeader2
			// 
			this.columnHeader2.Width = 0;
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Timestamp";
			this.columnHeader1.Width = 200;
			// 
			// TfmHistoryPanel
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(232, 273);
			this.Controls.Add(this.lvItems);
			this.Name = "TfmHistoryPanel";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "History";
			this.TopMost = true;
			this.Closing += new System.ComponentModel.CancelEventHandler(this.TfmHistoryPanel_Closing);
			this.ResumeLayout(false);

		}
		#endregion

		public void UpdatePanel()
		{
			lvItems_Update();
		}

		private void lvItems_Update()
		{
			lvItems.BeginUpdate();
			try
			{
				lvItems.Items.Clear();
				double[] Items = History.GetHistoryItems(lvItems_MaxCount);
				for (int I = 0; I < Items.Length; I++)
				{
					ListViewItem Item = new ListViewItem(Items[I].ToString());
					Item.SubItems.Add(DateTime.FromOADate(Items[I]).ToString());
					lvItems.Items.Add(Item);
				};
			}
			finally
			{
				lvItems.EndUpdate();
			};
		}

		public bool Dialog(out THistoryItem Item)
		{
			flSelected = false;
			Item = null;
			ShowDialog();
			if (flSelected)
			{
				return true; //. ->
			}
			else
				return false;
		}

		private void lvItems_DoubleClick(object sender, System.EventArgs e)
		{
		}

		private void TfmHistoryPanel_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
			e.Cancel = true;
			Hide();		
		}

		private void lvItems_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if (lvItems.SelectedItems.Count == 0)
				return ; //. ->
			int Idx = lvItems.SelectedItems[0].Index;
			THistoryItem Item = new THistoryItem(lvItems.Items[Idx].Text);
			try
			{
				Item.Index = Idx;
				History.Reflector.PrepareAndReflectByHistoryItem(Item);
				//.
				History.Reflector.History_Index = Idx;
				if (Idx != 0)
					History.Reflector.btnHistoryNext.Enabled = true;
				else
					History.Reflector.btnHistoryNext.Enabled = false;
				History.Reflector.btnHistoryPrev.Enabled = true;
			}
			finally
			{
				Item.Destroy();
			};		
		}
	}
}
