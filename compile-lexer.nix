{ flex
, gcc
, stdenv

, src
, lexer-name
}: stdenv.mkDerivation {
  name = "compile-lexer";

  inherit src;

  buildInputs = [
    gcc
    flex
  ];
  buildPhase = ''
    flex ${lexer-name}.lex
    gcc lex.yy.c -o automata -L${flex}/lib -lfl
  '';

  installPhase = ''
    mkdir $out;
    cp automata $out
  '';
}
