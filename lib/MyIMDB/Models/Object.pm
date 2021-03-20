package MyIMDB::Models::Object;
use Mojo::Base -strict;
use MyIMDB::Models::Base;
use parent 'Rose::DB::Object';

sub init_db { MyIMDB::Models::Base->new() }

1;
