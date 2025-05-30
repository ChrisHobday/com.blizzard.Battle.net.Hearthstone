# A Hearthstone Flatpak (Unofficial)
## Building
> **_NOTE:_**  With org.wine.Sdk and com.blizzard.Battlenet installed.
```console
flatpak run org.flatpak.Builder build-dir --repo=repo --force-clean com.blizzard.Battlenet.Hearthstone.yml
```
## Installing
```console
flatpak install --user ./repo com.blizzard.Battlenet.Hearthstone
```
## Running
```console
flatpak run com.blizzard.Battlenet.Hearthstone
```
## Removing
```console
flatpak remove com.blizzard.Battlenet.Hearthstone
```
## Troubleshooting
- Check if Flatpak is installed
```console
flatpak list | grep Hearthstone
```
- Enter Flatpak in command line mode
```console
flatpak run --command=sh com.blizzard.Battlenet.Hearthstone
```
## Flatpak locations
- Installation directory             = /var/lib/flatpak/app/com.blizzard.Battlenet.Hearthstone/
- Installation directory (User mode) = ~/.local/share/flatpak/app/com.blizzard.Battlenet.Hearthstone/
- Wine prefix                        = ~/.var/app/com.blizzard.Battlenet/data/wine