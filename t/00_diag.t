use Test2::V0 -no_srand => 1;

eval q{ use Test::Builder };

# please keep in alpha order
my @mods = qw(
  Acme::Alien::DontPanic
  Acme::Ford::Prefect
  Acme::Ford::Prefect::FFI
  Archive::Extract
  Capture::Tiny
  Cwd
  File::ShareDir
  File::Spec
  File::Temp
  File::chdir
  FindBin
  HTML::LinkExtor
  HTTP::Tiny
  Inline
  Inline::C
  Inline::CPP
  List::MoreUtils
  Module::Build
  Perl::OSType
  Shell::Config::Generate
  Shell::Guess
  Sort::Versions
  Test::Alien
  Test::CChecker
  Test::More
  Text::ParseWords
  URI
  parent
);

pass 'okay';

diag '';
diag sprintf "%25s %s", 'perl', $];

foreach my $mod (@mods) {
  my $version = eval qq{ no warnings; require $mod; \$$mod\::VERSION };
  $version = 'undefined' unless defined $version;
  diag sprintf "%25s %s", $mod, $version;
}

done_testing;
