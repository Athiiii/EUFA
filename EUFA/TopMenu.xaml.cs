using EUFA.Db;
using System;
using System.Windows;
using System.Windows.Controls;

namespace EUFA
{
    /// <summary>
    /// Interaction logic for TopMenu.xaml
    /// </summary>
    public partial class TopMenu : UserControl
    {
        public TopMenu()
        {
            InitializeComponent();
        }

        private void Exit(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        }

        private void ManageTournaments(object sender, RoutedEventArgs e)
        {
            new ManageTournament(Window.GetWindow(this)).Show();
            Window.GetWindow(this).Hide();
        }

        private void ManageTeams(object sender, RoutedEventArgs e)
        {
            new ManageTeams().Show();
            Window.GetWindow(this).Close();
        }

        private void ManageExecutions(object sender, RoutedEventArgs e)
        {
            new ManageExecution((MainWindow.GetWindow(this) as MainWindow).TournamentList.SelectedItem as Tournaments).Show();
            Window.GetWindow(this).Close();
        }
    }
}
