{...}: {
  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        # Stolen: https://github.com/dreamsofcode-io/escapecontrol/blob/main/linux/kanata/caps2esc.kbd
        config = ''
          ;; Caps to escape/control configuration for Kanata

          (defsrc
            caps
          )

          (defalias
            escctrl (tap-hold 100 100 esc lctl)
          )

          (deflayer base
            @escctrl
          )
        '';
      };
    };
  };
}
