include:
  - pkg.make
  - user.haproxy

haproxy-install:
  file.managed:
    - name: /mnt/haproxy-1.6.11.tar.gz
    - source: salt://haproxy/files/haproxy-1.6.11.tar.gz

  cmd.run:
    - name: cd /mnt && tar zxf haproxy-1.6.11.tar.gz && cd haproxy-1.6.11 && make TARGET=linux26 USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 PREFIX=/usr/local/haproxy && make TARGET=linux26 USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 PREFIX=/usr/local/haproxy install
    - creates: /usr/local/haproxy


/etc/haproxy:
  file.directory:
    - mode: 755

/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://haproxy/files/haproxy.cfg

/etc/init.d/haproxy:
  file.managed:
    - source: salt://haproxy/files/haproxy
    - mode: 755

