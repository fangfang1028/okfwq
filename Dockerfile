FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install wine qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget neofetch screen vim -y
RUN tar -xvf v1.2.0.tar.gz
RUN mkdir  /root/.vnc
RUN echo 'qq859806951' | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
RUN cp /noVNC-1.2.0/vnc.html /noVNC-1.2.0/index.html
RUN echo 'cd /root' >>/luo.sh
RUN echo "su root -l -c 'vncserver :2000 -geometry 1440x760' "  >>/luo.sh
RUN echo 'cd /noVNC-1.2.0' >>/luo.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 80 ' >>/luo.sh
RUN echo root:qq859806951|chpasswd
RUN chmod 755 /luo.sh
EXPOSE 80
CMD  /luo.sh
