using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;

namespace csvgen
{
    public partial class Form1 : Form
    {
        static int len;        
        static bool finish = false;
        static int value = 0;
        
        public Form1()
        {
            InitializeComponent();
            progressBar1.Style = ProgressBarStyle.Continuous;
            progressBar1.Minimum = 0;
            progressBar1.Maximum = 100;
            progressBar1.Step = 1;
            timer1.Interval = 500;
            saveFileDialog1.Filter = "MYSQL CSV FILE(*.CSV)|*.csv|All files(*.*)|*.*";
        }


        private void timer1_Tick(object sender, EventArgs e)
        {
            progressBar1.Value = value;
            progressBar1.Update();

            if (finish)
            {
                label3.Text = "생성완료";
                progressBar1.Value = 100;
                progressBar1.Update();
                timer1.Enabled = false;
                string path = Path.GetDirectoryName(saveFileDialog1.FileName);
                ProcessStartInfo pfi = new ProcessStartInfo("Explorer.exe", path);
                System.Diagnostics.Process.Start(pfi);               
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {

            timer1.Enabled = true;
            progressBar1.Enabled = true;
            progressBar1.Value = 0;
            len = int.Parse(textBox1.Text);
            if (saveFileDialog1.ShowDialog() != System.Windows.Forms.DialogResult.OK)
                return;
            label3.Text = "생성중";
            Task.Factory.StartNew(new Action<Object>(Run), saveFileDialog1.FileName);
        }
        static void Run(Object data)
        {
            Random r = new Random();
            StreamWriter sw = new StreamWriter((string)data, false);
            string[] id = { "apple", "banana", "mac", "window", "toto", "atom","isola","dura","popi","heesu" };
            string fn = "김이박정최여러가지성이우리나라에는참만다그래서";
            string mn = "동해물과백두산이마르고이순신이정김삿갓최배달마농뽀뇨크레용신짱";
            int n = len / id.Length;
            int step = len / 100;
            int count = 0;
            sw.WriteLine("id,name,last,money,choo");
            foreach (string str in id)
                for (int i = 0; i < n; i++)
                {
                    count++;
                    TimeSpan t = TimeSpan.FromSeconds(r.Next(365 * 24 * 60 * 60));
                    DateTime dd = DateTime.Now.Subtract(t);
                    string name = "" + fn[r.Next(fn.Length)] + mn[r.Next(mn.Length)] +  mn[r.Next(mn.Length)];
                    sw.WriteLine(string.Format("{0},{1},{2:yyyy-MM-dd HH:mm:ss},{3},\\N",
                        str + i, //id
                        name,//name
                        dd, //visit
                        r.Next(10000) * 100)); //money
                    if (count % step == 0) value++;
                }
            sw.Close();
            finish = true;                      
        }
    }
}


  