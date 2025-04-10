{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.cava = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/cava
		mkdir ${home}/.config/cava
		chown ${username}:${group} ${home}/.config/cava
		chmod 700 ${home}/.config/cava

		cp ${./config} ${home}/.config/cava/config
		chown ${username}:${group} ${home}/.config/cava/config
		chmod 600 ${home}/.config/cava/config
	'';

	environment.systemPackages = with pkgs; [
		cava
	];
}
