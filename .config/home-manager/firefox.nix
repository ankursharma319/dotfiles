{ stdenv, lib, fetchurl, undmg }:

stdenv.mkDerivation rec {
  pname = "Firefox";
  version = "130.0";

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r Firefox.app "$out/Applications/Firefox.app"
    '';

  src = fetchurl {
    name = "Firefox-${version}.dmg";
    url = "https://ftp.mozilla.org/pub/firefox/releases/${version}/mac/en-GB/Firefox%20${version}.dmg";
    sha256 = "ipc40wnDcC+W/XrzvxA1qF8xpBS5DaPLfKLJk+fIOSY=";
  };

  meta = with lib; {
    description = "The Firefox web browser";
    homepage = "https://www.mozilla.org/en-GB/firefox";
    platforms = platforms.darwin;
  };
}
