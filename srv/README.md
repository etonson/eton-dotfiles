# srv

Small, stateless-first interface for named remote environments.

```bash
srv envs
srv info gtky
srv resolve gtky app
srv get gtky app ./ptpms.log
srv put gtky deploy ./gtky.war
srv exec gtky "hostname"
```

The canonical form includes the environment in every command. For interactive
use only, `srv use gtky` stores a default in `${XDG_STATE_HOME:-~/.local/state}/srv/current`.

Profiles default to `~/company/remote-file/<environment>/<environment>.conf`.
Override the root with `SRV_CONFIG_HOME`. Existing variables such as `SSH_HEAD`,
`BASE`, `GET_PATH`, `GET_LOG`, and `TARGET_PATH` are supported. New profiles may
use `HOST`, `USER`, `PORT`, and role variables such as `PATH_LOG` or `PATH_DEPLOY`.

Start from `examples/profile.conf.sample`. The installer only creates the empty
configuration root; real company profiles are intentionally not stored here.
