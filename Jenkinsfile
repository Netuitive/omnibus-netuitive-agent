#!/usr/bin/env groovy
@Library("shared@master")

pipeline {
  agent { label 'docker' }
  stages {
    stage('test') {
      steps {
        echo 'Hello world!'
      }
    }
  }
}
