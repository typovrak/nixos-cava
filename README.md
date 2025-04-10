# nixos-cava

nixos-cava = fetchGit {
	url = "https://github.com/typovrak/nixos-cava.git";
	ref = "main";
};

(import "${nixos-cava}/configuration.nix")
