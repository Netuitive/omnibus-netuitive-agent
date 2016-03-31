Netuitive Linux Agent Omnibus project
===============================
This project creates full-stack platform-specific packages for
`netuitive-agent`!


Usage
-----
# Build

     ./build.sh all # or rpm or deb

If all goes well, you will have rpm and deb packages in dist/

### Omnibus S3 Dependence Cache
If you want to use the S3 Dependency Cache create a ```local.sh``` in the root project
directory that has your AWS access/id Keys and bucket name.

    # example local.sh
    export AWS_ACCESS_KEY_ID=my-aws-access-id
    export AWS_SECRET_ACCESS_KEY=my-aws-secret-key
    export AWS_S3_BUCKET=my-s3-bucket


# Testing

    cd testing
     ./runtest.sh all # or centos6 or debian8, etc


If all goes well, you will have < distro >.pass files in the testing directory

