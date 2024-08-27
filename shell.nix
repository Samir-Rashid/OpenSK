{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    python3
    virtualenv openocd
    rustup cargo openssl openssl.dev #openssl_1_1 openssl_1_1.dev #openssl openssl #openssl.dev # llvm
  ];

PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
# OPENSSL_INCLUDE_DIR = (
#   lib.makeSearchPathOutput "dev" "include" [ pkgs.openssl.dev ]
# ) + "/openssl";
# OPENSSL_STATIC = "0";
# OPENSSL_DEV=pkgs.openssl.dev;
    # export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"
    # export OPENSSL_DEV="${pkgs.openssl.dev}";

    # "${pkgs.openssl.dev}/lib"
    
        # export OPENSSL_LIB_DIR="/nix/store/q46sbq9pgf58xb8zx5vlkbv96kidglxc-openssl-3.0.14/lib"
  OPENSSL_NO_VENDOR = 1;
  OPENSSL_DEV=pkgs.openssl.dev;

    # export OPENSSL_NO_VENDOR=1
    # export OPENSSL_LIB_DIR="${pkgs.lib.getLib pkgs.openssl}/lib"

    # export OPENSSL_INCLUDE_DIR="/nix/store/186zrvnvshgqlzzkqsy2r0nvdbj6cakw-openssl-3.0.14-dev/include"
  shellHook = ''
    unset OBJCOPY
    unset OBJDUMP
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    echo "warning: be sure to add elf2tab/bin to your PATH to be able to run the installed binaries"
  '';
}
# export PATH="/home/mod/Documents/github/OpenSK/elf2tab/bin/:/$PATH"
# python3 deploy.py --board=nrf52840dk_opensk --opensk --disable-check-patches --verbose-build --panic-console --debug


# Terminal 1
# JLinkExe -device nrf52 -if swd -speed 1000 -autoconnect 1
# Terminal 2
# JLinkRTTClient
