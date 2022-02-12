# codenoid
# https://gist.github.com/codenoid/4806365032bb4ed62f381d8a76ddb8e6
printf "Checking latest Go version...\n";
LATEST_GO_VERSION="$(curl --silent https://go.dev/VERSION?m=text)";
LATEST_GO_DOWNLOAD_URL="https://golang.org/dl/${LATEST_GO_VERSION}.linux-amd64.tar.gz "

printf "cd to home ($USER) directory \n"
cd "/home/$USER"

printf "Downloading ${LATEST_GO_DOWNLOAD_URL}\n\n";
curl -OJ -L --progress-bar https://golang.org/dl/${LATEST_GO_VERSION}.linux-amd64.tar.gz

printf "Extracting file...\n"
tar -xf ${LATEST_GO_VERSION}.linux-amd64.tar.gz

export GOROOT="/home/$USER/go"
export GOPATH="/home/$USER/go/packages"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

printf '⚠️  ADD (OR REPLACE) THIS LINE BELOW TO YOUR ~/.bashrc  ⚠️
export GOROOT="/home/$USER/go"
export GOPATH="/home/$USER/go/packages"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
\n'

printf "You are ready to Go!\n";
go version
