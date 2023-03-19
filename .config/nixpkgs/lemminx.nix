{ pkgs ? import <nixpkgs_unstable> {} }:
let
    my_version = "0.24.0";
    os_name = if pkgs.stdenv.isLinux then "linux" else "osx-x86_64";
    download_url = "https://github.com/redhat-developer/vscode-xml/releases/download/${my_version}/lemminx-${os_name}.zip";
    file_name = "lemminx-${os_name}";
in
pkgs.stdenv.mkDerivation rec {
  pname = "lemminx-binary";
  version = my_version;

  src = pkgs.fetchzip {
    url = download_url;
    sha256 = if pkgs.stdenv.isLinux
        then "sha256-7psi6rU7e4jN/D1CgB9Uf7NfPRHFNNiXJD5GsRk8hX8="
        else "sha256-D18djuCGrqXYVcs5J/KxS5Qg677BQVPS9agwc+RaerY=";
  };

  nativeBuildInputs = if pkgs.stdenv.isDarwin then [] else [
    pkgs.autoPatchelfHook
  ];

  buildInputs = if pkgs.stdenv.isDarwin then [] else [
    pkgs.glibc
    pkgs.gcc-unwrapped
  ];

  inherit file_name;

  installPhase = ''
    mkdir -p $out/bin
    cp $file_name $out/bin/lemminx
  '';

  meta = {
    homepage = "https://github.com/redhat-developer/vscode-xml";
    description = "Lemminx XML Language Server";
    platforms = [
        "x86_64-darwin"
        "aarch64-darwin"
        "x86_64-linux"
    ];
  };
}
