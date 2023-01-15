FROM gitpod/workspace-full-vnc

USER gitpod

RUN bash -c 'VERSION="v18.13.0" \
    && source $HOME/.nvm/nvm.sh && nvm install $VERSION \
    && nvm use $VERSION && nvm alias default $VERSION'

# Install Cypress dependencies.
RUN sudo apt-get update \
 && sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq \
   libgtk2.0-0 \
   libgtk-3-0 \
   libnotify-dev \
   libgconf-2-4 \
   libnss3 \
   libxss1 \
   libasound2 \
   libxtst6 \
   xauth \
   xvfb \
 && sudo rm -rf /var/lib/apt/lists/*

# Install Chromium
RUN sudo apt-get update -q \
 && sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq \
   chromium-browser \
 && sudo rm -rf /var/lib/apt/lists/*
 
RUN echo "nvm use default &>/dev/null" >> ~/.bashrc.d/51-nvm-fix