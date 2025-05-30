#!/bin/sh
WINEPREFIX="$(echo ${HOME})/.var/app/com.blizzard.Battlenet/data/wine" # Required to reset the WINEPREFIX here because Wine does not like the relative path set in the manifest

echo "Running Wineboot"
wineboot

# echo "Updating registry"
# wine regedit /app/share/WineGraphics.reg
# sleep 3

echo "Setting up Discord rich presence"
for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i ||
    ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

echo "Checking if Battle.net is already installed"
if [ -d "${WINEPREFIX}/drive_c/Program Files (x86)/Battle.net/" ]; then
  echo "Battle.net is installed"

  echo "Changing directory to ${WINEPREFIX}/drive_c/Program Files (x86)/Battle.net/"
  cd "${WINEPREFIX}/drive_c/Program Files (x86)/Battle.net/"

  echo "Launching Battle.net with Hearthstone flag"
  wine "${WINEPREFIX}/drive_c/Program Files (x86)/Battle.net/Battle.net.exe" --exec="launch WTCG"

  # TODO: Figure out why Hearthstone app remains running when Battle.net closes
else
  echo "Battle.net is not installed"

  echo "Launching Battle.net Flatpak"
  flatpak-spawn --host flatpak run com.blizzard.Battlenet
fi