use Module::Build;

Module::Build->new(
	module_name		=> 'MyIMDB',
	license			=> 'perl',
	dist_abstract	=> 'A pet project that works as IMDB.com',
	requires    	=> { 'Mojolicious'	=> '9.03',
						 'Rose::DB'		=> '0.783',
						},
)->create_build_script;
