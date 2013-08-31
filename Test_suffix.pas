{$R+}
program Test_suffix( output );

uses
  lib_seal_suffix;

var
  testNumber : 1..maxint;

procedure p_Test( p_input : integer; p_expectedOutput : string );
var
  s : string;
begin
  write( testNumber, ' - ' );
  testNumber := testNumber + 1;
  s := f_Suffix( p_input );
  if s = p_expectedOutput then
    writeln( 'Passed' )
  else
    writeln( 'Failed: string returned (''', s, ''') <> string expected to be returned (''', p_expectedOutput, ''')' )
end;

begin
  writeln( '- This program performs the automated black-box testing of the f_Suffix function.' );
  writeln( '---' );
  writeln;
  testNumber := 1;
  p_Test( 1, 'st' );
  p_Test( 2, 'nd' );
  p_Test( 3, 'rd' );
  p_Test( 4, 'th' );
  p_Test( 11, 'th' );
  p_Test( 12, 'th' );
  p_Test( 13, 'th' );
  p_Test( 14, 'th' );
  p_Test( 101, 'st' );
  p_Test( 102, 'nd' );
  p_Test( 103, 'rd' );
  p_Test( 104, 'th' );
  p_Test( 111, 'th' );
  p_Test( 112, 'th' );
  p_Test( 113, 'th' );
  p_Test( 114, 'th' );
  writeln;
  writeln( '---' );
  writeln( '- This program will now quit.' )
end.
