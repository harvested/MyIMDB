package MyIMDB::Models::Genres;
use Mojo::Base -strict;
use parent 'MyIMDB::Models::Object';

__PACKAGE__->meta->setup(
    table      => 'genres',
    columns    => [ qw(genre_id genre) ],
    pk_columns => 'genre_id',
    unique_key => 'genre_id',
);

__PACKAGE__->meta->make_manager_class('genres');

#__PACKAGE__->has_many( movies => 'MyIMDB::Models::MoviesGenres' );

1;
