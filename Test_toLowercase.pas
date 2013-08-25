{$R+}
program Test_toLowercase( output );

uses
  lib_seal_toLowercase;

var
  testNumber : 1..maxint;

procedure p_Test( p_input, p_expectedOutput : char );
var
  c : char;
begin
  write( testNumber, ' - ' );
  testNumber := testNumber + 1;
  c := f_ToLowercase( p_input );
  if c = p_expectedOutput then
    writeln( 'Passed' )
  else
    writeln( 'Failed: char returned (''', c, ''') <> char expected to be returned (''', p_expectedOutput, ''')' )
end;

begin
  writeln( '- This program performs the automated black-box testing of the f_ToLowercase function.' );
  writeln( '---' );
  writeln;
  testNumber := 1;
  p_Test( 'a', 'a' );
  p_Test( 'B', 'b' );
  p_Test( '@', '@' );
  writeln;
  writeln( '---' );
  writeln( '- This program will now quit.' )
end.
