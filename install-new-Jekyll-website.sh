cd ~
mkdir -p ~/git
cd git
sudo gem install jekyll bundler
jekyll new nanoway.github.io
cd nanoway.github.io
bundle exec jekyll serve

