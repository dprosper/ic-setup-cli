# Configure IBM Cloud CLI

A GitHub action to configure the IBM Cloud CLI and install plug-ins. It is usually used to integrate with your custom workflow or other IBM Cloud GitHub actions:

* [Create, Update and Delete to IBM Cloud Code Engine](https://github.com/dprosper/icce-cud-cli)

## Usage

```yml
      - name: Configure IBM Cloud CLI
        uses: dprosper/ic-setup-cli@v0.1.2
        with:
          API_KEY: ${{ secrets.API_KEY }}
          INSTALL_PLUGINS: code-engine,container-service
          REGION: eu-de
          RESOURCE_GROUP: solutions
```

### Inputs

| Name | Description | Default |
| --- | --- | --- |
| `API_KEY` | API Key used for login. | |
| `INSTALL_PLUGINS` | Comma separated list of plug-ins to install. Obtain a list of available plug-ins in the [documentation](https://cloud.ibm.com/docs/cli). | |
| `REGION` | Name of region, such as 'us-south' or 'eu-gb'. | `us-east` |
| `RESOURCE_GROUP` | Resource Group Name or ID. | `default` |

> Note: Only the IBM Cloud official plug-in repository is supported in this action.

## Documentation

- [Examples](docs/examples.md)

## Versioning

For this action you can lock the version to use by specifying it like this: `dprosper/ic-setup-cli@v0.1.2`. 

This action will always install the latest versions of the CLI and selected plug-ins. If you really need to, you can control the version of a plug-in used by specifing a specific version like this: `code-engine@v1.28.0`.

## License

[Apache Version 2.0](LICENSE)