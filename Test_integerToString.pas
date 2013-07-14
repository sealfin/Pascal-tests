{$R+}
program Test_integerToString( output );

uses
  lib_seal_integerToString;

var
  testNumber : 1..maxint;

procedure p_Test( p_integer : integer; p_explicitSign : boolean; p_expectedString : string );
var
  s : string;
begin
  write( testNumber, ' - ' );
  testNumber := testNumber + 1;
  s := f_IntegerToString( p_integer, p_explicitSign );
  if s = p_expectedString then
    writeln( 'Passed' )
  else
    writeln( 'Failed: string returned (''', s, ''') <> string expected to be returned (''', p_expectedString, ''')' )
end;

begin
  writeln( '- This program performs the automated black-box testing of the f_IntegerToString function.' );
  writeln( '---' );
  writeln;
  testNumber := 1;
  p_Test( 0, false, '0' );
  p_Test( 0, true, '0' );
  p_Test( 1983, false, '1983' );
  p_Test( 1983, true, '+1983' );
  p_Test( -1983, false, '-1983' );
  p_Test( -1983, true, '-1983' );
  writeln;
  writeln( '---' );
  writeln( '- This program will now quit.' )
end.
