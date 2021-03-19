package MyIMDB::User;
use strict;
use warnings;
use base 'Mojolicious::Controller';
use Mojo::ByteStream 'b';
use MyIMDB::Models::User;

use Data::Dumper;

# this method is used to render users details, or homepage
# it retrieves the username from the url
# and cosntruct 2 arrays with users favorite movies and actors
sub home {
	my $self = shift;

	# I'm gettin the user name from the URL 
	# because visitors and also other loged users can 
	# view this user's profiles
	my $user_name = $self->param('user_name');
	my $user_id = $self->param('id');

	# these two arrays will contain object instances from movies and actors table
	my @favorited_movies;
	my @favorited_actors;

	my $user = MyIMDB::Models::User->new(user_id => $user_id);
	my $result;
	eval { $result = $user->load; };
	if ($@) {
		$self->flash(error => "user doesn't exit");
		return $self->render(template => 'user/no_user');
	}


	# #iterate through all the movies from users_movies table for this user
	# foreach ($user->movies) {
	# 	#if the movie is marked as favorited push the object into @favorited_movies 
	# 	if ($_->favorited) {
	# 		push (@favorited_movies, $_);
	# 	}
	# }

	#print Dumper( $user->actors );
	#for favorited actors it's the same as for favorited movies	
	# foreach( $user->actors ){
	# 	if( $_->favorited ){
	# 		push( @favorited_actors, $_ );
	# 	}
	# }

	$self->session(user => $user);
	$self->session(name => $user->user_name);
	$self->render(
		user_name => $user_name,
		favorited_movies => \@favorited_movies,
		favorited_actors => \@favorited_actors,
	);
}

# this method is used for login
# it receives the user name and password from the login template 
# via POST request 
sub login {
	my $self = shift;
	
	# #get username and password from template
	# my $user_name = $self->param('name');
	# my $password = $self->param('pwd')

	# if (MyIMDB::Models::Users->sql_login_count->select_val($user_name, b($password)->md5_sum) == 1 ){
	# 	$self->session( name => $user_name );
	# 	return $self->redirect_to( "/user/$user_name" );
	# }
				   
	# $self->stash( error => 1 );
}

# this method is called whenever we want to make sure a user is logged in or not
sub is_logged {
	my $self = shift;
	
	if($self->session('name')){
		return 1;
	}

	$self->flash(login => 'You have to login first');
	$self->redirect_to('/login');
	return 0;  
}

# this method is called when the users wants to log out
# it just expires the session and redirects to home page
sub logout {
	my $self = shift;
	$self->session(expires => 1);
	$self->redirect_to('/');
}

# this method is used to create new user accounts
# it takes user name, password and email address 
# as input parameters via POST request
sub create_account {
	my $self = shift;
	my $user_name = $self->param('user_name');
	my $password = $self->param('pwd');
	my $retype_pwd = $self->param('re-pwd');
	my $email_addr = $self->param('email');

	#check if we already have a user with the same user name or email address
	my $error = $self->validate($user_name, $password, $retype_pwd, $email_addr);
	$self->flash(error => $error);
	$self->redirect_to("/join");
	return if $error;

	#if not, we create a new user
	my $user = MyIMDB::Models::User->new(
		user_name => $user_name,
		password => b($self->param('pwd'))->md5_sum,
		email => $self->param('email')
	);
	$user->save;
	
	$self->session(loggedUser => $user);				 
	#auto-login the user
	$self->session(name => $user_name);
	$self->redirect_to("/user/$user->user_id");
}

# basic validation
# TO BE RE-IMPLEMENTED properly
sub validate {
	my ($self, $user, $pass, $pass2, $email) = @_;

	return 'username field must not be blank' unless $user and length $user;
	return 'password field must not be blank' unless $pass and length $pass;
	return 'please re-type your password' unless $pass2 and length $pass2;
	return 'passwords don\'t match' unless $pass eq $pass2;
	return 'email field must not be blank' unless $email and length $email;
	return 'not e valid email address, must be like \'name@service.domain\'' 
		unless $email =~ /\w+@\w+\.\w+/i;

	return 0;
}

1;
