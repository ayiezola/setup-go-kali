echo "Installing dependencies and tools"

# installing tools using apt
apt update
apt install -y golang jq

# config golang variable
echo "export GOPATH=\$HOME/go" >> ~/.zshrc
echo "export PATH=\$GOPATH/bin:$PATH" >> ~/.zshrc
echo "unalias gf" >> ~/.zshrc
source ~/.zshrc

# installing subfinder
echo "install subfinder"
cd /opt
git clone https://github.com/projectdiscovery/subfinder.git
cd subfinder/v2/cmd/subfinder
go build . 
mv subfinder /usr/local/bin/

# installing gf
echo "install gf"
cd /opt
git clone https://github.com/tomnomnom/gf.git
sleep 1
go get -u github.com/tomnomnom/gf

# installing gf patterns
echo "install gf patterns"
cp -r /opt/gf/examples ~/.gf
cd /opt
git clone https://github.com/1ndianl33t/Gf-Patterns
cp /opt/Gf-Patterns/*.json ~/.gf

# Download custom sqli dorks
wget -O sqli.json https://raw.githubusercontent.com/ayiezola/sqli.json/main/sqli.json

# installing httpx
echo "install httpx"
cd /opt
git clone https://github.com/projectdiscovery/httpx.git
cd httpx/cmd/httpx
go build .
mv httpx /usr/local/bin/

# installing tools using go
echo "install go"
go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/waybackurls
go get -u github.com/tomnomnom/anew
go get -u github.com/dwisiswant0/unew

# Install python
apt install python3-pip -y
reboot
