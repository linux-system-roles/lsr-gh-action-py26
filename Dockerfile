FROM quay.io/linux-system-roles/lsr-gh-action-py26_base_image
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
