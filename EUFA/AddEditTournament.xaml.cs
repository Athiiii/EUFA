using EUFA.Db;
using EUFA.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;

namespace EUFA
{
    /// <summary>
    /// Interaction logic for AddEditTournament.xaml
    /// </summary>
    public partial class AddEditTournament : Window
    {

        public AddEditTournament(Window window, Tournaments tournaments)
        {
            InitializeComponent();
            DataContext = this;

            Tournaments = tournaments;
            StartDay.SelectedDate = DateTime.Now;
            EndDay.SelectedDate = DateTime.Now.AddDays(1);

            using (var context = new EufaContext())
            {
                TeamsList.ItemsSource = context.Teams.Select(x => new AddEditTournamentModel
                {
                    Teams = x,
                    Member = false
                }).ToList();

                TempList = TeamsList.ItemsSource.Cast<AddEditTournamentModel>().ToList().Select(x => new AddEditTournamentModel
                {
                    Member = x.Member,
                    Teams = x.Teams
                }).ToList();

                if(Tournaments != null)
                {
                    Tournaments = context.Tournaments.Where(x => x.Id == Tournaments.Id).Include(y => y.TournamentTeams).ToList()[0];
                    TournamentsName.Text = Tournaments.Name;
                    StartDay.SelectedDate = Tournaments.StartDate;
                    EndDay.SelectedDate = Tournaments.EndDate;

                    TempList = TeamsList.ItemsSource.Cast<AddEditTournamentModel>().ToList().Select(x => new AddEditTournamentModel
                    {
                        Member = Tournaments.TournamentTeams.FirstOrDefault(y => y.TeamId == x.Teams.Id) != null,
                        Teams = x.Teams
                    }).ToList();
                }
            }

            Window = window;
            RunFilter();
        }

        private void RunFilter()
        {
            if (TempList != null)
                switch (Filter)
                {
                    case "All":
                        TeamsList.ItemsSource = TempList.Select(x => new AddEditTournamentModel { Member = x.Member, Teams = x.Teams }).ToList();
                        break;
                    case "Others":
                        TeamsList.ItemsSource = TempList.Where(y => y.Teams.Region == 5)
                            .Select(x => new AddEditTournamentModel { Member = x.Member, Teams = x.Teams }).ToList();
                        break;
                    case "Asia":
                        TeamsList.ItemsSource = TempList.Where(y => y.Teams.Region == 2)
                            .Select(x => new AddEditTournamentModel { Member = x.Member, Teams = x.Teams }).ToList();
                        break;
                    case "Africa":
                        TeamsList.ItemsSource = TempList.Where(y => y.Teams.Region == 3)
                            .Select(x => new AddEditTournamentModel { Member = x.Member, Teams = x.Teams }).ToList();
                        break;
                    case "America":
                        TeamsList.ItemsSource = TempList.Where(y => y.Teams.Region == 4)
                            .Select(x => new AddEditTournamentModel { Member = x.Member, Teams = x.Teams }).ToList();
                        break;
                    case "Europe":
                        TeamsList.ItemsSource = TempList.Where(y => y.Teams.Region == 1)
                            .Select(x => new AddEditTournamentModel { Member = x.Member, Teams = x.Teams }).ToList();
                        break;
                    default:

                        break;
                }
        }

        public Window Window { get; }
        public Tournaments Tournaments { get; }
        public List<AddEditTournamentModel> TempList { get; set; }
        public string Filter { get; private set; } = "All";

        private void TeamsList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            var list = TeamsList.ItemsSource.Cast<AddEditTournamentModel>();

            if (list.Count(x => x.Member) > 24)
            {
                MessageBox.Show("You can only select 24 teams", "Too many selections", MessageBoxButton.OK, MessageBoxImage.Error);
                TeamsList.ItemsSource = TempList;
            }
            else
            {
                var temp = TempList.Select(x => new AddEditTournamentModel
                {
                    Member = x.Member,
                    Teams = x.Teams
                }).ToList();

                list.ToList().ForEach(z =>
                {
                    var item = TempList.FirstOrDefault(y => y.Teams.Name == z.Teams.Name);
                    item.Member = z.Member;
                });

                if (TempList.Count(a => a.Member) > 24)
                {
                    MessageBox.Show("You can only select 24 teams", "Too many selections", MessageBoxButton.OK, MessageBoxImage.Error);
                    TeamsList.ItemsSource = temp;
                    TempList = temp;

                    RunFilter();
                }

                SelectedParticipants.Content = $"({TempList.Count(x => x.Member)}/24 selected)";

            }

        }

        private void Close(object sender, RoutedEventArgs e)
        {
            Window.Show();
            Close();
        }

        private void Save(object sender, RoutedEventArgs e)
        {
            if (TeamsList.ItemsSource.Cast<AddEditTournamentModel>().Count(x => x.Member) != 24)
            {
                MessageBox.Show("Please first select 24 teams", "Missing teams", MessageBoxButton.OK, MessageBoxImage.Error);
            } else
            {
                using (var context = new EufaContext())
                {
                    if(Tournaments == null)
                    {
                        var t = new Tournaments
                        {
                            StartDate = (DateTime)StartDay.SelectedDate,
                            EndDate = (DateTime)EndDay.SelectedDate,
                            Name = TournamentsName.Text
                        };
                        context.Tournaments.Add(t);

                        TempList.Where(y => y.Member).ToList().ForEach(x =>
                        {
                            t.TournamentTeams.Add(new TournamentTeams
                            {
                                TournamentId = t.Id,
                                TeamId = x.Teams.Id
                            });
                        });
                        context.SaveChanges();
                    }
                    else
                    {
                        var t = context.Tournaments.First(x => x.Id == Tournaments.Id);
                        t.StartDate = (DateTime)StartDay.SelectedDate;
                        t.EndDate = (DateTime)EndDay.SelectedDate;
                        t.Name = TournamentsName.Text;

                        context.SaveChanges();

                        TempList.Where(y => y.Member).ToList().ForEach(x =>
                        {
                            t.TournamentTeams.Add(new TournamentTeams
                            {
                                TournamentId = t.Id,
                                TeamId = x.Teams.Id
                            });
                        });
                        context.SaveChanges();
                    }

                    (Window as IDraw).Draw();
                    Window.Show();
                    Close();
                }
            }
        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {
            var rb = sender as RadioButton;
            Filter = rb.Content.ToString();
            RunFilter();
        }

        public void CheckBtn()
        {
            if (SaveBtn != null)
                SaveBtn.IsEnabled = !(string.IsNullOrWhiteSpace(TournamentsName.Text) || StartDay == null
                    || StartDay?.SelectedDate == null || EndDay == null || EndDay?.SelectedDate == null
                    || EndDay.SelectedDate < StartDay.SelectedDate);
        }

        private void TournamentsName_SelectionChanged(object sender, RoutedEventArgs e)
        {
            CheckBtn();
        }

        private void Day_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            TournamentsName_SelectionChanged(null, null);
        }
    }
}
