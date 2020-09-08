namespace EUFA.Db
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StageGame")]
    public partial class StageGame
    {
        public int Id { get; set; }

        public int TeamA_Id { get; set; }

        public int TeamB_Id { get; set; }

        public int TournamentId { get; set; }

        [StringLength(20)]
        public string Stage { get; set; }

        public int? TeamAGoals { get; set; }

        public int? TeamBGoals { get; set; }

        public bool? OnGoing { get; set; }

        public virtual Teams Teams { get; set; }

        public virtual Teams Teams1 { get; set; }

        public virtual Tournaments Tournaments { get; set; }
    }
}
