# beersmith2-docker
Running Beersmith 2 using Docker for non supported OSs

# Prerequisites
 * Docker installed
 * Latest version of beersmith 2 downloaded
 * selinux permissions set appropriately for X11 forwarding

# Setup
 * Create a folder in your home directory and copy the dockerfile there, along with the latest version of Beersmith 2 (make sure the filenames match what is in the dockerfile)
 * Build the image: `docker build -t beersmith .`
 * Make an easy command: `echo "docker run -ti --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.beersmith2:/home/developer/.beersmith2   beersmith" > beersmith2 && chmod +x beersmith2`
