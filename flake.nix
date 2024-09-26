{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in
  {
    devShells."x86_64-linux".default = 
      # import ./shell.nix { inherit pkgs; }; # option to include or define below
      pkgs.mkShell {
        packages = [ pkgs.nodejs pkgs.python3 ];
	inputsFrom = [ pkgs.bat ];
	installPhase = ''
	  echo hi
	'';
      };
  };
}
