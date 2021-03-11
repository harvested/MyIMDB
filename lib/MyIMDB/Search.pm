package MyIMDB::Search;
use Mojo::Base 'Mojolicious::Controller';
use MyIMDB::Models::Actor;
use MyIMDB::Models::Movie;
use MyIMDB::Models::Genres;
use Data::Dump qw/dump/;

my $SEARCH_METHODS = {
	actors => 'search_actors',
	movies => 'search_movies',
	genres => 'search_genres',
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
    my (@movies, @genres);

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

    return MyIMDB::Models::Movie::Manager->get_movies(
        query => [ 
        	name => { like => "%$query%" },
        ],
    );
}

sub search_actors {
	my ($self, $query) = @_;

	return MyIMDB::Models::Actor::Manager->get_actors(
		 query => [ 
        	or => [
        		last_name => { like => "%$query%" },
	        	first_name => { like => "%$query%" },
        	]
        ],
	);
}

sub search_genres {
	my ($self, $query) = @_;

	return MyIMDB::Models::Genres::Manager->get_genres(
		query => [
			genre => { like => "%$query%"},
		],
	);
}

1;
