# PHP-sshd
PHP remote interpreter with Alpine Linux.

**Only for developing**.

## How to use

### Connect to ssh

1. Run image:

    ```
    docker run -d --name my-php-project -p <your-ssh-port>:22 -v "$PWD":/var/www eugenes1/php-sshd
    ```
    
2. Connect to the image over ssh with credentials:

    * user: `root`
    * password: `root`

### Use as remote interpreter

- Php interpreter dir: `/usr/local/bin/php`
- Project path: `/var/www`