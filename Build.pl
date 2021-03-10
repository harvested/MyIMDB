use Module::Build;

	Module::Build->new(
		module_name => 'MyIMDB',
		license => 'perl',
		dist_abstract => 'test tets',
		requires    => { 'Mojolicious'	=> '9.03',
						 'Rose::DB'		=> '0.783',
						 'Roso::DB::Object' => '0.819',
						},

	)->create_build_script;
