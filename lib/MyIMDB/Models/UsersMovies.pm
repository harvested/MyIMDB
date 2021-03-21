package MyIMDB::Models::UsersMovies;
use Mojo::Base -strict;
use parent 'MyIMDB::Models::Object';

__PACKAGE__->meta->setup(
    table      => 'users_movies',
    columns    => ['user_id', 'movie_id', 'rated', 'favorited'],
    pk_columns => ['user_id', 'movie_id'],
);

# __PACKAGE__->has_a( user_id => 'MyIMDB::Models::Users');
# __PACKAGE__->has_a( movie_id => 'MyIMDB::Models::Movies');

1;
