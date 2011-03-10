#! /bin/sh

set -e

have_ext=$(if test -e ext/automake.mk; then echo yes; else echo no; fi)
for opt
do
    case $opt in
        (--enable-ext) have_ext=yes ;;
        (--disable-ext) have_ext=no ;;
        (--help) cat <<EOF
$0: bootstrap OpenFlow from a Git repository
usage: $0 [OPTIONS]
The recognized options are:
  --enable-ext      include openflowext
  --disable-ext     exclude openflowext
By default, openflowext is included if it is present.
EOF
        exit 0
        ;;
        (*) echo "unknown option $opt; use --help for help"; exit 1 ;;
    esac
done

# Generate list of files in debian/ to distribute.
(echo '# Automatically generated by boot.sh (from Git tree).' &&
 printf 'EXTRA_DIST += \\\n' &&
 git ls-files debian | grep -v '^debian/\.gitignore$' | 
 sed -e 's/\(.*\)/	\1 \\/' -e '$s/ \\//') > debian/automake.mk

# Enable or disable ext.
if test "$have_ext" = yes; then
    echo 'Enabling openflowext...'
    echo 'include ext/automake.mk' > ext.mk
    echo 'm4_include([ext/configure.m4])' > ext.m4
    cat debian/control.in ext/debian/control.in > debian/control
    for d in $(cd ext/debian && git ls-files --exclude-from=debian/dontlink)
    do
        test -e debian/$d || ln -s ../ext/debian/$d debian/$d
        if ! fgrep -q $d debian/.gitignore; then
            echo "Adding $d to debian/.gitignore"
            (cat debian/.gitignore && printf '/%s' "$d") \
		| LC_ALL=C sort > tmp$$ \
                && mv tmp$$ debian/.gitignore
        fi
    done
else
    echo 'Disabling openflowext...'
    echo '# This file intentionally left blank.' > ext.mk
    echo '# This file intentionally left blank.' > ext.m4
    cat debian/control.in > debian/control
fi

# Bootstrap configure system from .ac/.am files
autoreconf --install -I config --force