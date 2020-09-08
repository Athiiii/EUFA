using EUFA.Db;
using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;

namespace EUFA
{
    /// <summary>
    /// Interaction logic for AddEditPlayer.xaml
    /// </summary>
    public partial class AddEditPlayer : Window
    {
        public AddEditPlayer(AddEditTeams addEditTeamsWindow, Players players = null)
        {
            InitializeComponent();

            Player = players;
            addEditTeamsWindow.Hide();

            if (players != null)
                EditMode = true;

            Draw();
            AddEditTeamsWindow = addEditTeamsWindow;

            using (var context = new EufaContext())
            {
                PositionsList.ItemsSource = context.Position.ToList();
                PositionsList.DisplayMemberPath = "Position1";

                if (players != null)
                {
                    Lastname.Text = Player.Lastname;
                    Firstname.Text = Player.Firstname;
                    PositionsList.SelectedItem = context.Position.FirstOrDefault(x => x.Id == players.PositionId);
                    ShirtNumber.Text = Player.ShirtNumber;
                    Birthday.SelectedDate = Player.Date_of_birth;
                }
            }
            TextBoxChanged(null, null);
        }

        private void Draw()
        {

        }

        public bool EditMode { get; }
        public AddEditTeams AddEditTeamsWindow { get; }
        public Players Player { get; set; }

        private void Close(object sender, RoutedEventArgs e)
        {
            AddEditTeamsWindow.Draw();
            AddEditTeamsWindow.Show();
            Close();
        }

        private void Save(object sender, RoutedEventArgs e)
        {
            if (EditMode)
            {
                if (AddEditTeamsWindow.List.Where(x => x.ShirtNumber == ShirtNumber.Text).Count() <= 1)
                {
                    Player.Date_of_birth = (DateTime)Birthday.SelectedDate;
                    Player.Firstname = Firstname.Text;
                    Player.Lastname = Lastname.Text;
                    Player.PositionId = (PositionsList.SelectedItem as Position).Id;
                    Player.ShirtNumber = ShirtNumber.Text;
                }
                else
                {
                    MessageBox.Show("This Shirtnumber is already in use", "Already in use", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {

                if (AddEditTeamsWindow.List.Where(x => x.ShirtNumber == ShirtNumber.Text).Count() == 0)
                {
                    AddEditTeamsWindow.List.Add(new Players
                    {
                        Date_of_birth = (DateTime)Birthday.SelectedDate,
                        Firstname = Firstname.Text,
                        Lastname = Lastname.Text,
                        PositionId = (PositionsList.SelectedItem as Position).Id,
                        ShirtNumber = ShirtNumber.Text
                    });
                }
                else
                {
                    MessageBox.Show("This Shirtnumber is already in use", "Already in use", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

            AddEditTeamsWindow.Draw();
            AddEditTeamsWindow.Show();
            Close();
        }

        private void CheckInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = new Regex("[^0-9]+").IsMatch(ShirtNumber.Text) && ShirtNumber.Text.Length <= 2;
        }

        private void TextBoxChanged(object sender, RoutedEventArgs e)
        {
            SaveBtn.IsEnabled = !(string.IsNullOrWhiteSpace(Lastname.Text) || string.IsNullOrWhiteSpace(ShirtNumber.Text)
                || Birthday.SelectedDate == null || PositionsList.SelectedItem == null);
        }

        private void DataChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            TextBoxChanged(null, null);

            if (Birthday.SelectedDate != null)
            {
                Birthday.Text = Birthday.SelectedDate?.ToString("dd.MM.yyyy");
            }
        }
    }
}
