{ lib, fetchFromGitHub, buildLinux, linux_zen, ... } @ args:

let
  version = "5.14.11";
  suffix = "lqx1";
in

buildLinux (args // {
  modDirVersion = "${version}-${suffix}";
  inherit version;
  isZen = true;

  src = fetchFromGitHub {
    owner = "zen-kernel";
    repo = "zen-kernel";
    rev = "v${version}-${suffix}";
    sha256 = "sha256-4SSAcI1TwaKgz/bwma+YQtIBtodEAYxqdtUI3ESM7I8=";
  };

  extraMeta = {
    branch = "5.14/master";
    maintainers = with lib.maintainers; [ atemu ];
    description = linux_zen.meta.description + " (Same as linux_zen but less aggressive release schedule)";
  };

} // (args.argsOverride or { }))
