{
    lib,
    stdenv,
    fetchFromGitHub
}:

stdenv.mkDerivation rec {
    pname = "tokyo-night-bat";
    version = "v4.11.0";

    src = fetchFromGitHub {
        owner = "folke";
        repo = "tokyonight.nvim";
        rev = version;
        hash = "sha256-pMzk1gRQFA76BCnIEGBRjJ0bQ4YOf3qecaU6Fl/nqLE=";
    };
    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r * $out
      runHook postInstall
    '';

    meta = with lib; {
        description = "A clean theme that celebrates the lights of Downtown Tokyo at night.";
        homepage = "https://github.com/folke/tokyonight.nvim";
        license = licenses.asl20;
        maintainers = with maintainers; [];
        mainProgram = "btop";
        platforms = platforms.all;
    };
}
