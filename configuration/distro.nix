{ system, config, pkgs, lib, ... }:
let
  version = "26.03";
  distroName = "CupsOS";
  codeName = "gaba";
in
{
  # system.nixos = {
  #   distroName = lib.mkForce distroName;
  #   # codeName = lib.mkForce codeName;
  # };
  #
  # environment.etc."os-release".text = lib.mkForce ''
  #   PRETTY_NAME="${distroName} ${version} ${codeName}"
  #   NAME="${distroName}"
  #   ID=${distroName}
  #   ID_LIKE=nixos
  #   VERSION_ID="${version}"
  #   VERSION_CODENAME=${codeName}
  #   HOME_URL="https://github.com/acup1/nixos"
  # '';
  #
  # environment.etc.motd.text = ''
  #                                 .                      
  #                                 &x                     
  #                               $&&                      
  #                             &&&&.  &                   
  #                           &&&&&  X&&                   
  #                          &&&&+ &&&&                    
  #                          &&&& :&&;                     
  #                          X&&&  &&                      
  #                            &&&  &&                     
  #
  #                                    .....::::::;;;      
  #            &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&      
  #            &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&      
  #       &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&+     
  #     &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&X     
  #    &&&&:   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&+     
  #   &&&&     &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&      
  #   &&&&     $&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&      
  #   &&&&      &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&      
  #    &&&&X    $&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&       
  #     &&&&&&.  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&       
  #       &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&        
  #           &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&         
  #                 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&          
  #                  &&&&&&&&&&&&&&&&&&&&&&&&&&.           
  #                    &&&&&&&&&&&&&&&&&&&&&&&             
  #                      +&&&&&&&&&&&&&&&&&+               
  # '';
  # environment.etc.issue.text = ''
  #   ${distroName} \n \l
  # '';
  # system.nixos.label =
  #   "${distroName}-${builtins.substring 0 8 (toString builtins.currentTime)}";
  #
  # # networking.hostName = "cupsos";
  # boot.kernelParams = [ "utsrelease=${distroName}" ];
  # environment.etc."hostname".text = distroName;
  # environment.variables = {
  #   NIXOS_OS_RELEASE = lib.mkForce "${distroName} ${version}";
  # };
}
