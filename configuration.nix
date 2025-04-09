{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.cava = ''
		mkdir -p ${home}/.config
	'';

	environment.systemPackages = with pkgs; [
		cava
	];
}
