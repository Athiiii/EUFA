namespace EUFA.Db
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Players
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Lastname { get; set; }

        [StringLength(50)]
        public string Firstname { get; set; }

        [Required]
        [StringLength(50)]
        public string ShirtNumber { get; set; }

        public int PositionId { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime Date_of_birth { get; set; }

        public int Team_id { get; set; }

        public virtual Position Position { get; set; }

        public virtual Teams Teams { get; set; }
        public string PlayerFullname { get => $"{Firstname} {Lastname}"; }
    }
}
