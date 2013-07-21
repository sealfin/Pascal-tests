{$R+}
program Test_stringToInteger( output );

uses
  lib_seal_stringToInteger;

var
  testNumber : 1..maxint;

procedure p_Test( p_string : string; p_integerExpected : integer; p_errorExpected : boolean );
var
  passed, b : boolean;
  i : integer;
begin
  write( testNumber, ' - ' );
  testNumber := testNumber + 1;
  passed := true;
  b := f_StringToInteger( p_string, i );
  if b <> p_errorExpected then begin
      passed := false;
      writeln( 'Failed: error (', b, ') <> error expected (', p_errorExpected, ')' )
    end
  else
    if b then
      if i <> p_integerExpected then begin
        passed := false;
        writeln( 'Failed: integer (', i, ') <> integer expected (', p_integerExpected, ')' )
      end;
  if passed then
    writeln( 'Passed' )
end;

begin
  writeln( '- This program performs the automated black-box testing of the f_StringToInteger function.' );
  writeln( '---' );
  writeln;
  testNumber := 1;
  p_Test( '', 0, false );
  p_Test( '+', 0, false );
  p_Test( '-', 0, false );
  p_Test( '0', 0, true );
  p_Test( '+0', 0, true );
  p_Test( '-0', 0, true );
  p_Test( '0+', 0, false );
  p_Test( '0-', 0, false );
  p_Test( '1983', 1983, true );
  p_Test( '+1983', 1983, true );
  p_Test( '-1983', -1983, true );
  p_Test( 'X', 0, false );
  p_Test( '+X', 0, false );
  p_Test( '-X', 0, false );
  writeln;
  writeln( '---' );
  writeln( '- This program will now quit.' )
end.
