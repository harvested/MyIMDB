package MyIMDB::Movies;

use strict;
use warnings;

use base 'Mojolicious::Controller';
use MyIMDB::Models::Movies;
use Data::Dumper;

sub details {
	my $self = shift;

	my $id = $self->param('id');

	my $movie = MyIMDB::Models::Movies->retrieve($id);

	my $rank = $movie->rank();

	if ($rank == 0) {
		$movie->{rank} = "No ratings yet";
	} else { 
		$movie->{rank} = $rank;
	}

  my $default = $movie->rank;
  my $vote_options = [
    map{ 
      ["$_" => $_ , ($_ == $default ? ('selected' => 'selected') : () ) ] 
    }(1..5)
  ];
	$self->stash( 
    movie => $movie,
    vote_options => $vote_options
  );
}

sub setRank {
	my $self = shift;

	my $rank = $self->param('rank');
	my $id = $self->param('id');
	
  print Dumper( $rank, $id);
	
  my $movie = MyIMDB::Models::Movies->retrieve($id);
  $movie->rank($rank);
  $movie->update();

	$self->redirect_to(  "movies/details/$id");
}

1;
