use strictures 1;
# disable the "Useless use of anonymous list ([]) in void context"
# warning so we can perl -c this file during development
no warnings 'void';
[
  data_structure =>
  {
    sv_undef => undef,
    sv_iv => 3,
    sv_nv => 4.2,
    sv_pv => "spoon",
    ref_scalar => \"foo\nbar",
    ref_array => [ 1, \undef, "73" ],
  }
],
[
  cross_refs =>
    do {
      my ($x, $y, $z) = (\1, { two => 2 }, [ three => 3 ]);
      +{
        one => $x,
        two => $y,
        three => $z,
        inner => {
          one => $x,
        },
        inner2 => [
          three => $z,
        ]
      };
    }
],
do { sub DDXSTest::foo { 'DDXSTest::foo' } () },
[
  global_sub => { foo => \&DDXSTest::foo }
];
