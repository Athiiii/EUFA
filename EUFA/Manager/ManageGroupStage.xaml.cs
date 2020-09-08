using EUFA.Db;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace EUFA.Manager
{
    /// <summary>
    /// Interaction logic for ManageGroupStage.xaml
    /// </summary>
    public partial class ManageGroupStage : Window
    {
        public ManageGroupStage(Tournaments tournaments)
        {
            InitializeComponent();
            Tournaments = tournaments;
            ReadData();
        }

        private void ReadData()
        {
            using (var context = new EufaContext())
            {
                var list = context.StageGame.Include(c => c.Teams)
                    .Include(a => a.Teams)
                    .Where(y => y.TournamentId == Tournaments.Id && y.Stage == "GroupStage").ToList();

                if (list.Count() != 36)
                {
                    MessageBox.Show("First allocate your teams before Starting the Stage game", "Missing team allocation", MessageBoxButton.OK, MessageBoxImage.Error);
                    Close(null, null);
                }
                else
                {
                    Show();
                    StageGamesList = list.ToList();
                    ShowFrom("A");

                }
            }
        }

        public List<object> Controls { get; set; } = new List<object>();

        private void ShowFrom(string v)
        {
            Controls.ForEach(y => y = null);

            var games = new List<StageGame>();
            using (var context = new EufaContext())
            {
                var list = context.TournamentTeams.Where(y => y.TournamentId == Tournaments.Id && y.GroupCode.StartsWith(v)).Select(c => c.TeamId).ToArray();
                games = StageGamesList.Where(y => list.Contains(y.TeamA_Id)).ToList();
            }

            for (var i = 0; i < 6; i++)
            {
                var text = new Label { Content = $"{StageGamesList[i].Teams.Name} - {StageGamesList[i].Teams1.Name}" };
                text.SetValue(Grid.RowProperty, i + 2);

                var aPoint = StageGamesList[i].OnGoing == null ? "-" : StageGamesList[i].TeamAGoals.ToString();
                var bPoint = StageGamesList[i].OnGoing == null ? "-" : StageGamesList[i].TeamBGoals.ToString();
                var star = StageGamesList[i].OnGoing == true ? "*" : "";
                var result = new Label { Content = $"{aPoint}:{bPoint}{star}" };
                result.SetValue(Grid.RowProperty, i + 2);
                result.SetValue(Grid.ColumnProperty, 1);

                var btn = new Button
                {
                    Padding = new Thickness(10, 5, 10, 5),
                    Content = "Edit..."
                };
                btn.SetValue(Grid.RowProperty, i + 2);
                btn.SetValue(Grid.ColumnProperty, 3);

                Table.Children.Add(text);
                Table.Children.Add(result);
                Table.Children.Add(btn);

                Controls.Add(text);
                Controls.Add(result);
                Controls.Add(btn);
            }
        }

        public Tournaments Tournaments { get; }
        public Window Window { get; }
        public List<StageGame> StageGamesList { get; private set; }

        private void Close(object sender, RoutedEventArgs e)
        {
            new ManageExecution(Tournaments).Show();
            Close();
        }

        private void GroupList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (sender != null && Tournaments != null)
            {
                var letter = ((sender as ComboBox).SelectedValue as ComboBoxItem).Tag;
                ShowFrom(letter.ToString());
            }

        }
    }
}
