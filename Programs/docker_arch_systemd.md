# Run ArchLinux on Docker with SystemD

## DockerFile

```dockerfile
FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm systemd && \
    pacman -Scc --noconfirm

CMD ["/usr/lib/systemd/systemd"]
```

## Launch

```sh
docker run -d --name arch-systemd \
    --tmpfs /tmp \
    --tmpfs /run \
    --tmpfs /run/lock \
    -v /sys/fs/cgroup:/sys/fs/cgroup:rw \
    --cap-add SYS_ADMIN \
    --cap-add NET_ADMIN \
    -e container=docker \
    --stop-signal SIGRTMIN+3 \
    archlinux-systemd
```
