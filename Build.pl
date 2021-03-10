 use Module::Build;

  Module::Build->new
      ( module_name => 'MyIMDB',
        license => 'perl',
	dist_abstract => 'test tets'
      )->create_build_script;
