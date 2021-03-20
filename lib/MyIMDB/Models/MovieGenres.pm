package MyIMDB::Models::MovieGenres;
use Mojo::Base -strict;
use parent 'MyIMDB::Models::Object';

__PACKAGE__->set_up_table(
    table => 'movies_genres',
    columns => [ qw(movie_id genre_id) ],
    pk_columns => [ qw(movie_id genre_id) ],
    foreign_keys => [ qw(movies genres) ],
);

#__PACKAGE__->has_a( movie_id => 'MyIMDB::Models::Movies' );
#__PACKAGE__->has_a( genre_id => 'MyIMDB::Models::Genres' );

1;
