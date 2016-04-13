Netuitive Linux Agent Omnibus project
===============================
This project creates full-stack platform-specific packages for
`netuitive-agent`!


Usage
-----


# Build

    make build # build rpm & deb package


If all goes well, you will have rpm and deb packages in dist/ & testing/dist/

### Omnibus S3 Dependence Cache
If you want to use the S3 Dependency Cache create a ```local.sh``` in the root project
directory that has your AWS access/id Keys and bucket name.

    # example local.sh
    export AWS_ACCESS_KEY_ID=my-aws-access-id
    export AWS_SECRET_ACCESS_KEY=my-aws-secret-key
    export AWS_S3_BUCKET=my-s3-bucket


# Testing

    make test # test packages generated from the build step with the support distros

# Other commands

    make clean # clean up after builds & tests

