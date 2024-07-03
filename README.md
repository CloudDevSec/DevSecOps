# DevSecOps Project

This project demonstrates a comprehensive DevSecOps setup that includes automated backups, performance monitoring, and infrastructure as code (IaC) using Terraform.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Infrastructure](#infrastructure)
- [Backup and Restore](#backup-and-restore)
- [Monitoring](#monitoring)
- [CI/CD](#cicd)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

This project includes:
- A Flask application with Prometheus metrics for performance monitoring.
- Automated backups using AWS Lambda and S3.
- Infrastructure as code (IaC) with Terraform.
- Security and compliance checks using GitHub Actions.

## Features

- **Automated Backups**: Scheduled AWS Lambda function to backup data to an S3 bucket.
- **Performance Monitoring**: Integrated Prometheus metrics in the Flask application.
- **Infrastructure as Code**: Manage AWS resources using Terraform.
- **Security and Compliance**: CI/CD pipeline with security checks using Bandit and Safety.

## Setup and Installation

### Prerequisites

- Python 3.9+
- Terraform 1.0+
- AWS CLI configured with appropriate credentials
