# AWS Lambda Layer Factory

Helper script to create Python dependency layers for AWS lambda functions

### How to:

1. Adjust `requirements.txt` to reflect your dependencies
2. Adjust python version in `Dockerfile` if neccessary
3. Run `chmod +x create_layer.sh` to make the bash script executable
4. Run `./create_layer.sh <YOUR_LAYER_NAME>`

### Prerequisites:

- Unix-like operating system
- Docker installed
