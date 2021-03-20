package MyIMDB::Models::Movie;
use Mojo::Base -strict;
use parent 'MyIMDB::Models::Object';

__PACKAGE__->meta->setup(
    table      => 'movies',
    columns    => [ qw(movie_id name launch_date duration rating) ],
    pk_columns => 'movie_id',
    unique_key => 'movie_id',
);


__PACKAGE__->meta->make_manager_class('movies');

# do not remove until the setup is fully updated
#__PACKAGE__->has_many( genres => 'MyIMDB::Models::MoviesGenres' );
#__PACKAGE__->has_many( users => 'MyIMDB::Models::UsersMovies' );
#__PACKAGE__->has_many( users_comments => 'MyIMDB::Models::MoviesUsersComments' );

1;
