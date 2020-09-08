namespace EUFA.Db
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class EufaContext : DbContext
    {
        public EufaContext()
            : base("name=Eufa")
        {
        }

        public virtual DbSet<Players> Players { get; set; }
        public virtual DbSet<Position> Position { get; set; }
        public virtual DbSet<Region> Region { get; set; }
        public virtual DbSet<StageGame> StageGame { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Teams> Teams { get; set; }
        public virtual DbSet<Tournaments> Tournaments { get; set; }
        public virtual DbSet<TournamentTeams> TournamentTeams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Position>()
                .HasMany(e => e.Players)
                .WithRequired(e => e.Position)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Teams>()
                .HasMany(e => e.Players)
                .WithRequired(e => e.Teams)
                .HasForeignKey(e => e.Team_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Teams>()
                .HasMany(e => e.StageGame)
                .WithRequired(e => e.Teams)
                .HasForeignKey(e => e.TeamA_Id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Teams>()
                .HasMany(e => e.StageGame1)
                .WithRequired(e => e.Teams1)
                .HasForeignKey(e => e.TeamB_Id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Teams>()
                .HasMany(e => e.TournamentTeams)
                .WithRequired(e => e.Teams)
                .HasForeignKey(e => e.TeamId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tournaments>()
                .HasMany(e => e.StageGame)
                .WithRequired(e => e.Tournaments)
                .HasForeignKey(e => e.TournamentId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tournaments>()
                .HasMany(e => e.TournamentTeams)
                .WithRequired(e => e.Tournaments)
                .HasForeignKey(e => e.TournamentId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TournamentTeams>()
                .Property(e => e.GroupCode)
                .IsFixedLength();
        }
    }
}
