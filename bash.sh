# system
sudo dd bs=4M if=~/Downloads/IMAGE.iso of=/dev/sdXX status=progress conv=fsync  # create a bootable usb from an imamge (first identify ouput file device using `lsblk`, then unmount with `sudo umount /dev/sdXX`)
uname -a  # show system information.
cat /etc/os-release  # show os details
lsb_release -a  # show linux software base release details.
last  # Show a listing of last logged in users.
ls $(echo $PATH | tr ':' ' ') | grep -v '/' | grep . | sort  # list all commands by name
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)  # show all manually installed packages.
history -d N  # deletes the Nth entry from history (for example a plain text password).
usermod -aG docker $USER  # run docker without sudo prefix.
gnome-session-quit  # lock session when top menu bar isn't responding.
echo $XDG_SESSION_TYPE  # check diplay server type
sudo sed -i -E 's/.+(set bell-style none)/\1/' /etc/inputrc  # disable annoying bell in bash.
xhost +SI:localuser:root  # allow root to run gui based apps in wayland.
gsettings set org.gnome.shell.app-switcher current-workspace-only true  # makes application switcher will cycle only through applications in current workspace.

# files
rename -v 's/OLD/NEW/' **  # substitute all OLD to NEW in all (**) files and folders here. Use -n for dry-run.
shred -uz -v FILE  # unrecoverably remove FILE, verbosely.
tail -n +2  # outputs from the 2nd line and below.

# compressed files
tar -xvzf ARCHIVE.tar.gz  # eXtract ARCHIVE.tar.gz's contents with tar and gunzip.
tar -C ./EXISTING_FOLDER -xvzf TARBALL.tar.gz  # extract tarball TARBALL to EXISTING_FOLDER.
gunzip ARCHIVE.gz  # unzip gzip ARCHIVE.
bunzip2 ARCHIVE  # unzip ARCHIVE.
zip STUFF.zip A B C  # zips all local files A, B and C into STUFF.zip.
zip -e SECURE.zip *.pem *.txt  # zips all local pem and txt files into password encrypted zipfile SECURE.zip.
zipinfo ZIPFILE.zip  # list contents of a zipfile ZIPFILE.zip.
unzip STUFF.zip  # extracts contents of STUFF.zip to current folder.

# network
nc -lp PORT  # listens on port PORT for connections.
nc -vz HOST PORT  # checks if host HOST listens for connection on port PORT
apt install -y iputils-ping  # install ping with apt.
sudo tcpdump -i any net 10.0.0.0/24 and port 80  # dump packets from/to network 10.0.0.0/24 on port 80, traveling through any network interface.
lsof -i 4tcp:443  # list open connections using [in example] IPv4, TCP protocol, and port 443.
curl v4.ifconfig.co  # API that returns my outward facing IP; add /country for country.
curl ifconfig.me  # API that returns my outward facing IP.
lsof -i [i]  # list all open file/connections with matching internat address [i].

# bash & scripting
set -euo  # at start of bash script, exit on errors, undefined variables and broken pipes.
$(( expression to calculates ))  # [numerically ]evaluates expression.
${string:position:length}  # Extracts substring from `$string` of length `$length` at `$position`.
echo -e '\e[31mTEXT'  # prints TEXT in red (1=bold, 31-37=colors, etc.).
echo -e '\e[2JTEXT'  # prints TEXT flashing.
shuf -i 1-6 -n 1  # roll a die.
exec > >(tee -i FILEPATH) 2>&1  # redirect a script's stdout & stderr to FILEPATH for logging.
COMMAND | tee FILE  # runs COMMAND and directs output to stdout and to FILE (can be file or another program).
crunch 6 6 0123456789 -t maze%%  # returns all length 5-6 combinations of pattern mazeXX (followed by digits).

# opensll
openssl x509 -req -in example.com.csr -CA my-ca.crt -CAkey my-ca.key -CAcreateserial -days 365 -out example.com.crt  # sign example.com.csr with my-ca.key
openssl x509  -in CERTIFICATE_FILE -text -noout  # output the contents of CERTIFICATE_FILE.
openssl rand -base64 15  # generate a password of length 15 bytes.
openssl s_client -showcerts -tls1_2 -debug HOST:PORT  # for troubleshooting/examining tls certs
certbot certonly --webroot --webroot-path /var/www/html/ --renew-by-default --email michael.52@msn.com --text --agree-tos -d maze88.dev  # renewal of certificate for ssl with let's encrypt over cdn.

# ssh
ssh-copy-id -i ~/.ssh/a.key.pub user@host  # given a username, host and public key, it prompts for a password and adds the public key to the host's authorized_keys file.
ssh-keygen -y -f ~/.ssh/my.key > ~/.ssh/my.key.pub  # generate a public key file from a private key.

# gpg
gpp --export --armor --output NAME.gpg.pub KEY_NAME  # export public key component from KEY_NAME to file starting with NAME.
gpg --export-secret-keys --output --armor NAME.gpg KEY_NAME  # export private key component from KEY_NAME to file starting with NAME.
gpg --list-keys --keyid-format LONG  # list keys with long id format, good for getting long key id for configuring gitconfig to sign commits.

# misc
curl wttr.in/london?format=4  # get one line format of weather and wind for location.
youtube-dl -x --audio-format mp3 --audio-quality 0 https://www.youtube.com/watch?v=ID  # extract and download best mp3 audio quality from link.
youtube-dl -F https://www.youtube.com/watch?v=ID  # list all available formats of requested video.
youtube-dl -f X https://www.youtube.com/watch?v=ID  # download video in format X (from `-F` list).
COMMAND | nc termbin.com 9999  # returns url to COMMAND's output for sharing with others.

