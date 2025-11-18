{ gnumake
, flex
, mkShell
}: mkShell {
  buildInputs = [ gnumake flex ];
}
