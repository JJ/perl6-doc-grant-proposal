use ExtUtils::MakeMaker; #-*-cperl-*-

my %make;
if ($ExtUtils::MakeMaker::VERSION > 6.64) {
   $make{META_MERGE} = {
    'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/JJ/perl6-doc-grant-proposal.git',
                web  => 'https://github.com/JJ/perl6-doc-grant-proposal',
            },
        },
    };
}

WriteMakefile(
	      NAME                => 'Perl6::Doc::Grant::Proposal',
	      AUTHOR              => 'JJ Merelo <jj /at/ merelo.net>',
	      VERSION_FROM        => 'lib/Perl6/Doc/Grant/Proposal.pod',
	      ABSTRACT_FROM       => 'lib/Perl6/Doc/Grant/Proposal.pod',
	      LICENSE             => 'gpl',
	      test                => {
				   TESTS           => ['xt/pod.t'],
				  },
    PREREQ_PM => { 
		  'Test::Pod' => 0,
		  'version'    => 0,
		 },
	      dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz' },
	      clean               => { FILES => 'Perl6-Doc-*' }
	     );

#Add new targets
sub MY::postamble {
    return <<'MAKE_FRAG';
docs:
	pod2html --verbose --htmlroot .. --outfile per6-doc-grant.html Perl6/Doc/Grant/Proposal.pod
MAKE_FRAG
}

#Version 0.1
