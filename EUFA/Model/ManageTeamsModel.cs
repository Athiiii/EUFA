using EUFA.Db;
using System.Windows.Media.Imaging;

namespace EUFA.Model
{
    public class ManageTeamsModel
    {
        public int Id { get; set; }
        public BitmapImage Flag { get; set; }
        public string Team { get; set; }
        public string Code { get; set; }
        public Teams Teams { private get; set; }

        public Teams GetTeams() => Teams;

    }
}
