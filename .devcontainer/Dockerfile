FROM elixir

ENV USERNAME=user
ENV USER_UID=1000
ENV USER_GID=$USER_UID

COPY scripts/*.sh /tmp/scripts/

RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until

# Create non-root user user
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && bash /tmp/scripts/user.sh "$USERNAME" "$USER_UID" "$USER_GID" \
    # Clean up
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /root/.gnupg

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs locales inotify-tools gcc g++ make \
    && rm -rf /var/cache/apt \
    && npm install -g yarn \
    && mix local.hex --force \
    && mix local.rebar --force \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

# Cleanup scripts
RUN rm -rf /tmp/scripts

CMD ["sleep", "infinity"]