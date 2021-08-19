#BASH & SYSTEM
last  # Show a listing of last logged in users.
echo -e  # echo a string with escape chars enabled.
time COMMAND  # output time taken after completing following COMMAND.
lsb_release -a  # show linux software base release details.
uname -a  # show system information.
service alsa-utils --full-restart ; pulseaudio --start  # for when audio not working after wake from suspend.
grep -v pattern  # search for pattern in output, returning all *non*-matches.
amixer set Master 88%  # adjust volume from terminal.
update-grub  # pushes changes from /etc/default/grub to actual booter.
gsettings list-recursively | grep power  # display settings related to power.
prime-select query  # show which gpu is in use.
prime-select intel/nvidia  # set gpu to use (requires re-login).
COMMAND | nc termbin.com 9999  # returns url to COMMAND's output for sharing with others.
COMMAND | tee FILE  # runs COMMAND and directs output to stdout and to FILE (can be file or another program).
xhost +SI:localuser:root  # allow root to run gui based apps in wayland.
mv -v -t DESTINATION `ls | grep IDENTIFIER`  # moves all file in current dir that match IDENTIFIER to DESINATION.
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
echo "boqןpodl"  # pretty divider.
ESC=$'\e'; tr -cd 0-9 < /dev/urandom | fold -w ${COLUMNS}  | while read line; do sleep 0.0$(shuf -i 1-9 -n 1); sed -E "s/(.{$((RANDOM%COLUMNS))})(.)(.*)/${ESC}[32m\1${ESC}[0m${ESC}[32;1m\2${ESC}[0m${ESC}[32m\3${ESC}[0m/" <<< "${line}"; done  # matrix waterfall code

#GIT
git tag --delete foo  # removes tag foo.
git config core.sshCommand 'ssh -i KEYFILE -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'  # set KEY from ssh keypair login to git repo.
git checkout COMMIT_HASH PATH/TO/MESSEDUP/FILE  # checkout older version of just one specific file.
git branch -a | cut -c3- | cut -d' ' -f 1 | xargs git grep "STRING"  # search for the string STRING in all local and remote branches.
git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//'  # experimental command for looking up "parent" branch of current commit.
git branch -d BRANCHNAME  # delete a local branch.
git push origin -d BRANCHNAME  # delete a remote branch.
git pull origin master  # fetch remote branch origin/master and merge it into HEAD.?
git describe --tag --abbrev=0 --candidates=1  # prints the most recent git tag (preferable for this branch).
git describe --tag `git rev-list --tags --max-count=1`  # prints the most recent tag reachable.
git revert HEAD~1  # make a new commit that reverts the previous one
git remote add origin https://TOKEN@github.com/USER/REPO.git  # sets access token to remote USER/REPO (don't forget first to `git remote remove origin`!)


#DOCKER
usermod -aG docker $USER  # run docker without sudo prefix.
docker stats  # shows live resource use by containers.

#KUBERNETES
kubectl port-forward svc/kibana 5601  # expose kibana service over localhost:5601.
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.7/components.yaml  # setup monitoring with metrics-server, then can use `kubectl top ...`.
kubectl get pods -o custom-columns='NAME:metadata.name,IMAGE:spec.containers[*].image'  # list images used in all containers in all pods.
kubectl expose deployment web-deployment --name web-svc --port=80 --target-port=5000  # imperativley create service web-svc for deployment web-deployment.
kubectl wait --for=condition=available deployment web  # wait for deployment 'web' to be available.
kubectl wait --for=condition=ready pod -l app=foo  # wait for pods with label 'app=foo' to be ready.
kubectl wait --for=condition=complete job/myjob  # wait for job 'myjob' to be complete.
kubectl patch service web -p "$(cat patch.yaml)"  # patch elements from patch.yaml in web's configuration.
kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.contexts[?(@.context.user=='aws-user')].name}"  # returns name of context that has 'aws-user' from specific 'my-kube-config' file.
kubectl port-forward PODNAME HOSTPORT:PODPORT  # forward a port from within a pod (its container) to my localhost.
kubectl get -o custom-columns=NAME:.metadata.name,PORTS:.spec.ports[*].port svc  # get all external ports of all services.
kubectl patch configmap www -p "$(cat patch.yaml)"  # applied changes in patch.yaml to configmap 'www'.

#SSL/TLS
openssl x509 -req -in example.com.csr -CA my-ca.crt -CAkey my-ca.key -CAcreateserial -days 365 -out example.com.crt  # sign example.com.csr with my-ca.key
openssl x509  -in CERTIFICATE_FILE -text -noout  # output the contents of CERTIFICATE_FILE.
openssl rand -base64 15  # generate a password of length 15 bytes.

#MYSQL
SELECT [DISTINCT] firstName, lastName FROM members WHERE height > 170 AND (age % 2 = 0 OR age = 33);  # returns [unique] values of columns 'firstName' & 'lastName' from the table 'members', for people higher than 170 and with an even age or exactly 33y/o.
SELECT CONCAT("there are ", COUNT(col), " of these") FROM TABLE WHERE col IN ("x", "y") AND NOT = "z";  # pseudo query demonstrating `CONCAT` and `IN`.
SUBSTRING(city, 1, 1)  # function returns first letter of `city`.

#K8S/MINIKUBE/HELM
# when running helm on minikube, use `--set service.type=NodePort` in case service was expecting LoadBalancer.
eval $(minikube docker-env)  # exports the minikube VM to local env, in which we can (for instance) build a docker image directly into minikube.
minikube service SERVICENAME --url  # display the relative local url for SERVICENAME on minikube node.
minikube tunnel  # TBD

#JENKINS & GROOVY
curl localhost:8080/env-vars.html  # list of build-in available to all jenkins shell scripts.
stash(includes: 'target/', name: 'build_output')  # stashes a workspace artifact (such as 'target/') between stages/workers in a jenkins pipeline.
unstash('build_output')  # retrieves above stashed artifact to current workspace.
script{x = sh(returnStdout: true, script: 'echo value').trim()}  # capture shell output into var x.
Jenkins.instance.getItemByFullName("JOBNAME").updateNextBuildNumber(666)  # input in 'manage jenkins'->'script console'. changes the next build's number to 666 for job JOBNAME.
println "Job type: ${Jenkins.getInstance().getItem('MYJOB').getClass()}"  # input in 'manage jenkins'->'script console'. prints the job type of job MYJOB.
mvn help:effective-pom -Doutput=/tmp/effective-pom.xml  # save effective-pom.xml to output file.
(x, y, z) = v.tokenize(".")  # split string at dots to variables.

#VIM
:.,$s/\vREGEX/\r/g  # substitute all(g) REGEX between current line(.) and end of file ($) with \r (new line).
:set ft=python  # syntax highlighting in vim.
"+y  # yank to the + register (clipboard).
"+p  # paste from the + register (clipboard).
%  # jump to opening/closing bracket.
:set paste  # allows correct pasting into vim when auto-indent is on.
ctrl+N  # insert next matching word (ctrl+P for previous).
ci"  # change inside next quotes (works also with va{ etc.).
O  # insert mode in new line above.
o  # insert mode in new line below.
s  # insert mode replacing current cursor char.
rX  # replace current cursor char with X.
C  # replace (change) text from cursor to end of line.
#  # jump to previous occurence of current word.
*  # jump to next occurence of current word.
J  # joins current line with next line.
5 >>  # indents 5 lines in by $shiftwidth (configured in vimrc).
ctrl+t  # in insert mode, indents line by $shiftwidth
ctrl+d  # in insert mode, outdents line by $shiftwidth
sudo -e /etc/hosts  # edit /etc/hosts as root
sudo -E vim /etc/hosts  # edit /etc/hosts by running vim as root, but preserve current user's environment and ~/.vimrc
