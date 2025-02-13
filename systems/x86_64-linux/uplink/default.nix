{ pkgs, ... }:
{
  facter.reportPath = ./facter.json;

  node.tags = [ "server" ];

  # topology.self = {
  #   hardware.info = "burst";
  #   services.k8s.name = "k8s";
  # };

  hardware.disk.single = {
    enable = true;
    device_id = "nvme-Samsung_SSD_990_PRO_2TB_S73WNJ0W310395L";
  };

  hardware.networking.enable = true;

  services.ssh.enable = true;
  programs.dconf.enable = true;

  system = {
    nix.enable = true;
    security.doas.enable = true;
  };

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    # Any particular packages only for this host
    wget
    vim
    git
    doas
    doas-sudo-shim
  ];

  services = {
    rpcbind.enable = true; # needed for NFS
  };

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "24.11";
  # ======================== DO NOT CHANGE THIS ========================
}
