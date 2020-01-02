Install cowsay

> xbps-install cowsay

Look for cowsay

> xbps-query -Rs cowsay

Upgrade current packages.  -R looks at repositories, -s makes things sloppy.

> xbps-install -Suv

Remove cowsay

> xbps-remove cowsay

...and all dependencies

> xbps-remove -R cowsay

Reinstall cowsay

> xbps-install -f

Reconfigure all packages.  Useful for breakages.

> xbps-pkgdb -a

Remove all dependencies.

> xbps-remove -o

Show information about cowsay

> xbps-query -RS cowsay

Search for cows

> xbps-query -Rs cows

List packages requiring updates.

> xbps-install -Suvn

List what's required for cowsay

> xbps-query -x cowsay

List what's installed.

> xbps-query -l

Clean.

> xbps-remove -O

apt update

> xbps-install -S

Remove package information.

> xbps-query -R

Display all cowsay files

> xbps-query -Rf cowsay

Do I have cowsay installed?

> xbps-query -s cowsay

What packages are pointless?

> xbps-query -O

> xbps-install -Sn cowsay

A dry-run of installing cowsay, without actually intalling.

# Advanced

> xbps-query -x cowsay

Show cowsay's dependencies.  The -R flag's required for a remote package.

> xbps-query -X cowsay

Show the reverse dependencies of a package.

> xbps-query -XR cowsay

Show all reverse dependencies of a package, including repository packages.

> xbps-query -m

List all manually installed software.

# Problems

Look for broken packages.

> sudo xbps-pkgdb -a

And if you've found any, you might try:

> sudo xbps-reconfigure -af

This reconfigures all packages forcefully.

If that doesn't help the issue, try to find the broken package and forcefully reinstall:

> xbps-query -s gnutls

> sudo xbps-install -f gnutls
