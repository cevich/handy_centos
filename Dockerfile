FROM registry.centos.org/centos/centos
MAINTAINER cevich@redhat.com
ENV container="docker"
RUN yum update -y && \
    yum clean all && \
    rm -rf /var/cache/yum
ADD ["/Dockerfile", "/pre_installed_rpms", "/root/"]
RUN ls /root && \
    yum install -y epel-release findutils && \
    cat /root/pre_installed_rpms | xargs yum install -y && \
    yum clean all && \
    rm -rf /var/cache/yum
