{
  pkgs,
  home,
  lib,
  ...
}: {
  home.activation.applyCtrlCmdMap = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo "Applying Ctrl↔⌘ mapping via hidutil..."
    /usr/bin/hidutil property --set '
      {
        "UserKeyMapping": [
          {
            "HIDKeyboardModifierMappingSrc": 0x7000000E3,
            "HIDKeyboardModifierMappingDst": 0x7000000E7
          },
          {
            "HIDKeyboardModifierMappingSrc": 0x7000000E7,
            "HIDKeyboardModifierMappingDst": 0x7000000E3
          }
        ]
      }'
  '';
}
