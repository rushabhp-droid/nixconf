_: {
  flake.overlays.librepods = _final: prev: {
    librepods = prev.librepods.overrideAttrs (old: {
      qtWrapperArgs = (old.qtWrapperArgs or [ ]) ++ [
        "--set"
        "QT_STYLE_OVERRIDE"
        "Fusion"
        "--set"
        "QT_QUICK_CONTROLS_STYLE"
        "Fusion"
        "--set"
        "WGPU_BACKEND"
        "vulkan"
      ];
    });
  };
}
