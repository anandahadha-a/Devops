
FROM centos:centos7

RUN mkdir -p /local_repo/packages
RUN repotrack -p /local_repo/packages httpd

RUN yum install httpd createrepo -y
RUN rm /etc/yum.repos.d/*.repo
RUN createrepo /my_repo/packages

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY local_repo.repo /etc/yum.repo.d/local_repo.repo
COPY index.html /local_repo
COPY local_repo.repo /local_repo

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apachectl", "-DFOREGROUND" ]
