{ stdenv, buildGoPackage, fetchFromGitHub, nixosTests }:

buildGoPackage rec {
  pname = "v2ray_exporter";
  version = "0.5.1";

  goPackagePath = "github.com/wi1dcard/v2ray-exporter";


  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "wi1dcard";
    repo = "v2ray-exporter";
    sha256 = "1dqiyy3mj1pid97d986yvz93d80kki71fk1afzzpzkbnas2cd4s3";
  };

  meta = with stdenv.lib; {
    description = "V2Ray Prometheus Exporter";
    homepage = "https://github.com/wi1dcard/v2ray-exporter";
    license = licenses.MIT;
    maintainers = with maintainers; [ ];
  };
}
