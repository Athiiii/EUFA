using EUFA.Db;
using EUFA.Manager;
using System;
using System.Linq;
using System.Windows;

namespace EUFA
{
    /// <summary>
    /// Interaction logic for ManageExecution.xaml
    /// </summary>
    public partial class ManageExecution : Window
    {
        public Tournaments Tournaments { get; }

        public ManageExecution(Tournaments tournaments)
        {
            Tournaments = tournaments;

            InitializeComponent();
            Draw();
        }

        public void Draw()
        {
            using (var context = new EufaContext())
            {
               if(context.TournamentTeams.Count(x => x.TournamentId == Tournaments.Id && x.GroupCode == null) == 0)
                {
                    AllocateTeams.Content = "Yes";
                    AllocateBtn.IsEnabled = false;
                }
            }
        }

        private void Cancel(object sender, RoutedEventArgs e)
        {
            new MainWindow().Show();
            Close();
        }

        private void Allocate(object sender, RoutedEventArgs e)
        {
            new AllocateTeams(Tournaments).Show();
            Close();
        }

        private void ManageGroupStageClick(object sender, RoutedEventArgs e)
        {
            Hide();
            new ManageGroupStage(Tournaments);
        }
    }
}
