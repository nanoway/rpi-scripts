cd ~
yes Y | sudo apt-get install ocaml
wget http://www.seas.upenn.edu/~bcpierce/unison//download/releases/unison-2.48.1/unison-2.48.1.tar.gz
tar -zxvf unison-2.48.1.tar.gz
cd unison-2.48.1/
sudo make UISTYLE=text
sudo cp -r ../unison-2.48.1 /opt/
cd /usr/bin
sudo ln -s /opt/unison-2.48.1/unison unison

