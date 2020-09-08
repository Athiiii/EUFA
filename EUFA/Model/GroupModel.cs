using EUFA.Db;

namespace EUFA.Model
{
    public class GroupModel
    {
        public string Shortname { get; set; }
        public string Team { get; set; }
        public Teams Teams { private get; set; }

        public Teams GetTeams() => Teams;
    }
}
