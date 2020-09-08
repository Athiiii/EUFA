using EUFA.Db;
using System.Linq;
using System.Windows;

namespace EUFA
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            using (var context = new EufaContext())
            {
                TournamentList.ItemsSource = context.Tournaments.ToList();
                TournamentList.DisplayMemberPath = "Name";
                TournamentList.SelectedIndex = 0;
            }
        }

        private void TournamentChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            var item = TournamentList.SelectedItem as Tournaments;
            TournamentName.Content = item.Name;
            TimeSpanOfTournament.Content = $"{item.StartDate:dd.MM.yyyy} - {item.EndDate:dd.MM.yyyy}";
        }

        private void ManageTournaments(object sender, RoutedEventArgs e)
        {
            new ManageTournament(this).Show();
            Hide();
        }

        private void ManageTeams(object sender, RoutedEventArgs e)
        {
            new ManageTeams().Show();
            Close();
        }

        private void ManageExecution(object sender, RoutedEventArgs e)
        {
            new ManageExecution(TournamentList.SelectedItem as Tournaments).Show();
            Close();
        }
    }
}
