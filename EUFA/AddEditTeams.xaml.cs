using EUFA.Db;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Media.Imaging;

namespace EUFA
{
    /// <summary>
    /// Interaction logic for AddEditTeams.xaml
    /// </summary>
    public partial class AddEditTeams : Window
    {
        public bool EditMode { get; set; }

        public List<Players> List { get; private set; }
        public List<Region> RegionsList { get; private set; }
        public string FlagText { get; set; } = "default.png";
        public BitmapImage Flag { get => new BitmapImage(new Uri($"pack://application:,,,./assets/{FlagText}")); }


        public AddEditTeams(Teams team)
        {
            InitializeComponent();
            DataContext = this;

            Team = team;

            EditMode = team != null;
            if (team == null)
            {
                Team = new Teams();
            }
            else
            {
                using (var context = new EufaContext())
                {
                    List = context.Players.Include(y => y.Position).Where(x => x.Team_id == Team.Id).ToList();
                    FlagText = Team.FlagUrl;
                }
            }


            ReadPlayerList();
            Draw();
            DataChanged(null, null);
        }

        public void Draw()
        {
            GroupBoxPlayer.Header = $"Players ({List.Count})";
            PlayerList.ItemsSource = List;
            PlayerList.Items.Refresh();
        }

        private void ReadPlayerList()
        {
            using (var context = new EufaContext())
            {
                RegionsList = context.Region.ToList();

                if (EditMode)
                {
                    var region = context.Region.FirstOrDefault(x => x.Id == Team.Region);
                    Regions.SelectedItem = region;
                }
                else
                {
                    List = new List<Players>();
                }
            }
            PlayerList.ItemsSource = List;
        }

        public Teams Team { get; }

        private void Close(object sender, RoutedEventArgs e)
        {
            new ManageTeams().Show();
            Close();
        }

        private void DataChanged(object sender, RoutedEventArgs e)
        {
            SaveCloseBtn.IsEnabled = !(TeamName.Text == string.Empty || Code.Text == string.Empty);
        }

        private void SelectFlag(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog
            {
                Filter = $"Images | *.png;*.jpg",
                InitialDirectory = Path.Combine(Directory.GetCurrentDirectory(), "assets")
            };

            if (dialog.ShowDialog() == true)
            {

            }
        }

        private void SaveAndClose(object sender, RoutedEventArgs e)
        {
            using (var context = new EufaContext())
            {
                var team = context.Teams.FirstOrDefault(x => x.Name == TeamName.Name || x.CountryCode == Code.Text);

                if (team != null || Code.Text.Length == 3)
                {
                    MessageBox.Show("It doesn't fit all requirements",
                        "Team name and Country code must be unique. The Country code must be exactly 3 letters",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void Delete(object sender, RoutedEventArgs e)
        {
            if (PlayerList.SelectedItem == null)
            {
                MessageBox.Show("You didn't selected a player", "Missing player", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                List.Remove(PlayerList.SelectedItem as Players);
                Draw();
            }
        }

        private void Edit(object sender, RoutedEventArgs e)
        {

            if (PlayerList.SelectedItem == null)
            {
                MessageBox.Show("You didn't selected a player", "Missing player", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                new AddEditPlayer(this, PlayerList.SelectedItem as Players).Show();
            }
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            new AddEditPlayer(this).Show();
        }
    }
}
