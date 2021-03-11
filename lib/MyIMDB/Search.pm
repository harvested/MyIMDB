package MyIMDB::Search;
use Mojo::Base 'Mojolicious::Controller';
use MyIMDB::Models::Actor;
use MyIMDB::Models::Movie;

use Data::Dump qw/dump/;
# use DDP;

#use MyIMDB::Models::Genres;
#use MyIMDB::Models::MoviesGenres;

my $SEARCH_METHODS = {
	actors => 'search_actors',
	movies => 'search_movies',
	genres => 'MyIMDB::Models::Genres',
};

sub home {
	my $self = shift;
    
	$self->render();
}

sub search {
	my $self = shift;
    my $search_query = $self->param('query');
    my $search_type = $self->param('type');

    my $method = $SEARCH_METHODS->{$search_type};
    my $result = $self->$method($search_query);    
	
    my $search_result;
    my @search_result;
	my @movies;
	my @genres;
		
	# 	#search for the genre_id in the Genres table
	# 	@genres = MyIMDB::Models::Genres->search_like(genre => "%$search_query%");
		
	# 	foreach my $genre (@genres) {
	# 		my $genre_id = $genre->id();

	# 		#iterate over the joining table to get every movie_id for that genre
	# 		my $it = MyIMDB::Models::MoviesGenres->search_like(genre_id => "$genre_id");

	# 		eval {
	# 			while (my $mv = $it->next) {
	# 				my $movie = MyIMDB::Models::Movies->retrieve(%{$mv->movie_id});
	# 				push @movies, $movie;
	# 			}
	# 		}
	# 	}
	# }

	$self->render( 
		search_query => \$search_query,
		search_type => $search_type,
		search_result => $result,
		movies => \@movies,
		genres => \@genres,
	);
}


sub search_movies {
    my ($self, $query) = @_;
   
    my $found_movies = MyIMDB::Models::Movie::Manager->get_movies(
        query => [ 
        	name => { like => "%$query%" },
        ],
    );
    
    return $found_movies;
}

sub search_actors {
	my ($self, $query) = @_;

	my $found_actors = MyIMDB::Models::Actor::Manager->get_actors(
		 query => [ 
        	or => [
        		last_name => { like => "%$query%" },
	        	first_name => { like => "%$query%" },
        	]
        ],
	);

	return $found_actors;
}

1;
