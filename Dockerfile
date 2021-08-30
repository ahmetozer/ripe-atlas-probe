FROM centos
LABEL org.label-schema.schema-version=1.0 org.label-schema.name="CentOS Base"
ENV container=docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [/sys/fs/cgroup]
CMD ["/usr/sbin/init"]

RUN curl -O 'https://ftp.ripe.net/ripe/atlas/software-probe/centos8/noarch/ripe-atlas-repo-1-2.el8.noarch.rpm' && \
yum install ripe-atlas-repo-1-2.el8.noarch.rpm -y && \
yum install atlasswprobe -y && \
echo 'chown atlas:atlas /var/atlas-probe/etc/' >> cat /etc/rc.local