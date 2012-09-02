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
	public class TfmElectedPlacesPanel : System.Windows.Forms.Form
	{
		private TElectedPlaces ElectedPlaces;
		private bool flSelected;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.ListView lvItems;
		private System.Windows.Forms.Button btnAddNew;
		private System.Windows.Forms.Button btnRemoveSelected;
		private System.Windows.Forms.Button btnOk;
		private System.Windows.Forms.ColumnHeader columnHeader1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public TfmElectedPlacesPanel(TElectedPlaces pElectedPlaces)
		{
			ElectedPlaces = pElectedPlaces;
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
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.btnOk);
			this.panel1.Controls.Add(this.btnRemoveSelected);
			this.panel1.Controls.Add(this.btnAddNew);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Right;
			this.panel1.Location = new System.Drawing.Point(252, 0);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(40, 273);
			this.panel1.TabIndex = 0;
			// 
			// btnOk
			// 
			this.btnOk.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.btnOk.Location = new System.Drawing.Point(0, 20);
			this.btnOk.Name = "btnOk";
			this.btnOk.Size = new System.Drawing.Size(40, 32);
			this.btnOk.TabIndex = 1;
			this.btnOk.Text = "Ok";
			this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
			// 
			// btnRemoveSelected
			// 
			this.btnRemoveSelected.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.btnRemoveSelected.Location = new System.Drawing.Point(0, 112);
			this.btnRemoveSelected.Name = "btnRemoveSelected";
			this.btnRemoveSelected.Size = new System.Drawing.Size(40, 32);
			this.btnRemoveSelected.TabIndex = 3;
			this.btnRemoveSelected.Text = "-";
			this.btnRemoveSelected.Click += new System.EventHandler(this.btnRemoveSelected_Click);
			// 
			// btnAddNew
			// 
			this.btnAddNew.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.btnAddNew.Location = new System.Drawing.Point(0, 72);
			this.btnAddNew.Name = "btnAddNew";
			this.btnAddNew.Size = new System.Drawing.Size(40, 32);
			this.btnAddNew.TabIndex = 2;
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
			this.lvItems.Size = new System.Drawing.Size(252, 273);
			this.lvItems.TabIndex = 1;
			this.lvItems.View = System.Windows.Forms.View.Details;
			this.lvItems.DoubleClick += new System.EventHandler(this.lvItems_DoubleClick);
			this.lvItems.AfterLabelEdit += new System.Windows.Forms.LabelEditEventHandler(this.lvItems_AfterLabelEdit);
			// 
			// columnHeader1
			// 
			this.columnHeader1.Text = "Name";
			this.columnHeader1.Width = 200;
			// 
			// TfmElectedPlacesPanel
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(292, 273);
			this.Controls.Add(this.lvItems);
			this.Controls.Add(this.panel1);
			this.Name = "TfmElectedPlacesPanel";
			this.ShowInTaskbar = false;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Bookmark places";
			this.panel1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void lvItems_Update()
		{
			lvItems.BeginUpdate();
			try
			{
				lvItems.Items.Clear();
				for (int I = 0; I < ElectedPlaces.Items.Count; I++)
				{
					ListViewItem Item = new ListViewItem(((TElectedPlace)ElectedPlaces.Items[I]).Name);
					lvItems.Items.Add(Item);
				};
			}
			finally
			{
				lvItems.EndUpdate();
			};
		}

		private void AddNewPlace()
		{
			string PlaceName = "New place";
			TReflectionWindowStruc RW;
			ElectedPlaces.Reflector.ReflectionWindow.GetWindow(true, out RW);
			TElectedPlace ElectedPlace = new TElectedPlace();
			ElectedPlace.Name = PlaceName;
			ElectedPlace.ReflectionWindow = RW;
			ElectedPlaces.Items.Insert(0,ElectedPlace);
			ListViewItem Item = new ListViewItem(PlaceName);
			lvItems.Items.Insert(0,Item);
			Item.Selected = true;
			Item.Focused = true;
			Item.BeginEdit();
		}

		private void RemoveSelectedPlace()
		{
			if (lvItems.SelectedItems.Count > 0)
			{
				int Idx = lvItems.SelectedItems[0].Index;
				ElectedPlaces.Items.RemoveAt(Idx);
				ElectedPlaces.Save();
				lvItems.Items.RemoveAt(Idx);
			}
		}

		public bool Dialog(out TElectedPlace ElectedPlace)
		{
			flSelected = false;
			ElectedPlace = null;
			ShowDialog();
			if (flSelected)
			{
				if (lvItems.SelectedItems.Count == 0)
					return false; //. ->
				int Idx = lvItems.SelectedItems[0].Index;
				ElectedPlace = ((TElectedPlace)ElectedPlaces.Items[Idx]);
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
				((TElectedPlace)ElectedPlaces.Items[e.Item]).Name = e.Label;
				ElectedPlaces.Save();
			};
		}

		private void btnAddNew_Click(object sender, System.EventArgs e)
		{
			AddNewPlace();
		}

		private void btnRemoveSelected_Click(object sender, System.EventArgs e)
		{
			RemoveSelectedPlace();
		}

		private void lvItems_DoubleClick(object sender, System.EventArgs e)
		{
			flSelected = true;
			Close();
		}
	}
}
