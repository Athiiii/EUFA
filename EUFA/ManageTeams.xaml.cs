using EUFA.Db;
using EUFA.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace EUFA
{
    /// <summary>
    /// Interaction logic for ManageTeams.xaml
    /// </summary>
    public partial class ManageTeams : Window
    {
        public ManageTeams()
        {
            InitializeComponent();
            ReadData();
        }

        private void ReadData()
        {
            using (var context = new EufaContext())
            {
                // "./assets/" + x.FlagUrl == null ? "default.png" : x.FlagUrl,
                var list = context.Teams.Where(y => !y.Removed).ToList();
                ListTeam = new List<ManageTeamsModel>();
                list.ForEach(x =>
                {
                    ListTeam.Add(new ManageTeamsModel
                    {
                        Teams = x,
                        Code = x.CountryCode,
                        Flag = new BitmapImage(new Uri($"pack://application:,,,./assets/{(x.FlagUrl == null ? "default.png" : x.FlagUrl)}")),
                        Id = x.Id,
                        Team = x.Name
                    });
                });
            }
            TeamList.ItemsSource = ListTeam;
        }

        public List<ManageTeamsModel> ListTeam { get; set; }

        private void Close(object sender, RoutedEventArgs e)
        {
            new MainWindow().Show();
            Close();
        }

        private void TextBox_SelectionChanged(object sender, RoutedEventArgs e)
        {
            if (sender != null)
                TeamList.ItemsSource = ListTeam.Where(x => x.Team.ToLower().Contains((sender as TextBox).Text.ToLower()));
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            new AddEditTeams(null).Show();
            Close();
        }

        private void Edit(object sender, RoutedEventArgs e)
        {
            if (TeamList.SelectedItem == null)
            {
                MessageBox.Show("Please first select a team", "Missing selection", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                new AddEditTeams((TeamList.SelectedItem as ManageTeamsModel).GetTeams()).Show();
                Close();
            }
        }

        private void Delete(object sender, RoutedEventArgs e)
        {
            if (TeamList.SelectedItem == null)
            {
                MessageBox.Show("Please first select a team", "Missing selection", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                using (var context = new EufaContext())
                {
                    var id = (TeamList.SelectedItem as ManageTeamsModel).GetTeams().Id;
                    var item = context.Teams.FirstOrDefault(x => x.Id == id);
                    if (item != null)
                    {
                        if (item.TournamentTeams.Count == 0)
                        {
                            item.Removed = true;
                            context.SaveChanges();
                        }
                        else
                        {
                            MessageBox.Show("This Team has already participated a tournament", "ERROR", MessageBoxButton.OK, MessageBoxImage.Error);

                        }
                    }
                    ReadData();
                    TextBox_SelectionChanged(null, null);
                }
            }
        }
    }
}
