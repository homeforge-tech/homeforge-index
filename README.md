# homeforge-index

The official plugin index of [homeforge](https://github.com/homeforge-tech/homeforge): every core reads
`https://raw.githubusercontent.com/homeforge-tech/homeforge-index/main/index.json` by default, and its entries show as
"official" in the store. Changes come by pull request.

## Format

`index.json` (version 1; unknown fields are refused):

```json
{
  "version": 1,
  "plugins": [
    {
      "id": "xcp-ng",
      "name": "XCP-ng",
      "description": "VMs, snapshots and app disks on an XCP-ng host.",
      "author": "homeforge-tech",
      "repo": "https://github.com/homeforge-tech/homeforge-plugins",
      "icon": "https://… (https only, optional)",
      "versions": [
        {
          "version": "0.1.0",
          "image": "ghcr.io/homeforge-tech/homeforge-xcp-ng@sha256:<64 hex>",
          "api": "v1alpha1",
          "provides": ["hypervisor", "snapshots", "storage"],
          "permissions": [{"scope": "apps:read"}]
        }
      ]
    }
  ],
  "templates": []
}
```

- `image` is **pinned by digest**; `api`, `provides` and `permissions` must match the image's manifest label exactly, or
  the core refuses to install it.
- Versions are semver; a core only updates a plugin forward, and only from the index it was installed from.
- `templates` are app templates (see homeforge's `kit/index/index.json`).

## Checking a change

```sh
make check   # validates index.json with the core's own parser (needs Go and ../homeforge)
```
