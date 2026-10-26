{
  description = "Basic HTML Guest Example"

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    microvm = {
      url = "github:microvm-nix/microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, microvm, ... }: {
    nixosConfigurations.nixstead-example = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        microvm.nixosModules.microvm
        {
          networking.hostName = "nixstead-example";
          microvm = {
            hypervisor = "qemu";
            vcpu = 1;
            mem = 512;
          };

          
        }
      ];
    };
  };
}