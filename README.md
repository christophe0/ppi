# Pi in Podman

Let's make sure *pi* doesn't delete your home directory.

![Oops — I accidentally ran `rm -rf ~`](oops.png)

## Usage

```
podman build -t ppi .
echo 'alias ppi=\'podman run --rm -it --read-only --tmpfs /tmp:rw,nosuid -v ~/.pi/agent:/pi-agent:rw -e PI_CODING_AGENT_DIR=/pi-agent -e HOME=/tmp -v ~/.gitconfig:/tmp/.gitconfig:ro -v "$(pwd):/workspace:rw" --cap-drop ALL --security-opt no-new-privileges --network slirp4netns --userns keep-id --user "$(id -u):$(id -g)" ppi\'' >>~/.bash_aliases
source ~/.bashrc
cd /my/project
ppi
```

## Warning

`~/.pi/agent` holds your provider keys, sessions, and extension code. Mounting it `:rw` means every command the agent runs can read and rewrite those files.

## Resources

- [Run Pi safely](https://pi.dev/docs/latest/security)
- [Run Pi in an isolated environment](https://pi.dev/docs/latest/containerization)
- [podman-run - Run a command in a new container](https://docs.podman.io/en/latest/markdown/podman-run.1.html)
- [node:24-slim](https://hub.docker.com/layers/library/node/24-slim/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)
