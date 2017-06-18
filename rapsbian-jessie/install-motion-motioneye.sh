echo "bcm2835-v4l2" | sudo tee -a /etc/modules
yes Y | sudo aptitude install python-tornado python-jinja2 python-imaging motion ffmpeg v4l-utils
yes Y | wget https://github.com/ccrisan/motioneye/wiki/precompiled/ffmpeg_3.1.1-1_armhf.deb
yes Y | sudo dpkg -i ffmpeg_3.1.1-1_armhf.deb
yes Y | sudo apt-get remove libavcodec-extra-56 libavformat56 libavresample2 libavutil54
yes Y | sudo apt-get install python-pip python-dev curl libssl-dev libcurl4-openssl-dev libjpeg-dev libx264-142 libavcodec56 libavformat56 libmysqlclient18 libswscale3 libpq5
yes Y | sudo apt-get -f install
yes Y | sudo wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb
yes Y | sudo dpkg -i pi_jessie_motion_4.0.1-1_armhf.deb
yes Y | sudo apt-get install python-pycurl
yes Y | sudo pip install motioneye
sudo mkdir -p /etc/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
sudo mkdir -p /var/lib/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service
sudo systemctl daemon-reload
sudo systemctl enable motioneye
sudo systemctl start motioneye

