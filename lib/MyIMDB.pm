package MyIMDB;

use Mojo::Base 'Mojolicious';
use Data::Dump qw/dump/;


# This method will run once at server start
sub startup {
    my $self = shift;

    # Documentation browser under "/perldoc"
    # $self->plugin('PODRenderer');

    # Routes
    my $r = $self->routes;
  
    # Normal route to controller
    # Home page routes
    $r->get('/')->to('search#home');
    $r->get('/search')->to('search#search');

    # Login and logout routes
    $r->get('/login')->to( template => 'users/login' );
    $r->post('/login')->to('users#login');
    $r->get('/logout')->to('users#logout');

    # Join routes
    $r->get('/join')->to( template => 'users/join' );
    $r->post('/join')->to('users#join');


    $r->get('/actor/:id')->to('actor#details');
    
    # Actors routes
    # my $actor = $r->get('/actor/:id')->to(controller => 'actor');
    my $actor = $r->get('/actor/:id')->to('actor#details');
    # my $actor = $r->get('/actor/:id')->to('actor#details');
    # $actor->get('/')->to(action => 'details');

    # we create an routing bridge (Mojo 6: under) to check if the user is logged in or not
    $actor->under('/')->to('users#auth')->post('/mark')->to('actors#markFavorite');

    # Movies routes
    my $movie = $r->get('/movies/:id')->to(controller => 'movies');
    $movie->get('/')->to(action => 'details');
    $movie->get('/buy')->to('basket#buyMovie');

    $movie->under('/')->to('users#auth')->post('/rate')->to('movies#setRate');
    $movie->under('/')->to('users#auth')->post('/mark')->to('movies#markFavorite');
    $movie->under('/')->to('users#auth')->post('/comment')->to('movies#comment');

    # Users routes
    $r->get('/user/#user_name')->to('users#home');

    # Basket routes
    my $basket = $r->get('/basket')->to(controller => 'basket');
    $basket->get('/view')->to(action => 'view');
    $basket->get('/update')->to(action => 'update');
    $basket->get('/empty')->to(action => 'empty');
    $basket->get('/delete/:id')->to(action => 'delete');
    $basket->get('/checkout')->to(action => 'checkout');
    $basket->get('/send')->to(action =>'sendEmail');

    # Admin routes
    $r->get('/admin/login')->to(template => 'admins/login');
    $r->post('/admin/login')->to('admins#login');

    # this bridge (Mojo 6: under) is used to always check if and admin is logged in or not
    # so that the actions below will execute or...not 
    my $admin = $r->under('/admin')->to('admins#auth');
    $admin->get('/')->to(controller => 'admins');
    $admin->get('/#admin_name')->to(action => 'home');
    $admin->get('/users/all')->to(action => 'allUsers');
    $admin->get('/users/:id/delete')->to(action => 'deleteUser');
    $admin->get('/users/search')->to(action => 'searchUsers');
    $admin->get('/users/#user_name')->to(action => 'userDetails');

    # Error routes
    $r->get('/404')->to(template => 'errors/404');
}

1;
