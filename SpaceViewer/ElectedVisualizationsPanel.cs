using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace SpaceViewer
{
	/// <summary>
	/// Summary description for ElectedPlacesPanel.
	/// </summary>
	public class TfmElectedVisualizationsPanel : System.Windows.Forms.Form
	{
		private TElectedVisualizations ElectedVisualizations;
		private bool flSelected;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.ListView lvItems;
		private System.Windows.Forms.Button btnAddNew;
		private System.Windows.Forms.Button btnRemoveSelected;
		private System.Windows.Forms.Button btnOk;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox edidTVisualization;
		private System.Windows.Forms.TextBox edidVisualization;
		private System.Windows.Forms.Label label2;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public TfmElectedVisualizationsPanel(TElectedVisualizations pElectedVisualizations)
		{
			ElectedVisualizations = pElectedVisualizations;
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			//.
			lvItems_Update();
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
			this.panel1 = new System.Windows.Forms.Panel();
			this.btnOk = new System.Windows.Forms.Button();
			this.btnRemoveSelected = new System.Windows.Forms.Button();
			this.btnAddNew = new System.Windows.Forms.Button();
			this.lvItems = new System.Windows.Forms.ListView();
			this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.label1 = new System.Windows.Forms.Label();
			this.edidTVisualization = new System.Windows.Forms.TextBox();
			this.edidVisualization = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.panel1.SuspendLayout();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.groupBox1);
			this.panel1.Controls.Add(this.btnOk);
			this.panel1.Controls.Add(this.btnRemoveSelected);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.panel1.Location = new System.Drawing.Point(0, 237);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(344, 64);
			this.panel1.TabIndex = 0;
			// 
			// btnOk
			// 
			this.btnOk.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.btnOk.Location = new System.Drawing.Point(296, 17);
			this.btnOk.Name = "btnOk";
			this.btnOk.Size = new System.Drawing.Size(40, 32);
			this.btnOk.TabIndex = 5;
			this.btnOk.Text = "Ok";
			this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
			// 
			// btnRemoveSelected
			// 
			this.btnRemoveSelected.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.btnRemoveSelected.Location = new System.Drawing.Point(240, 17);
			this.btnRemoveSelected.Name = "btnRemoveSelected";
			this.btnRemoveSelected.Size = new System.Drawing.Size(40, 32);
			this.btnRemoveSelected.TabIndex = 4;
			this.btnRemoveSelected.Text = "-";
			this.btnRemoveSelected.Click += new System.EventHandler(this.btnRemoveSelected_Click);
			// 
			// btnAddNew
			// 
			this.btnAddNew.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.btnAddNew.Location = new System.Drawing.Point(176, 16);
			this.btnAddNew.Name = "btnAddNew";
			this.btnAddNew.Size = new System.Drawing.Size(40, 32);
			this.btnAddNew.TabIndex = 3;
			this.btnAddNew.Text = "+";
			this.btnAddNew.Click += new System.EventHandler(this.btnAddNew_Click);
			// 
			// lvItems
			// 
			this.lvItems.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																					  this.columnHeader1});
			this.lvItems.Dock = System.Windows.Forms.DockStyle.Fill;
			this.lvItems.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lvItems.FullRowSelect = true;
			this.lvItems.GridLines = true;
			this.lvItems.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.lvItems.HideSelection = false;
			this.lvItems.LabelEdit = true;
			this.lvItems.LabelWrap = false;
			this.lvItems.Location = new System.Drawing.Point(0, 0);
			this.lvItems.MultiSelect = false;
			this.lvItems.Name = "lvItems";
			this.lvItems.Size = new System.Drawing.Size(344, 237);
			this.lvItems.TabIndex = 1;
			this.lvItems.View = System.Windows.Forms.View.Details;
			this.lvItems.DoubleClick += new System.EventHandler(this.lvItems_DoubleClick);
			this.lvItems.AfterLabelEdit += new System.Windows.Forms.LabelEditEventHandler(this.lvItems_AfterLabelEdit);
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Name";
			this.columnHeader1.Width = 300;
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.edidVisualization);
			this.groupBox1.Controls.Add(this.label2);
			this.groupBox1.Controls.Add(this.edidTVisualization);
			this.groupBox1.Controls.Add(this.label1);
			this.groupBox1.Controls.Add(this.btnAddNew);
			this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.groupBox1.Location = new System.Drawing.Point(8, 1);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(224, 56);
			this.groupBox1.TabIndex = 3;
			this.groupBox1.TabStop = false;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 23);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(56, 23);
			this.label1.TabIndex = 1;
			this.label1.Text = "TypeID";
			// 
			// edidTVisualization
			// 
			this.edidTVisualization.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.edidTVisualization.Location = new System.Drawing.Point(56, 20);
			this.edidTVisualization.Name = "edidTVisualization";
			this.edidTVisualization.Size = new System.Drawing.Size(40, 23);
			this.edidTVisualization.TabIndex = 1;
			this.edidTVisualization.Text = "";
			// 
			// edidVisualization
			// 
			this.edidVisualization.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.edidVisualization.Location = new System.Drawing.Point(112, 20);
			this.edidVisualization.Name = "edidVisualization";
			this.edidVisualization.Size = new System.Drawing.Size(56, 23);
			this.edidVisualization.TabIndex = 2;
			this.edidVisualization.Text = "";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(96, 24);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(24, 23);
			this.label2.TabIndex = 3;
			this.label2.Text = "ID";
			// 
			// TfmElectedVisualizationsPanel
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(344, 301);
			this.Controls.Add(this.lvItems);
			this.Controls.Add(this.panel1);
			this.Name = "TfmElectedVisualizationsPanel";
			this.ShowInTaskbar = false;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Bookmark objects";
			this.panel1.ResumeLayout(false);
			this.groupBox1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void lvItems_Update()
		{
			lvItems.BeginUpdate();
			try
			{
				lvItems.Items.Clear();
				for (int I = 0; I < ElectedVisualizations.Items.Count; I++)
				{
					ListViewItem Item = new ListViewItem(((TElectedVisualization)ElectedVisualizations.Items[I]).Name);
					lvItems.Items.Add(Item);
				};
			}
			finally
			{
				lvItems.EndUpdate();
			};
		}

		private void AddNewVisualization()
		{
			string VisualizationName = "New Object";
			TElectedVisualization ElectedVisualization = new TElectedVisualization();
			ElectedVisualization.Name = VisualizationName;
			ElectedVisualization.idTVisualization = Convert.ToInt32(edidTVisualization.Text);
			ElectedVisualization.idVisualization = Convert.ToInt32(edidVisualization.Text);
			ElectedVisualizations.Items.Insert(0,ElectedVisualization);
			ListViewItem Item = new ListViewItem(VisualizationName);
			lvItems.Items.Insert(0,Item);
			edidVisualization.Text = "";
			Item.Selected = true;
			Item.Focused = true;
			Item.BeginEdit();
		}

		private void RemoveSelectedVisualization()
		{
			if (lvItems.SelectedItems.Count > 0)
			{
				int Idx = lvItems.SelectedItems[0].Index;
				ElectedVisualizations.Items.RemoveAt(Idx);
				ElectedVisualizations.Save();
				lvItems.Items.RemoveAt(Idx);
			}
		}

		public bool Dialog(out TElectedVisualization ElectedVisualization)
		{
			flSelected = false;
			ElectedVisualization = null;
			ShowDialog();
			if (flSelected)
			{
				if (lvItems.SelectedItems.Count == 0)
					return false; //. ->
				int Idx = lvItems.SelectedItems[0].Index;
				ElectedVisualization = ((TElectedVisualization)ElectedVisualizations.Items[Idx]);
				return true; //. ->
			}
			else
				return false;
		}

		private void btnOk_Click(object sender, System.EventArgs e)
		{
			flSelected = true;
			Close();
		}

		private void lvItems_AfterLabelEdit(object sender, System.Windows.Forms.LabelEditEventArgs e)
		{
			if (e.Label != null)
			{
				((TElectedVisualization)ElectedVisualizations.Items[e.Item]).Name = e.Label;
				ElectedVisualizations.Save();
			};
		}

		private void btnAddNew_Click(object sender, System.EventArgs e)
		{
			AddNewVisualization();
		}

		private void btnRemoveSelected_Click(object sender, System.EventArgs e)
		{
			RemoveSelectedVisualization();
		}

		private void lvItems_DoubleClick(object sender, System.EventArgs e)
		{
			flSelected = true;
			Close();
		}
	}
}
