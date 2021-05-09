{ lib, stdenv, buildGoModule, fetchFromGitHub, nixosTests }:

# buildGoModule rec {
#   name = "v2ray-exporter";
#   rev = "6d12e69bdeb9a34ff687f78ed1a695ad996242f9";
#   # goPackagePath = "github.com/abowloflrf/v2ray_exporter";


#   src = fetchFromGitHub {
#     rev = rev;
#     owner = "abowloflrf";
#     repo = "v2ray-exporter";
#     sha256 = "0iqsfwz74lw4zbzqxqnhw71rps96a6nhkgcjk0ln6zsdwzwlwqcg";
#   };

#   vendorSha256 = "1raknwgblv42dm2jx5vvbjdddhq5l0s9z1mmhhklv15l0j8hi3ji";

#   meta = with stdenv.lib; {
#     description = "V2Ray Prometheus Exporter";
#     homepage = "https://github.com/abowloflrf/v2ray_exporter";
#     # license = licenses.mit; # no license???
#     maintainers = with maintainers; [ ];
#   };
# }

buildGoModule rec {
  pname = "v2ray-exporter";
  version = "0.5.1";

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "wi1dcard";
    repo = "v2ray-exporter";
    sha256 = "1dqiyy3mj1pid97d986yvz93d80kki71fk1afzzpzkbnas2cd4s3";
  };

  vendorSha256 = "048bc48nvh4aw4iv20nk99ggmp0db8yb0rziljg6l6zjjvilwdrp";

  meta = with stdenv.lib; {
    description = "V2Ray Prometheus Exporter";
    homepage = "https://github.com/wi1dcard/v2ray-exporter";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}