# beersmith2-docker
Running Beersmith 2 using Docker for non supported OSs

Right now, this is primarily ready for Linux OSs and hasn't been tested anywhere other than Fedora 28

# Acknowledgements
This awesome blog post on X11 forwarding in Docker: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/

# Prerequisites
 * Docker installed
 * Latest version of beersmith 2 downloaded
 * selinux permissions set appropriately for X11 forwarding

# Setup
 * Create a folder in your home directory and copy the dockerfile there, along with the latest version of Beersmith 2 (make sure the filenames match what is in the dockerfile)
 * Build the image: `docker build -t beersmith .`
 * Make an easy command: `echo "docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.beersmith2:/home/developer/.beersmith2   beersmith" > beersmith2 && chmod +x beersmith2`
