{ lib, stdenv, fetchurl, atk, glibmm_2_68, pkg-config, gnome, meson, ninja, python3 }:

stdenv.mkDerivation rec {
  pname = "atkmm";
  version = "2.36.1";

  src = fetchurl {
    url = "mirror://gnome/sources/${pname}/${lib.versions.majorMinor version}/${pname}-${version}.tar.xz";
    sha256 = "sha256-4RMkv+0bbjMKAtslzswUXcoD+w3/R/BxDIXjF2h9pFg=";
  };

  outputs = [ "out" "dev" ];

  propagatedBuildInputs = [ atk glibmm_2_68 ];

  nativeBuildInputs = [ pkg-config meson ninja python3 ];

  doCheck = true;

  passthru = {
    updateScript = gnome.updateScript {
      packageName = pname;
      versionPolicy = "odd-unstable";
    };
  };

  meta = {
    description = "C++ wrappers for ATK accessibility toolkit";
    license = lib.licenses.lgpl21Plus;
    homepage = "https://gtkmm.org";
    platforms = lib.platforms.unix;
  };
}
