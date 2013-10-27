{$R+}
program Test_stringToReal( output );

uses
  lib_seal_integerToString, lib_seal_stringToReal;

var
  testNumber : 1..maxint;

procedure p_Test( p_string : string; p_realExpected : real; p_fractionalPartLengthExpected : integer; p_errorExpected : boolean );
var
  passed, b : boolean;
  r : real;

  procedure p_private;
  begin
    if b <> p_errorExpected then begin
        passed := false;
        writeln( 'Failed: error (', b, ') <> error expected (', p_errorExpected, ')' )
      end
    else
      if b then
        if r <> p_realExpected then begin
          passed := false;
          writeln( 'Failed: real (', r, ') <> real expected (', p_realExpected, ')' )
        end
  end;

var
  spaces, i : integer;
begin
  write( testNumber, ' - ' );
  spaces := length( f_IntegerToString( testNumber, false ));
  testNumber := testNumber + 1;
  passed := true;
  b := f_StringToReal( p_string, r );
  p_private;
  if passed then
    writeln( 'Passed' );

  for i := 1 to spaces do
    write( ' ' );
  write( ' - (_FractionalPartLength) ' );
  passed := true;
  b := f_StringToReal_FractionalPartLength( p_string, r, i );
  p_private;
  if passed and b then
    if i <> p_fractionalPartLengthExpected then begin
      passed := false;
      writeln( 'Failed: fractional part length (', i, ') <> fractional part length expected (', p_fractionalPartLengthExpected, ')' )
    end;
  if passed then
    writeln( 'Passed' )
end;

begin
  writeln( '- This program performs the automated black-box testing of the f_StringToReal and f_StringToReal_FractionalPartLength functions.' );
  writeln( '---' );
  writeln;
  testNumber := 1;

  p_Test( '', 0, 0, false );
  p_Test( '+', 0, 0, false );
  p_Test( '-', 0, 0, false );
  p_Test( '.', 0, 0, false );
  p_Test( '+.', 0, 0, false );
  p_Test( '-.', 0, 0, false );
  p_Test( '.+', 0, 0, false );
  p_Test( '.-', 0, 0, false );

  p_Test( '0', 0, 0, true );
  p_Test( '+0', 0, 0, true );
  p_Test( '-0', 0, 0, true );
  p_Test( '0.0', 0, 1, true );
  p_Test( '+0.0', 0, 1, true );
  p_Test( '-0.0', 0, 1, true );
  p_Test( '0.', 0, 0, true );
  p_Test( '+0.', 0, 0, true );
  p_Test( '-0.', 0, 0, true );
  p_Test( '.0', 0, 1, true );
  p_Test( '+.0', 0, 1, true );
  p_Test( '-.0', 0, 1, true );

  p_Test( '1983', 1983, 0, true );
  p_Test( '+1983', 1983, 0, true );
  p_Test( '-1983', -1983, 0, true );
  p_Test( '19.83', 19.83, 2, true );
  p_Test( '+19.83', 19.83, 2, true );
  p_Test( '-19.83', -19.83, 2, true );
  p_Test( '1983.', 1983, 0, true );
  p_Test( '+1983.', 1983, 0, true );
  p_Test( '-1983.', -1983, 0, true );
  p_Test( '.1983', 0.1983, 4, true );
  p_Test( '+.1983', 0.1983, 4, true );
  p_Test( '-.1983', -0.1983, 4, true );

  p_Test( 'X', 0, 0, false );
  p_Test( '+X', 0, 0, false );
  p_Test( '-X', 0, 0, false );
  p_Test( 'X.', 0, 0, false );
  p_Test( '+X.', 0, 0, false );
  p_Test( '-X.', 0, 0, false );
  p_Test( '.X', 0, 0, false );
  p_Test( '+.X', 0, 0, false );
  p_Test( '-.X', 0, 0, false );

  writeln;
  writeln( '---' );
  writeln( '- This program will now quit.' )
end.
