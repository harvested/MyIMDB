package MyIMDB;
use Mojo::Base 'Mojolicious';


# This method will run once at server start
sub startup {
    my $self = shift;

    # Documentation browser under "/perldoc"
    # $self->plugin('PODRenderer');

    # Routes
    my $r = $self->routes;

    $r->get('/' => sub { shift->redirect_to('search') });

    # MyIMDB::Search controller routes
    my $search = $r->get('/search')->to(controller => 'search');
    $search->get('/')->to(action => 'home');
    $search->get('/:type/:query' => [type => ['actors', 'movies', 'genres']])
           ->to('search#search');
    $search->get('/results')->to('search#search');


    # User Login and logout routes
    # my $user = $r->get('/user')->to(controller => 'user');
    $r->get('/login')->to(template => 'user/login');
    $r->post('/login')->to('user#login');
    $r->get('/logout')->to('user#logout');

    # User Join routes
    $r->get('/join')->to(template => 'user/create_user');
    $r->post('/join')->to('user#create_user');
    
    # MyIMDB::Actor controller routes
    my $actor = $r->get('/actor/')
                  ->to(controller => 'actor');
    $actor->get('/<id:num>')
          ->to(action => 'details_by_id');
    $actor->get('/:name' => [name => qr/[a-zA-Z]+/])
          ->to(action => 'details_by_name');

    # we create an routing bridge (Mojo 6: under) to check if the user is logged in or not
    $actor->under('/')
          ->to('users#is_logged')
          ->post('/mark')
          ->to('actors#markFavorite');

    # MyIMDB::Movies routes
    my $movie = $r->get('/movie/<id:num>')
                  ->to(controller => 'movie');
    $movie->get('/')
          ->to(action => 'details_by_id');
    $movie->get('/buy')
          ->to('basket#buyMovie');

    $movie->under('/')->to('users#is_logged')->post('/rate')->to('movies#setRate');
    $movie->under('/')->to('users#is_logged')->post('/mark')->to('movies#markFavorite');
    $movie->under('/')->to('users#is_logged')->post('/comment')->to('movies#comment');

    # MyIMD::User routes
    my $user = $r->get('/user/')
                 ->to(controller => 'user');
    $user->get('/<id:num>')
         ->to(action => 'view_user');

    # Basket routes
    my $basket = $r->get('/basket')
        ->to(controller => 'basket');
    $basket->get('/view')
           ->to(action => 'view');
    $basket->get('/update')
           ->to(action => 'update');
    $basket->get('/empty')
           ->to(action => 'empty');
    $basket->get('/delete/<id:num>')
           ->to(action => 'delete');
    $basket->get('/checkout')
           ->to(action => 'checkout');
    $basket->get('/send')
           ->to(action =>'sendEmail');

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
