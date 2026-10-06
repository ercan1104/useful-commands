# Open website from .url file

Command `bash -c 'url=$(grep -m1 -E "^(URL|BASEURL)=" "%f" | sed -E "s/^(URL|BASEURL)=//" | tr -d "\r"); xdg-open "$url"'`

## On Dolphin

Context menu -> Properties -> Change button -> In application Preference Order Add button -> type the above command

## On Thunar

Context menu -> Properties -> Open with other application -> Use a custom command -> type the above command