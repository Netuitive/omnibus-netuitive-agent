Netuitive Linux Agent Omnibus
===============================

The Omnibus creates full-stack platform-specific packages for use with the Netuitive Linux Agent. The agent itself provides a quick way deploy and collect metrics with a richer set of metadata out of the box. The agent also is compatible with a large number of collectors that help [Netuitive](https://www.netuitive.com) integrate with many different products running on a Linux OS.

For more information on the [Netuitive Linux Agent](https://help.netuitive.com/Content/Misc/Datasources/Netuitive/new_netuitive_datasource.htm), see our help docs, or contact Netuitive support at [support@netuitive.com](mailto:support@netuitive.com).

Building the Omnibus<a name="build"></a>
---------------------

`make build` builds RPM and Debian packages. If it builds properly, you will have RPM and Debian packages in `dist/` and `testing/dist/`.

Additional Information
-----------------------

### Testing

`make test` tests packages generated from the [build step](#build) with the support distros.

### Omnibus S3 Dependence Cache
If you want to use the S3 Dependency Cache, create a `local.sh` in the root project
directory that has your AWS access/id Keys and bucket name.

    # example local.sh
    export AWS_ACCESS_KEY_ID=my-aws-access-id
    export AWS_SECRET_ACCESS_KEY=my-aws-secret-key
    export AWS_S3_BUCKET=my-s3-bucket

### Other commands

`make clean` cleans up after builds and tests.

