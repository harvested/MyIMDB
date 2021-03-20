package MyIMDB::Models::MoviesUsersComments;
use Mojo::Base -strict;
use parent 'MyIMDB::Models::Base';

__PACKAGE__->set_up_table('movies_users_comments');

__PACKAGE__->has_a( movie_id => 'MyIMDB::Models::Movies' );
__PACKAGE__->has_a( user_id => 'MyIMDB::Models::Users' );

1;
