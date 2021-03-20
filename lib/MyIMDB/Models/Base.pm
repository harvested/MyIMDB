package MyIMDB::Models::Base;
use Mojo::Base -strict;
use parent 'Rose::DB';

__PACKAGE__->use_private_registry;

__PACKAGE__->register_db(
    driver   => 'SQLite',
    database => 'MyIMDB.db',
    host     => 'localhost',
    username => '',
    password => '',
);

1;
