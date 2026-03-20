{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "dark_plus";

      editor = {
        line-number         = "relative";
        cursor-shape.insert = "bar";
        auto-save           = true;
        completion-trigger-len = 1;
      };

      keys.normal = {
        space.space = "file_picker";   # SPC SPC to open files
      };
    };
  };
}
