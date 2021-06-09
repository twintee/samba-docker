FROM alpine:3.13

RUN mkdir -p /samba/share && \
    chmod -R 0777 /samba/share && \
    chown -R nobody:nobody /samba/share

# install samba
RUN apk update && \
    apk add --no-cache samba bash
EXPOSE 139 445

# start smbd as foreground
ENTRYPOINT ["/bin/ash"]
CMD ["-c", "nmbd restart -D && smbd restart -FS --no-process-group </dev/null"]