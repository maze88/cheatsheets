#BASH & SYSTEM
last  # Show a listing of last logged in users.
time COMMAND  # output time taken after completing following COMMAND.
lsb_release -a  # show linux software base release details.
cat /etc/os-release
uname -a  # show system information.
service alsa-utils --full-restart ; pulseaudio --start  # for when audio not working after wake from suspend.
amixer set Master 88%  # adjust volume from terminal.
gsettings list-recursively | grep power  # display settings related to power.
COMMAND | nc termbin.com 9999  # returns url to COMMAND's output for sharing with others.
COMMAND | tee FILE  # runs COMMAND and directs output to stdout and to FILE (can be file or another program).
xhost +SI:localuser:root  # allow root to run gui based apps in wayland.
$(( expression to calculates ))  # [numerically ]evaluates expression.
crunch 6 6 0123456789 -t maze%%  # returns all length 5-6 combinations of pattern mazeXX (followed by digits).
tail -n +2  # outputs from the 2nd line and below.
history -d N  # deletes the Nth entry from history (for example a plain text password).
ls $(echo $PATH | tr ':' ' ') | grep -v '/' | grep . | sort  # list all commands by name
${string:position:length}  # Extracts substring from `$string` of length `$length` at `$position`.
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)  # show all manually installed packages.
printf FOO  # prints FOO, but (unlike echo) without a newline at the end.
tr ' ' '_' < INPUT_FILE  # outputs content of INPUT_FILE, replacing spaces with underscores.
shuf -i 1-6 -n 1  # roll a die.
rename -v 's/OLD/NEW/' **  # substitute all OLD to NEW in all (**) files and folders here. Use -n for dry-run.
grep -rl 'OLD' . | xargs sed -i 's/OLD/NEW/g'  # Substitute all OLD to NEW, recursivley, in all files from here.
sudo dd bs=4M if=path/to/INPUT.iso of=/dev/sdXX status=progress && sync  # flash an image (INPUT.iso) to /dev/sdXX (use lsblk to determine which medium to replace XX).
echo -e '\e[31mTEXT'  # prints TEXT in red (1=bold, 31-37=colors, etc.).
echo -e '\e[2JTEXT'  # prints TEXT flashing.
tar -C ./EXISTING_FOLDER -xvf TARBALL.tar.gz  # extract tarball TARBALL to EXISTING_FOLDER.
echo $XDG_SESSION_TYPE  # check diplay server type
pgrep NAME  # returns pid of process matching name NAME.
exec > >(tee -i FILEPATH) 2>&1  # redirect a script's stdout & stderr to FILEPATH for logging.
sudo sed -i -E 's/.+(set bell-style none)/\1/' /etc/inputrc  # disable annoying bell in bash.
zip -e SECURE.zip A B C  # zip files A, B and C into password encrypted zipfile SECURE.zip.
set -euo  # at start of bash script, exit on errors, undefined variables and broken pipes.
ssh-copy-id -i ~/.ssh/a.key.pub user@host  # given a username, host and public key, it prompts for a password and adds the public key to the host's authorized_keys file.
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub  # generate a public key file (id_rsa.pub) from a private key (id_rsa).
zipinfo ZIPFILE.zip  # list contents of a zipfile ZIPFILE.zip.
sudo dd bs=4M if=~/Downloads/SOME_IMAGE.iso of=/dev/DEVICE conv=fdatasync status=progress  # burn SOME_IMAGE onto flash device /dev/DEVICE.

#JOBS, PROCESSES & SERVICES
ps  # list processes running and id.
htop  # similar to ps, but better interface.
jobs -l  # list jobs running and id.
sudo pkill x  # restarting x seems to help when top menu bar isn't responding.
sudo service lightdm --full-restart  # restarting lightdm seems to help when top menu bar isn't responding.
gnome-session-quit  # lock session when top menu bar isn't responding.
pulseaudio -k && sudo alsa force-reload  # restart audio system in case of fail.
kubectl exec -it mongodb-7749784fc4-98x2s -- mongodump -u mongo -p password --archive --gzip | aws s3 cp - s3://my-mongo-dumps/$(date +'%Y-%m-%d').tar.gz --storage-class STANDARD_IA --sse  # backup mongo tables and save to s3 bucket.

#FILES & FOLDERS
du -sh FILE  # check size of FILE or folder.
shred -uz -v FILE  # unrecoverably remove FILE, verbosely.
gunzip ARCHIVE.gz  # unzip gzip ARCHIVE.
bunzip2 ARCHIVE  # unzip ARCHIVE.
tar -xvzf ARCHIVE  # eXtract ARCHIVE's contents.

#NETWORK
irssi  # command line irc client; /connect freenode ; /join #ubuntu ; /msg nickserv identify maze^1280
iwlist wlp2s0 scanning  # print all wireless networks interface picks up.
certbot certonly --webroot --webroot-path /var/www/html/ --renew-by-default --email michael.52@msn.com --text --agree-tos -d maze88.xyz -d www.maze88.xyz  # renewal of certificate for SSL with let's encrypt over CDN.
nmcli connection up ESSID  # connect to wi-fi with name ESSID.
lsof -i 4tcp:443  # list open connections using [in example] IPv4, TCP protocol, and port 443.
curl v4.ifconfig.co  # API that returns my outward facing IP; add /country for country.
curl ifconfig.me  # API that returns my outward facing IP.
youtube-dl -x --audio-format mp3 --audio-quality 0 https://www.youtube.com/watch?v=ID  # extract and download best mp3 audio quality from link.
netstat -t  # print network connections, on tcp sockets
lsof -i [i]  # list all open file/connections with matching internat address [i].
ss -t4p  # show socket statistics for tcp, ipv4, with process names
netstat -r  # display the kernel routing tables.
nc -lp PORT  # listens on port PORT for connections.
apt-get install iputils-ping  # install ping with apt.
sudo tcpdump -i any net 10.0.0.0/24 and port 80  # dump packets from/to network 10.0.0.0/24 on port 80, traveling through any network interface.
openssl s_client -showcerts -tls1_2 -debug HOST:PORT  # for troubleshooting/examining tls certs

#FUN
curl wttr.in/london?format=4  # get one line format of weather and wind for location.

# DOCKER
usermod -aG docker $USER  # run docker without sudo prefix.
docker stats  # shows live resource use by containers.

# SSL/TLS
openssl x509 -req -in example.com.csr -CA my-ca.crt -CAkey my-ca.key -CAcreateserial -days 365 -out example.com.crt  # sign example.com.csr with my-ca.key
openssl x509  -in CERTIFICATE_FILE -text -noout  # output the contents of CERTIFICATE_FILE.
openssl rand -base64 15  # generate a password of length 15 bytes.

