# A riglet is a type of nix module that packages tools, config and skills for an AI agent

_self:
{ pkgs, riglib, ... }:
{
  config.riglets.port-usage = {
    meta = {
      description = "Find out which ports are currently used by what";
      intent = "cookbook";
      version = "0.1.0";
      whenToUse = [
        "Troubleshooting port usage"
        "Inspect network use on this machine"
      ];
    };

    tools = [ pkgs.lsof ];

    docs = riglib.writeFileTree {
      "SKILL.md" = ''
        Run `lsof -i :<PORT>` to get information on which process is currently using a port
      '';
    };

    promptCommands.find-process-using.template = ''
      Find out which process is using port $1
    '';
  };
}
