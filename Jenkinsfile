#!/usr/bin/env groovy
@Library("shared@master")
import com.vi.pipeline.common.Echo

pipeline {
  agent { label 'docker' }
  stages {
    stage('test') {
      steps {
        Echo echo = new Echo(this)
        echo.info('Hello world!')
      }
    }
  }
}
