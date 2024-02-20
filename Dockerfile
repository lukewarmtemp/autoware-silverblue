FROM ghcr.io/ublue-os/silverblue-nvidia:39

RUN rpm-ostree install pip
RUN rpm-ostree install dnf
RUN dnf -y install dnf-plugins-core
RUN dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
RUN dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN umask 022
RUN pip install rocker --user

RUN rm -R /var/roothome/.cache/pip
RUN rm -R /var/roothome/.local/bin
RUN rm -R /var/roothome/.local/lib
RUN rm -R /var/lib
RUN rm -R /var/log
RUN ostree container commit

# RUN useradd -m coreos
# RUN usermod --add-subuids 10000-75535 root
# RUN usermod --add-subuids 10000-75535 root

# RUN useradd -m coreos
# RUN usermod --add-subuids 10000-75535 coreos
# RUN usermod --add-subuids 10000-75535 coreos
# RUN sudo echo "coreos:10000:65536" >> /etc/subuid
# RUN sudo echo "coreos:10000:65536" >> /etc/subgid
# USER coreos

# RUN useradd -m coreos
# RUN usermod --add-subuids 10000-75535 coreos
# RUN usermod --add-subuids 10000-75535 coreos

# USER coreos
# RUN podman system migrate
# USER root
# RUN podman pull ghcr.io/bounverif/autoware-runtime:latest
