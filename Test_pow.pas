{$R+}
program Test_pow( output );

uses
  lib_seal_pow;

var
  testNumber : 1..maxint;

procedure p_Test( p_base, p_exponent : integer; p_expectedOutput : real );
var
  r : real;
begin
  write( testNumber, ' - ' );
  testNumber := testNumber + 1;
  r := f_Pow( p_base, p_exponent );
  if r = p_expectedOutput then
    writeln( 'Passed' )
  else
    writeln( 'Failed: output (', r, ') <> expected output (', p_expectedOutput, ')' )
end;

begin
  writeln( '- This program performs the automated black-box testing of the f_Pow function.' );
  writeln( '---' );
  writeln;
  testNumber := 1;

  p_Test( 2, 0, 1 );
  p_Test( 2, 1, 2 );
  p_Test( 2, 2, 4 );
  p_Test( 2, 3, 8 );

  p_Test( -2, 0, 1 );
  p_Test( -2, 1, -2 );
  p_Test( -2, 2, 4 );
  p_Test( -2, 3, -8 );

  p_Test( 2, -1, 0.5 );
  p_Test( 2, -2, 0.25 );
  p_Test( 2, -3, 0.125 );

  p_Test( -2, -1, -0.5 );
  p_Test( -2, -2, 0.25 );
  p_Test( -2, -3, -0.125 );

  writeln;
  writeln( '---' );
  writeln( '- This program will now quit.' )
end.
