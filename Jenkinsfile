pipeline {
    agent any

    environment {
        DEVELOPER_DIR = "/Applications/Xcode.app/Contents/Developer"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Decode GoogleService-Info.plist') {
            steps {
                script {
                    if (fileExists('encoded_plist.txt')) {
                        sh 'base64 --decode -i encoded_plist.txt -o GoogleService-Info.plist'
                    } else {
                        echo 'encoded_plist.txt not found'
                    }
                }
            }
        }
        stage('Verify GoogleService-Info.plist') {
            steps {
                sh 'ls -a'
            }
        }
        stage('Build iOS App') {
            steps {
                sh '''
                    xcodebuild -workspace RxAlamofire.xcworkspace \
                               -scheme RxAlamofire \
                               -sdk iphonesimulator \
                               -destination "platform=iOS Simulator,name=iPhone 16 Pro,OS=18.1" \
                               clean build \
                               CODE_SIGN_STYLE=Automatic
                '''
            }
        }
        stage('Start Simulator') {
            steps {
                sh ' open -a Simulator'
            }
        } 
    }

    post {
        always {
            echo 'Cleaning up...'
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}