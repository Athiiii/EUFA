using EUFA.Db;
using EUFA.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace EUFA
{
    /// <summary>
    /// Interaction logic for ManageTournament.xaml
    /// </summary>
    public partial class ManageTournament : Window, IDraw
    {
        public Window Window { get; }

        public ManageTournament(Window window)
        {
            InitializeComponent();
            Window = window;
            Draw();
        }

        public void Draw()
        {
            using (var context = new EufaContext())
            {
                TournamentsList.ItemsSource = context.Tournaments.ToList();
            }
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            new AddEditTournament(this, null).Show();
            Hide();
        }

        private void Edit(object sender, RoutedEventArgs e)
        {
            if (TournamentsList.SelectedItem == null)
            {
                MessageBox.Show("Please select a item first", "Missing selection", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                new AddEditTournament(this, TournamentsList.SelectedItem as Tournaments).Show();
                Hide();
            }
        }

        private void Delete(object sender, RoutedEventArgs e)
        {
            if (TournamentsList.SelectedItem == null)
            {
                MessageBox.Show("Please select a item first", "Missing selection", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                var tournament = TournamentsList.SelectedItem as Tournaments;
                if (MessageBox.Show($"Do you really want do delete this item :{tournament.Name}", 
                    "Confirmation Dialogue", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    using (var context = new EufaContext())
                    {
                        tournament = context.Tournaments.Attach(tournament);
                        context.Tournaments.Remove(tournament);
                        context.SaveChanges();
                    }
                    Draw();
                }
            }
        }

        private void Close(object sender, RoutedEventArgs e)
        {
            Window.Show();
            Close();
        }
    }
}
