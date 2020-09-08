namespace EUFA.Db
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TournamentTeams
    {
        public int TeamId { get; set; }

        public int TournamentId { get; set; }

        public int Id { get; set; }

        [StringLength(10)]
        public string GroupCode { get; set; }

        public virtual Teams Teams { get; set; }

        public virtual Tournaments Tournaments { get; set; }
    }
}
