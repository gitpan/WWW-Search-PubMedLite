use Test::More tests => 14;
BEGIN { use_ok( 'WWW::Search' ) }

my $j;
my $search = new WWW::Search('PubMedLite');

my $pmid = '16402093';
$search->native_query( $pmid );
$j = $search->next_result;

SKIP: {
  skip "couldn't fetch pmid $pmid likely because the NCBI/PubMed server is overloaded; it's probably safe to ignore this error" => 13 unless $j;
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
  is( $j->{pmc_id}, '1760733', 'pmc_id' );
  is( $j->{text_url}, 'http://dx.doi.org/10.1038/sj.bjp.0706444', 'text_url' );
  is( $j->{language}, 'eng', 'language' );
};
