{ lib,
  stdenv,
  fetchFromGitHub
}:

stdenv.mkDerivation rec {
    pname = "tokyo-night-btop";
    version = "v1.4.3";

    src = fetchFromGitHub {
        owner = "aristocratos";
        repo = "btop";
        rev = version;
        hash = "sha256-4x2vGmH2dfHZHG+zj2KGsL/pRNIZ8K8sXYRHy0io5IE=";
    };

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r * $out
      runHook postInstall
    '';

    meta = with lib; {
        description = "A clean theme that celebrates the lights of Downtown Tokyo at night.";
        homepage = "https://github.com/aristocratos/btop";
        license = licenses.asl20;
        maintainers = with maintainers; [];
        mainProgram = "btop";
        platforms = platforms.all;
    };
}
