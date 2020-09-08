using EUFA.Db;
using EUFA.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace EUFA.Manager
{
    /// <summary>
    /// Interaction logic for AllocateTeams.xaml
    /// </summary>
    public partial class AllocateTeams : Window
    {
        public List<GroupModel> GroupAList { get; set; } = new List<GroupModel>();
        public List<GroupModel> GroupBList { get; set; } = new List<GroupModel>();
        public List<GroupModel> GroupCList { get; set; } = new List<GroupModel>();
        public List<GroupModel> GroupDList { get; set; } = new List<GroupModel>();
        public List<GroupModel> GroupEList { get; set; } = new List<GroupModel>();
        public List<GroupModel> GroupFList { get; set; } = new List<GroupModel>();

        public AllocateTeams(Tournaments tournaments)
        {
            InitializeComponent();
            DataContext = this;
            Tournaments = tournaments;

            LoadTeams();
            CreateShortNames(GroupAList, "A");
            CreateShortNames(GroupBList, "B");
            CreateShortNames(GroupCList, "C");
            CreateShortNames(GroupDList, "D");
            CreateShortNames(GroupEList, "E");
            CreateShortNames(GroupFList, "F");
        }

        private void CreateShortNames(List<GroupModel> groupList, string letter)
        {
            for (int i = 0; i < 4; i++)
            {
                groupList.Add(new GroupModel { Shortname = $"{letter}{i + 1}" });
            }
        }

        public Tournaments Tournaments { get; }
        public Window Window { get; }
        public List<Teams> TeamsLocalList { get; private set; }

        private void LoadTeams()
        {
            using (var context = new EufaContext())
            {
                TeamsLocalList = context.TournamentTeams.Where(x => x.TournamentId == Tournaments.Id)
                    .Select(y => y.Teams)
                    .ToList();
                TeamsList.ItemsSource = TeamsLocalList.OrderBy(x => x.Name);
            }
        }

        private void Random(object sender, RoutedEventArgs e)
        {
            var list = TeamsLocalList.OrderBy(x => Guid.NewGuid());
            list.ToList().ForEach(y =>
            {
                if (MoveIfSpace(GroupAList, y) || MoveIfSpace(GroupBList, y) || MoveIfSpace(GroupCList, y)
                || MoveIfSpace(GroupDList, y) || MoveIfSpace(GroupEList, y) || MoveIfSpace(GroupFList, y)) { }
                TeamsLocalList.Remove(TeamsLocalList.FirstOrDefault(x => x.Name == y.Name));
            });
            TeamsList.ItemsSource = TeamsLocalList;
            TeamsList.Items.Refresh();
            GroupA.Items.Refresh();
            GroupB.Items.Refresh();
            GroupC.Items.Refresh();
            GroupD.Items.Refresh();
            GroupE.Items.Refresh();
            GroupF.Items.Refresh();
        }

        private bool MoveIfSpace(List<GroupModel> groupList, Teams y)
        {
            var sucess = false;
            groupList.ForEach(x =>
            {
                if (x.GetTeams() == null && !sucess)
                {
                    sucess = true;
                    x.Teams = y;
                    x.Team = y.Name;
                }
            });
            return sucess;
        }

        private void MoveToA(object sender, RoutedEventArgs e)
        {
            var item = (sender as MenuItem).Tag as Teams;
            MoveTeam(item, GroupAList);
        }

        private void MoveToB(object sender, RoutedEventArgs e)
        {
            var item = (sender as MenuItem).Tag as Teams;
            MoveTeam(item, GroupBList);
        }

        private void MoveToC(object sender, RoutedEventArgs e)
        {
            var item = (sender as MenuItem).Tag as Teams;
            MoveTeam(item, GroupCList);
        }

        private void MoveToD(object sender, RoutedEventArgs e)
        {
            var item = (sender as MenuItem).Tag as Teams;
            MoveTeam(item, GroupDList);
        }

        private void MoveToE(object sender, RoutedEventArgs e)
        {
            var item = (sender as MenuItem).Tag as Teams;
            MoveTeam(item, GroupEList);
        }

        private void MoveToF(object sender, RoutedEventArgs e)
        {
            var item = (sender as MenuItem).Tag as Teams;
            MoveTeam(item, GroupFList);
        }

        public void MoveTeam(Teams team, List<GroupModel> groupModels)
        {
            if (groupModels.Where(x => x.Team != null).Count() == 4)
            {
                MessageBox.Show("There are already to many Team", "Limit achieved", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (groupModels.FirstOrDefault(x => x.Team == team.Name) != null)
            {
                MessageBox.Show("This team is already in this team", "Already assinged to team", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                DeleteFromEverywhere(team);
                var done = false;
                groupModels.ForEach(y =>
                {
                    if (y.GetTeams() == null && !done)
                    {
                        done = true;
                        y.Team = team.Name;
                    }
                });
                var sucess = TeamsLocalList.Remove(TeamsLocalList.FirstOrDefault(y => y.Name == team.Name));
                GroupA.Items.Refresh();
                GroupB.Items.Refresh();
                GroupC.Items.Refresh();
                GroupD.Items.Refresh();
                GroupE.Items.Refresh();
                GroupF.Items.Refresh();
                TeamsList.ItemsSource = TeamsLocalList.OrderBy(x => x.Name);
                TeamsList.Items.Refresh();
            }
        }

        private void DeleteFromEverywhere(Teams team)
        {
            GroupAList.ForEach(x => { if (x.Team == team.Name) { x.Team = string.Empty; x.Teams = null; } });
            GroupBList.ForEach(x => { if (x.Team == team.Name) { x.Team = string.Empty; x.Teams = null; } });
            GroupCList.ForEach(x => { if (x.Team == team.Name) { x.Team = string.Empty; x.Teams = null; } });
            GroupDList.ForEach(x => { if (x.Team == team.Name) { x.Team = string.Empty; x.Teams = null; } });
            GroupEList.ForEach(x => { if (x.Team == team.Name) { x.Team = string.Empty; x.Teams = null; } });
            GroupFList.ForEach(x => { if (x.Team == team.Name) { x.Team = string.Empty; x.Teams = null; } });

        }

        private void Close(object sender, RoutedEventArgs e)
        {
            new ManageExecution(Tournaments).Show();
            Close();
        }

        private void Save(object sender, RoutedEventArgs e)
        {
            if (TeamsLocalList.Count != 0)
            {
                MessageBox.Show("You have to assign every team before saving", "Missing team assignment", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                using (var context = new EufaContext())
                {

                    GroupAList.ForEach(x => { var teamId = x.GetTeams().Id; context.TournamentTeams.First(y => y.TeamId == teamId && y.TournamentId == Tournaments.Id).GroupCode = x.Shortname; });
                    GroupBList.ForEach(x => { var teamId = x.GetTeams().Id; context.TournamentTeams.First(y => y.TeamId == teamId && y.TournamentId == Tournaments.Id).GroupCode = x.Shortname; });
                    GroupCList.ForEach(x => { var teamId = x.GetTeams().Id; context.TournamentTeams.First(y => y.TeamId == teamId && y.TournamentId == Tournaments.Id).GroupCode = x.Shortname; });
                    GroupDList.ForEach(x => { var teamId = x.GetTeams().Id; context.TournamentTeams.First(y => y.TeamId == teamId && y.TournamentId == Tournaments.Id).GroupCode = x.Shortname; });
                    GroupEList.ForEach(x => { var teamId = x.GetTeams().Id; context.TournamentTeams.First(y => y.TeamId == teamId && y.TournamentId == Tournaments.Id).GroupCode = x.Shortname; });
                    GroupFList.ForEach(x => { var teamId = x.GetTeams().Id; context.TournamentTeams.First(y => y.TeamId == teamId && y.TournamentId == Tournaments.Id).GroupCode = x.Shortname; });
                    context.SaveChanges();

                }

                GenerateGroupGames();
                new ManageExecution(Tournaments).Show();
                Close();
            }
        }

        private void GenerateGroupGames()
        {
            using (var context = new EufaContext())
            {
                var list = context.TournamentTeams.Where(x => x.TournamentId == Tournaments.Id);
                var baseLetter = "A";
                while("ABCDEF".Contains(baseLetter))
                {
                    var tt = list.Where(x => x.GroupCode.StartsWith(baseLetter));
                    var a = $"{baseLetter}1";
                    var b = $"{baseLetter}2";
                    var c = $"{baseLetter}3";
                    var d = $"{baseLetter}4";

                    context.StageGame.Add(new StageGame
                    {
                        Stage = "GroupStage",
                        TeamA_Id = tt.First(y => y.GroupCode == a).TeamId,
                        TeamB_Id = tt.First(y => y.GroupCode == b).TeamId,
                        TournamentId = Tournaments.Id
                    });
                    context.StageGame.Add(new StageGame
                    {
                        Stage = "GroupStage",
                        TeamA_Id = tt.First(y => y.GroupCode == c).TeamId,
                        TeamB_Id = tt.First(y => y.GroupCode == d).TeamId,
                        TournamentId = Tournaments.Id
                    });
                    context.StageGame.Add(new StageGame
                    {
                        Stage = "GroupStage",
                        TeamA_Id = tt.First(y => y.GroupCode == b).TeamId,
                        TeamB_Id = tt.First(y => y.GroupCode == d).TeamId,
                        TournamentId = Tournaments.Id
                    });
                    context.StageGame.Add(new StageGame
                    {
                        Stage = "GroupStage",
                        TeamA_Id = tt.First(y => y.GroupCode == a).TeamId,
                        TeamB_Id = tt.First(y => y.GroupCode == c).TeamId,
                        TournamentId = Tournaments.Id
                    });
                    context.StageGame.Add(new StageGame
                    {
                        Stage = "GroupStage",
                        TeamA_Id = tt.First(y => y.GroupCode == d).TeamId,
                        TeamB_Id = tt.First(y => y.GroupCode == a).TeamId,
                        TournamentId = Tournaments.Id
                    });
                    context.StageGame.Add(new StageGame
                    {
                        Stage = "GroupStage",
                        TeamA_Id = tt.First(y => y.GroupCode == b).TeamId,
                        TeamB_Id = tt.First(y => y.GroupCode == c).TeamId,
                        TournamentId = Tournaments.Id
                    });

                    switch (baseLetter)
                    {
                        case "A":
                            baseLetter = "B";
                            break;
                        case "B":
                            baseLetter = "C";
                            break;
                        case "C":
                            baseLetter = "D";
                            break;
                        case "D":
                            baseLetter = "E";
                            break;
                        case "E":
                            baseLetter = "F";
                            break;
                        default:
                            baseLetter = "Z";
                            break;
                    }
                }
                context.SaveChanges();
            }
        }
    }
}
