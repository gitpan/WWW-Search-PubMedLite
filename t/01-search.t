use Test::More tests => 25;
BEGIN { use_ok( 'WWW::Search' ) }

my $search = new WWW::Search('PubMedLite');
$search->native_query( '16402093' );

my $j = $search->next_result;
ok( $j, 'fetched article' );

SKIP: {
  skip "couldn't fetch article" => 1 unless $j;
  is( $j->{year}, 2006, 'pub year' );
  is( $j->{month}, 'Jan', 'pub month' );
  is( $j->{title}, 'The glutamate story.', 'title' );
  is( $j->{volume}, '147 Suppl 1', 'volume' );
  is( $j->{pmid}, '16402093', 'pmid' );
  is( $j->{journal}, 'British journal of pharmacology', 'journal' );
  is( $j->{journal_abbreviation}, 'Br. J. Pharmacol.', 'journal abbrev' );
  is( $j->{affiliation}, 'Department of Pharmacology, MRC Centre for Synaptic Plasticity, School of Medical Sciences, University of Bristol, BS8 1TD. jeffwatkins@onetel.com', 'affiliation' );
  is( $j->{author}, 'Watkins JC, Jane DE', 'author' );
  is( $j->{doi}, '10.1038/sj.bjp.0706444', 'doi' );
}

$search->native_query('17456544');
$j = $search->next_result;
ok( $j, 'fetched article' );

SKIP: {
  skip "couldn't fetch article" => 1 unless $j;
  is( $j->{author}, 'Dorsch MP, Lee JS, Lynch DR, Dunn SP, Rodgers JE, Schwartz T, Colby E, Montague D, Smyth SS', 'author loop' );
}

$search->native_query('10467587');
$j = $search->next_result;
ok( $j, 'fetched article' );

SKIP: {
  skip "couldn't fetch article" => 1 unless $j;
  is( $j->{year}, '1994', 'medline pub year' );
}

$search->native_query('6530236');
$j = $search->next_result;
ok( $j, 'fetched article' );

SKIP: {
  skip "couldn't fetch article" => 1 unless $j;
  is( $j->{author}, 'Padmanabhan TK, Chandra Dutt GS, Vasudevan DM, Vijayakumar', 'author with no forename' );
}

$search->native_query('12426784');
$j = $search->next_result;
ok( $j, 'fetched article' );

SKIP: {
  skip "couldn't fetch article" => 1 unless $j;
  is( $j->{language}, 'hun', 'language' );
}

$search->native_query('17999832');
$j = $search->next_result;
ok( $j, 'fetched article' );

SKIP: {
  skip "couldn't fetch article" => 1 unless $j;
  is( $j->{journal_abbreviation}, 'Compr Ophthalmol Update', 'journal abbreviation using MedlineTA' );
}

$search->native_query('8683469');
$j = $search->next_result;
ok( $j, 'fetched article' );

SKIP: {
  skip "couldn't fetch article" => 1 unless $j;
  is( $j->{text_url}, 'http://www.jphysiol.org/cgi/pmidlookup?view=long&pmid=8683469', 'text_url' );
  is( $j->{journal}, 'The Journal of physiology', 'journal title' );
}
